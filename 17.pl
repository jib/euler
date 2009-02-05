# http://projecteuler.net/index.php?section=problems&id=17
# 
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there 
# are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of 
# "and" when writing out numbers is in compliance with British usage.

use strict;
use warnings;

### empty entries so we can look up by index
my @single = ('', qw[ one two three four five six seven eight nine] );
my @teens  = qw[ten eleven twelve thirteen fourteen fifteen sixteen seventeen
                eighteen nineteen];
my @double = ('','', qw[twenty thirty forty fifty sixty seventy eighty ninety] );

my $Total;
for( 1..999 ) {   
    my @str = num_to_str( $_ );

    print join " ", @str;
    print " length $_: " . length(join('', @str)). $/;

    $Total += length join '', @str;
}
$Total += length( 'one thousand' ) - 1;

print $Total;


sub num_to_str {
    my $num     = shift;
    my @parts   = split //, $num;
    my @str;
    
    ### special case, it's in the teens
    if( $parts[-2] and $parts[-2] == 1 ) {
        unshift @str, $teens[ $parts[-1] ];    # index is the last digit of the num   
    } else {
        unshift @str, $single[ $parts[-1] ];
        unshift @str, $double[ $parts[-2] ] if $parts[-2];
    }
    
    ### only add 'and' if there's a number following 
    unshift @str, 'and' if $parts[-3] and ($parts[-2] or $parts[-1]);
    
    unshift @str, $single[ $parts[-3] ], qw[hundred] if $parts[-3];

    return grep { length } @str;
}
