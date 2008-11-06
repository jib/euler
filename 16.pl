# http://projecteuler.net/index.php?section=problems&id=16
# 
# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2**1000?

use strict;
use warnings;
use Data::Dumper;
use Math::BigInt;
$|++;

### how to solve this without bigint?
my $power = Math::BigInt->new(2);
$power->bpow(1000);

my $sum;
$sum += $_ for split '', $power;

#print "normal: ". 2**1000 .$/;
#print "bigint: $power\n";

print $sum;
