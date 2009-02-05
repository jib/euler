# http://projecteuler.net/index.php?section=problems&id=36
# 
# The decimal number, 585 = 1001001001_(2) (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

use strict;
use warnings;
use Data::Dumper;

my $total;
for ( 1..1000000 ) {
    next if $_ ne reverse $_;       # base 10 is not palyndromic

    my $bin = dec2bin( $_ );
    next if $bin ne reverse $bin;   # base 2 is not palyndromic
    
    $total += $_;
}

print $total;
 
sub dec2bin { 
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
}    
