# http://projecteuler.net/index.php?section=problems&id=10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

# from: http://en.wikipedia.org/wiki/Primality_test
# So a more efficient method is to test if n is divisible by 2 or 3, then to check 
# through all the numbers of form 6k ± 1 =< sqrt n. This is 3 times as fast as the
# previous method.


use strict;
use warnings;
use Data::Dumper;
$|++;

my $Max = 2000000;              # all primes up to $Max
my $Sum = 2 + 3;                # only non-odd prime + first prime which is 
                                # in factors

my @Factors = (3);              # list all factors we should check < $Max

FACTORS: {   
    my $i = 0;
    my $sqrt = sqrt($Max);
    while( ++$i ) {
        for my $offset ( -1, 1 ) {    
            my $factor = 6*$i + $offset;        # possible prime number

            last FACTORS if $factor >= $sqrt;   # max number reached;
            
            push @Factors, $factor;
        }
    }
}    

PRIMES: {
    my $i = 3;
    while ($i < $Max) {
        
        my $sqrt = sqrt($i);                        # one factor must be =< sqrt
        
        my $flag = 1;
        for my $p ( @Factors ) {
            last              if $p > 3 and $p > $sqrt;     # factor too big
            ($flag = 0, last) unless $i % $p;               # dividable, not a prime
        }

        if( $flag ) {
            print "Found prime: $i\n";
            $Sum += $i;                             # add the prime
        }
        
        $i += 2;                                    # +2, skip even numbers
    }
}        

print "Sum = $Sum\n";

__END__






my $Sum = 2;                    # only non-odd prime

my $i = 3;
while ($i < 2000000) {
    
    print '.' unless $i % 999;
    
    my $flag = 1;
    
    for my $p ( @Primes ) {  

        unless( $i % $p ) {
            $flag = 0;
            last;
        } 
    }             

    do { $Sum += $i ; push @Primes, $i } if $flag;    
    
    $i += 2
}

print Dumper \@Primes;

print $Sum;
