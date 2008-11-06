# http://projecteuler.net/index.php?section=problems&id=213
# 
# A 3030 grid of squares contains 900 fleas, initially one flea per square.
# When a bell is rung, each flea jumps to an adjacent square at random (usually 4 possibilities, except for fleas on the edge of the grid or at the corners).
# 
# What is the expected number of unoccupied squares after 50 rings of the bell? Give your answer rounded to six decimal places.

use strict;
use warnings;
use Data::Dumper;

my $Grid    = 30;               # grid length, also height
my $Size    = $Grid * $Grid;    # grid size
my @Squares = (1) x ($Size);    # all squares
my $Jumps   = shift || 50;      # number of flea jumps




for (1..$Jumps) {
    
    my @new;                    # new flea positions
    my $pos;                    # position in the grid
    for my $fleas ( @Squares ) {
        $pos++;


sub mutations {
    my $pos = shift or return;
    
                ### top left corner => right, down
    my @mut =   $pos == 1               ? ( $pos + 1, $Grid + 1 ) :   
                
                ### top right corner => left, down
                $pos == $Grid           ? ( $Grid - 1, $Grid + $Grid ) :   
                
                ### on the top bar => right, left, down
                $pos < $Grid            ? ( $pos - 1, $pos + 1, $pos + $Grid ) :
                
                ### bottom left corner  => up, right
                $pos == ($Size - $Grid) ? ( $pos - $Grid, $pos + 1 ) :
                
                ### bottom right corner => up, left
                $pos == $Size           ? ( $pos - $Grid, $pos - 1 ) :
                
                ### on the bottom bar => left, right, up
                $pos > ($Size - $Grid)  ? ( $pos - 1, $pos + 1, $pos - $Grid ) :
                
                ### on the left side => right, up, down
                $pos % $Grid == 1       ? ( $pos + 1, $pos - $Grid, $pos + $Grid ) :
                
                ### on the right side => left, up, down
                $pos % $Grid == 0       ? ( $pos - 1, $pos - $Grid, $pos + $Grid ) :

                ### normal square   => left, right, up, down
                ( $pos + 1, $pos - 1, $pos + $Grid, $pos - $Grid );

    return @mut;   
}    
                
__END__

    ### bottom edge
    } elsif ( $pos <= $Size and $pos >= ($Size - $Grid) ) {

        @mut =  $pos 
        
    
    ### left side
    } elsif ( $pos % $Grid == 1 ) {
    
    ### right side
    } elsif ( $pos % $Grid == 0 ) {
    
    ### normal square
    } else {
           
   
        ### top edge
        if( $pos =< $Grid ) {
            
            ### top right corner
            if( $pos == 1 ) {               
                $new[ $pos + 1  ] += $Squares[$pos]/2; # 50% to the right
                $new[ $Grid + 1 ] += $Squares[$pos]/2; # 50% down
            
            ### top left corner             
            } elsif ( $pos == $Grid ) { 
                $new[ $Grid - 1 ]       += $Squares[$pos]/2;    # 50% to the left
                $new[ $Grid + $Grid ]   += $Squares[$pos]/2;    # 50% down

            ### somewhere on the upper bar
            } else {
                $new[ $pos - 1 ]        += $Squares[$pos]/3;    # 33% to the left
                $new[ $pos + 1 ]        += $Squares[$pos]/3;    # 33% to the right
                $new[ $pos + $Grid ]    += $Squares[$pos]/3;    # 33% to the down
            }


