# http://projecteuler.net/index.php?section=problems&id=14
#
# The following iterative sequence is defined for the set of positive integers:
# 
# n n/2 (n is even)
# n 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 13 40 20 10 5 16 8 4 2 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

use strict;
use warnings;
use Data::Dumper;

my $Max         = shift || 13;  # which number range to check
my %Chain       = ();           # chain cache
my $HighPair    = [0,0];        # highest pair found

my $i = 1;
while( $i < $Max ) {
    my $chain = 0;
    chain( $i, \$chain );

    ### set the highest pair
    $HighPair = [ $i, $chain ] if $HighPair->[1] < $chain;
    
    $i += 2;    # skip even numbers, they make short chains
}

print "Highest pair is $HighPair->[0] with length $HighPair->[1]\n";

sub chain {
    my $num         = shift;
    my $cur_chain   = shift or die "Need chain for $num";   # chain until now
    my $my_chain    = 0;                                    # chain from me onward

    ### do we have the chain from here cached?
    if( my $length = $Chain{$num} ) { 
        $$cur_chain += ($length + 1);
        return;
        
    ### terminal case        
    } elsif ( $num == 1 ) {
        $$cur_chain++;
        return;
    }
    
    ### if not, compute the chain from here
    ### what is the next number?
    my $new = $num % 2 ? 3*$num + 1 : $num / 2;
    chain( $new, \$my_chain );

    ### append to the chain what we found
    $$cur_chain += ($my_chain + 1);
    
    ### store my chain
    $Chain{$num} = $my_chain;

    return;
}

__END__




    my $aref    = shift || [];

    return $Chain{$num} if $Chain{$num};    # cache

    if( $num == 1 ) {                       # tail case
        push @$aref, 1;
        return;
    }        
    
    ### next case in the chain is:
    my $new = $num % 2 ? 3*$num + 1 : $num / 2;
    push @$aref, $num;
    
    chain( $new, $aref ) or do {
        ### set the highest pair
        $HighPair = [ $num, scalar(@$list) ] if $HighPair->[1] < scalar(@$list);
   

   
        return;
    }
    
   
    
    
    return $list;
}

print "Num $HighPair->[0] has length $HighPair->[1]\n";
        
