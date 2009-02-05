# http://projecteuler.net/index.php?section=problems&id=48
# 
# The series, 1^(1) + 2^(2) + 3^(3) + ... + 10^(10) = 10405071317.
# 
# Find the last ten digits of the series, 1^(1) + 2^(2) + 3^(3) + ... + 1000^(1000).

use strict;
use warnings;
use Data::Dumper;
use Math::BigInt;

my $Total = Math::BigInt->new(0);
for( 1..1000 ) {
    my $num = Math::BigInt->new( $_ );      # 1000 ** 1000 is too big for
    $num->bpow( $_ );                       # plain perl
    $Total->badd( $num );
}

print substr( $Total, -10, 10 );

