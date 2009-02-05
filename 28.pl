# http://projecteuler.net/index.php?section=problems&id=28
# 
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 
# spiral is formed as follows:
# 
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
# 
# It can be verified that the sum of both diagonals is 101.
# 
# What is the sum of both diagonals in a 1001 by 1001 spiral formed in the same way?

=comment

keep track of:
    width                       (1001x1001)
    total                       sum of the diagonals
    max radius                  (1001)
    current number on corner    (to add to $total)

=cut

my $Total   = 1;        # starting total; center number
my $Radius  = 1001;
my $Width   = 1;
my $Current = $Total;   # we start with a 'current' number of 1

while( $Radius > $Width ) {         # keep adding if we are not at max radius
    $Width += 2;                    # compute the next spiral

    for( 1..4 ) {                   # for every following corner
        $Current   += ($Width - 1); # next corner number
        $Total     += $Current;     # add this to the total
    }
}

print $Total;    
