# http://projecteuler.net/index.php?section=problems&id=20
# 
# n! means n  (n  1)  ...  3  2  1
# 
# Find the sum of the digits in the number 100!

use strict;
use warnings;
use Data::Dumper;
use Math::BigInt;
$|++;

### how to solve this without bigint?
my $power = Math::BigInt->new(100);
$power->bfac;

my $sum;
$sum += $_ for split '', $power;

#print "normal: ". 2**1000 .$/;
#print "bigint: $power\n";

print $sum;
