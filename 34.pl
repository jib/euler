# http://projecteuler.net/index.php?section=problems&id=34
# 
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

use strict;
use warnings;
use Data::Dumper;
use Math::BigInt;

### precomputed list of factorials from 0 -> 9
my @Fac = map { Math::BigInt->new( $_ )->bfac->numify } 0..9;

### apparently a 7 digit number is an acceptable upper boundary, but the
### proof is unclear. See also:
### http://mathworld.wolfram.com/Factorion.html

{   my @matches;
    for my $length (2..7) {         
        combinations($length, 1, \@matches);
    }
    
    print Dumper \@matches;
}

sub combinations {
    my $length  = shift;
    my $offset  = shift || 0;
    my $matches = shift or return;
    my @ongoing = @_;


    ### continue recursing?
    if( $length ) {
        for my $num ( $offset .. (scalar(@Fac) - 1) ) {

            ### shortcut: don't process numbers if the length 
            ### of the digits is < the length of the factorial
            ### of the number we are looking for
            return if ($length + scalar @ongoing) < length $Fac[$num];

            combinations( $length - 1, 0, $matches, @ongoing, $num );
        }
        
    ### print out the value
    } else {
        my $num = join '', @ongoing;
        my $sum = 0;
        $sum   += $Fac[$_] for @ongoing;
        
        if( $sum == $num ) {
            print "[MATCH] $num\n";
            push @$matches, $num;
        }
    }        
}



__END__
### XXX what's the terminating condition???
### no numbers under 10 can be a sum, so skip those
{   for my $length ( 2 ) {
        foo( $length, 1 );
    }
}

sub foo {
    my $length = shift;                         # how many digits to use
    my $offset = shift || 0;                    # start at 0 or 1 in Fac
    my $aref   = shift || [];                   # digits used so far

    ### end of our recursion, evalute the numbers
    unless( $length > 0 ) {
        my $sum;
        $sum   += $Fac[$_] for @$aref;
        my $num = join '', @$aref;

        print "[MATCH] " if $num == $sum;        
        print "Num = $num -- Sum = $sum\n";
     
    ### else, recurse further  
    } else {
        while( $length > 0) {
            for my $i ( $offset .. length(@Fac) ) { # for every factorial
                $length--;                          # recursion needs one less length
    
                my @list = (@$aref, $i);            # we use this number as well and ...

print "Recursing with length $length and number: @list\n";
                foo( $length, 0, $aref );           # recurse
            }        
        }
    }
}    
   
