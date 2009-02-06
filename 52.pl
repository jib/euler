# http://projecteuler.net/index.php?section=problems&id=52
# 
# It can be seen that the number, 125874, and its double, 251748, contain exactly the same 
# digits, but in a different order.
# 
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same 
# digits.

use strict;
use warnings;
use Data::Dumper;

my $i = 0;          # integer counter;
while( ++$i ) {     # pre-increment, or statement won't be true
    my %seen;       # combinations found;
    
    for my $n ( 2..6 ) {
        ### sort the digits in order, mark this sequence as seen
        $seen{ join '', sort split '', $n * $i }++;
    }
    
    ### we found our result if we only have 1 entry in %seen;
    last if scalar keys %seen == 1; 
}

print "Int: $i\n";
