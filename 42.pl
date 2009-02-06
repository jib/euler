# http://projecteuler.net/index.php?section=problems&id=42
# 
# The n^(th) term of the sequence of triangle numbers is given by, t_(n) =
# ½n(n+1); so the first ten triangle numbers are:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For example,
# the word value for SKY is 19 + 11 + 25 = 55 = t_(10). If the word value is a
# triangle number then we shall call the word a triangle word.
# 
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
# containing nearly two-thousand common English words, how many are triangle
# words?

use strict;
use warnings;
use Data::Dumper;

my $Hits;       ### triangle word counter

                ### first 500 triangle numbers
my %Triangles = do { my $i; map { $i += $_; $i => $i } 1..500 };

                ### CSV file with quoted words, in CAPS
my @Words     = do { local $/=','; 
                     open my $fh, shift or die "Need file";
                     map { s/"//g; $_ } <$fh>;
                };
                
for my $word ( @Words ) {                
    ### score is the ascii value minus 64
    my $score;
    $score += (ord($_) - 64) for split '', $word;

    ### found one if this is a known triangle score
    $Hits++ if $Triangles{$score};
}

print "Hits: $Hits\n";
