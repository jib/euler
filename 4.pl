# http://projecteuler.net/index.php?section=problems&id=4
# 
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

use strict;
use warnings;
use Data::Dumper;

my $Res  = 0;       # place holder for highest factor
my $Min  = 100;     # a 4-digit number has min 10, 6-digit 100, etc         
my $Max  = 999;     # a 4-digit number has max 99, 6-digit 999, etc
                    # all palindrome numbers
my @Nums = map { my $n = $_ . reverse($_); $n } $Min .. $Max;  

for my $n ( reverse @Nums ) {                   # for all numbers. reverse so that
                                                # first found is highest palindrome
    for my $try ( $Min .. $Max ) {              
    
        unless( $n % $try ) {                   # divides cleanly 
            next if ($n/$try) > $Max;           # companion is too large
                                                # First result is highest one    
            die sprintf "Palindrome %s is product of %s x %s",
                $n, $try, ($n/$try);
        }
    }        
}
    
