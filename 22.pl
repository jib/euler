# http://projecteuler.net/index.php?section=problems&id=22
# 
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 53 = 49714.
# 
# What is the total of all the name scores in the file? 

use strict;
use warnings;
use Data::Dumper;

### total value of the 'score'
my $count = 0;          

### file containing names
open my $fh, "22/names.txt" or die "Could not open file: $!";

### A => 1, B => 2, etc
my %abc = map { $_ => ord($_) - 64 } "A".."Z";

my $i = 0;
for my $name ( sort grep { length } split /[",]+/, <$fh> ) {
    $i++;   
    
    ### add score of individual letters
    my $val = 0;
    $val += $abc{$_} for split '', $name;
    
    ### add it to the count
    $count += $val * $i;
}    

print "Total score = $count\n";
