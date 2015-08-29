# http://projecteuler.net/index.php?section=problems&id=7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10001st prime number?

use strict;
use warnings;
use Data::Dumper;
$|++;

my @Primes;                     # pre-computed list holding all primes

my $i = 1;
my $found;
while ($i++) {

    my $flag = 1;
    for my $p ( @Primes ) {
        $i % $p || ( $flag = 0, last ); # undevidable, not a prime
    }

    do { $found++; push @Primes, $i } if $flag;

    last if $found == 10001;
}

print pop @Primes;
