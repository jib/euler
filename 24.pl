# http://projecteuler.net/index.php?section=problems&id=24
# 
# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
# 
# 012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

### we can find the digits by deducing their position
### there are a total of 10! permutations:                          3.628.800
### any string starting with 0... there for has 9! permutations:      362.880
### since 1.000.000 / 362.880 < 3, the first string starts with digit 2, etc

use strict;
use warnings;

use Data::Dumper;
use Math::BigInt;

my $Idx     = 1000000 - 1;  # index position. offset by -1 to compensate for
                            # array index starting with 0, not 1 (like humans count)
my @Digits  = 0..9;         # digits to work with;
my $String  = '';           # the final string

while( @Digits ) {
# print "Remaining digits: @Digits\n";
# print "String is currently: $String\n";
# print "Index is currently: $Idx\n";

    ### factorial of digits - 1 shows us the division in equal chunks
    ### of possible permutations
    ### ie, for 0, 1 and 2 a string starting with 0 has (3-1)! permutations,
    ### same with one starting with 1, etc.
    ### we use this factorial as an index, ie the how-many'th chunk
    ### in the list of options we need to access
    my $num = Math::BigInt->new( scalar(@Digits) - 1 )->bfac;

#print "Max permutations left: $num\n";
    
    ### find the item in the list that should be in this position
    my $pos = int( $Idx / $num );
    
#print "Index of next string element: $pos\n";
    
    ### remove this item from the list
    $String .= splice( @Digits, $pos, 1 );
         
    ### look for the next index, from the next position onwards         
    $Idx = $Idx % $num;         

#print $/.$/;    
    
}

print "\n\nString = $String\n";


