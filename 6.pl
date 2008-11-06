# http://projecteuler.net/index.php?section=problems&id=6
# 
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# 
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# 
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

use strict; 
use warnings;

my($sum, $square);

for ( 1..100 ) {
    $sum += $_;         # just add, do the square later
    $square += $_ ** 2; # add all the sqaures now
}

### subtract the square
print $sum ** 2 - $square;
