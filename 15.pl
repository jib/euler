# http://projecteuler.net/index.php?section=problems&id=15
# 
# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# How many routes are there through a 20x20 grid?

use strict;

my $Width   = 20;       # grid width and height
my $Count   = 0;        # amount of options available

### XXX brute forcing -- is there a better way to calculate this?

traverse( 0, 0 );       # traverse the grid, starting at this position

sub traverse {
    my $x = shift || 0;
    my $y = shift || 0;

    print "At position $x, $y\n";

    ### up the count if we managed to reach the destination
    if( $x == $Width && $y == $Width ) {
        $Count++; 
        print "----Arrived at $x,$y => Count = $Count\n";
    }

    ### go right if possible
    if( $x < $Width ) {
        my $new = $x + 1;
        print "    Going to $new, $y\n";
        traverse( $new , $y );
    }        

    ### go down if possible
    if( $y < $Width ) {
        my $new = $y + 1;
        print "    Going to $x, $new\n";
        traverse( $x , $new );
    }
}

print "Total paths: $Count\n";
