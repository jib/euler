# http://projecteuler.net/index.php?section=problems&id=18
#
# By starting at the top of the triangle below and moving to adjacent numbers on the row 
# below, the maximum total from top to bottom is 23.
# 3
# 7 5
# 2 4 6
# 8 5 9 3
# 
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:

use strict;
use warnings;
use Data::Dumper;

### either default triangle, or one provided as file on input
my $triangle = @ARGV ? do { open my $fh, $ARGV[0] or die; local $/; join '', <$fh> }
                     : q[
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
];

# my $triangle = q[
#    3
#   7 5
#  2 4 6  
# 8 5 9 3
# ];


# 
# 8 5 9 3
#  2 4 6      10 13 15    20|23 21|23  23 23  => 23 
#   7 5         10 8
#    3


### parsed version of the triangle
my @triangle;
for my $line ( split $/, $triangle ) {
    next unless $line =~ /\S+/;                 # skip whitespace only
    $line =~ s/^\s+//;                          # remove leading and
    $line =~ s/\s+$//;                          # trailing whitespace

    ### an array ref for every line of numbers
    my @items = split /\s+/, $line;
    
    ### store them reversed, so we can calculate optimal paths
    unshift @triangle, \@items;
}

while( @triangle > 1 ) {
    @triangle = compress_triangle( @triangle );
}

print "Highest value is " . join " ", @{ $triangle[0] };


sub compress_triangle {
    my @list = @_;      # uncompressed triangle
    my @rv;             # our return value, with one level of compression

#warn "Input: ". Dumper \@list;

    ### start compressing
    while( @list ) {
    
        ### only 1 row left, then add it to result and return
        if( @list == 1 ) {

#warn "Single row remaining: " . Dumper \@list;

            push @rv, @list;
            last;
        }            
    
        ### 2 rows to compress; row1 will always have one more item than
        ### row2, so we'll reduce row1 + row2 to the amount of numbers in
        ### row2, with the 'maximum' value they can achieve for having the
        ### highest number in row1 added to them.
        my $row1 = shift @list;
        my $row2 = shift @list;

        ### our new compressed row
        my @compressed;

        ### position counter
        my $i = 0;
        for my $num ( @$row2 ) {
            my $x = $num + $row1->[$i];     # take a 'left'
            my $y = $num + $row1->[$i+1];   # take a 'right';
            
            push @compressed, $x > $y ? $x : $y;
            
            $i++;                           # next position
        }

#warn "Condensened:\n\t@$row2\n\t@$row1\nto:\n\t@compressed\n";        
        
        ## add the new compressed row;
        unshift @list, \@compressed;
    }
    
#warn "Output: " . Dumper \@rv;    
    return @rv;
}



            
    
    
