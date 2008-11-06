# http://projecteuler.net/index.php?section=problems&id=9
#
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a2 + b2 = c2
# 
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

use strict;
use warnings;
$|++;
my $Num = 1000;

### a**2 + b**2 = c**2                      AND
### a+b+c = 1000                            =>
### a**2 + b**2 = (-a -b + 1000)**2         =>
### a**2 + b**2 = a**2 +ba -1000a + b**2 +ab -1000b -1000a -1000b + 1000000 =>
### 0 = 2ba -2000b -2000a + 1000000


### a**2 + b**2 = a**2 + ba - 1000a + ba + b**2 - 1000b - 1000a - 1000b + 1000000   =>
### 0 = 2ba -2000a -2000b + 1000000         =>
### 1000a + 1000b -ba = 1000000             =>
### can this be simplified further?

for my $a ( 1 .. $Num) {
    for my $b ( 1 .. $Num ) {

        my $c = 1000 - $a - $b;
        next if $c < 1;
        next unless $a**2 + $b**2 == $c**2;        
        
        my $product = $a * $b * $c;
        print "a = $a, b = $b, c = $c product = $product\n";
    }                
}



__END__

### The maximum case is the sqrt of the number. In fact it's smaller, but
### this makes the set to compute small enough already
my $Max = int sqrt( $Num );

### XXX this should use recursion to prettify it 
for my $i ( reverse 1 .. $Max ) {
    my $i2 = $i**2;
    
    my $num2 = $Num - $i2;              # remove the first sqrt
    
    next if $num2 < 1;                  # need positive number

warn "Trying $i ($i2) -> $num2";
    
    for my $j ( reverse 1 .. $i-1 ) {
        my $j2 = $j**2;
        
        my $num3 = $num2 - $j2;         # remove the second sqrt;

        next if $num3 < 1;              # need positive number

warn "  Trying $j ($j2) -> $num3";

        my $sqrt = sqrt($num3);
warn "      sqrt = $sqrt";        
        
        if( $sqrt == int($sqrt) ) {     # whole number?
            my $val = $i + $j + $sqrt;
            
            die "$i $j $sqrt -> $val";
        }
    }
}    


