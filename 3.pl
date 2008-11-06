# http://projecteuler.net/index.php?section=problems&id=3
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?
#
# Followed explenation from: http://www.mathsisfun.com/prime-factorization.html
use strict;
use warnings;
use Data::Dumper;
$|++;

my $Num         = 600851475143; # target number
my $MaxPrime    = 10e3;         # highest pre-computed prime
my @Primes;                     # pre-computed list holding all primes
my @Factors;                    # the prime factors for our target

### quick list of all primes < 10k
for my $q ( 2 .. $MaxPrime ) {
    my $flag = 1;
    for my $p ( @Primes ) {  
        $q % $p || ( $flag = 0, last ); # undevidable, not a prime
    }             

    push @Primes, $q if $flag;    
}

warn join $/, @Primes;

while( $Num > 1 ) {
    die "No primes left to try" unless @Primes;

    ### find the smallest prime that will divide this number
    while( my $p = shift @Primes ) {
        ### keep going until we can't divide cleanly anymore
        until( $Num % $p ) {
            push @Factors, $p;      # store this prime
    
            $Num = $Num / $p;       # set the new number
        }
    }
}    

print join $/, @Factors
