# http://projecteuler.net/index.php?section=problems&id=5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

use strict;
use warnings;

### all numbers that are dividable by 1..20 are also dividable by 11..20,
### so use a subset
my $Min     = 11;
my $Max     = 20;
my $Iter    = $Max;                 # lowest starting point

LOOP: while(1) {
    $Iter += $Max;                  # minimum incrementation step to use
    
    for ( $Min .. $Max ) {
        next LOOP if $Iter % $_;    # there was a remainder after the divide   
    }
    
    ### if we got here, we have a number that divides evenly by all
    print $Iter;
    last;
}
