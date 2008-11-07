# http://projecteuler.net/index.php?section=problems&id=15
# 
# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# How many routes are there through a 20x20 grid?

use strict;
use Data::Dumper;
use Math::BigInt;

my $Width   = shift || 2;   # grid width and height
my $Count   = 0;            # amount of options available
my @Routes  = ();           # collection of routes taken

### XXX brute forcing -- is there a better way to calculate this?

### See http://www.joaoff.com/2008/01/20/a-square-grid-path-problem/:
### (2x20)! / (20! * 20!);

print Math::BigInt->new(2 * $Width )->bfac / 
    ( Math::BigInt->new($Width)->bfac * Math::BigInt->new($Width)->bfac );


__END__

traverse( 0, 0 );       # traverse the grid, starting at this position

sub traverse {
    my $x = shift || 0;
    my $y = shift || 0;
    my $l = shift || 0;
    my $r = shift || [];

    my $indent = '  ' x $l;

    $r->[ $x + ($y*$Width) + $y ] = ' * ';

    ### up the count if we managed to reach the destination
    if( $x == $Width && $y == $Width ) {
        $Count++; 
        #print "----Arrived at $x,$y => Count = $Count\n";
        push @Routes, $r;
        return;
    }

    ### go right if possible
    if( $x < $Width ) {
        my $new = $x + 1;
        #print $indent . "  Going to $new, $y\n";
        traverse( $new , $y, $l + 1, [ @$r ] );
    }        

    ### go down if possible
    if( $y < $Width ) {
        my $new = $y + 1;
        #print $indent . "  Going to $x, $new\n";
        traverse( $x , $new, $l + 1, [ @$r ] );
    }
}

### pretty print the routes
my %seen;
for my $r (@Routes) {

    my $str;
    my $i;    
    for my $el (@$r) {
        $i++;
        $str .= $el ? $el : '   ';
        $str .= $/ unless $i % ($Width + 1);
    }

    print $str;
    print "\n\n================\n\n";
    die "$str seen too often" if $seen{$str}++;
}


print "Total paths: $Count\n";

__END__

every point has 2 choices
except on the right hand side => 1
except on the bottom row      => 1

2   => 6        2*2*2 + 2 = 8
3   => 20       2*3*3 + 2 = 20
4   => 70       2*4*4 = 32
5   => 252
6   => 924
7   => 3432



