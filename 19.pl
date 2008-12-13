# http://projecteuler.net/index.php?section=problems&id=19
#
# You are given the following information, but you may prefer to do some research for yourself.
# 
#     * 1 Jan 1900 was a Monday.
#     * Thirty days has September,
#       April, June and November.
#       All the rest have thirty-one,
#       Saving February alone,
#       Which has twenty-eight, rain or shine.
#       And on leap years, twenty-nine.
#     * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

use strict;
use warnings;

my $Base    = 1900;         # year we start indexing from
my $Start   = 1901;         # year we start counting from
my $End     = 2000;         # year we end counting
my $Count   = 0;            # amount of sundays
my $Idx     = 1;            # first index = 1 of Mon, Tue, Wed, Thu, Fri, Sat, Sun
my $Wanted  = 7;            # wanted index

for my $year ( $Base .. $End  ) {             # for all the years we care about

    my $feb =   !($year % 100) && !($year % 400)    ? 29 :  # century leap year   
                ($year % 100) && !($year % 4)       ? 29 :  # regular leap year
                28;                                         # default
    
    ### jan -> november offsets from the first day
    my @months = ( 0, 31, $feb, 31, 30, 31, 30, 31, 31, 30, 31, 30 );
    
    my $days = $Idx;                # first day of the year, and so on
    for my $month ( @months ) {
        $days += $month;            # index of the first day of this month

        if( !($days % $Wanted) and $year >= $Start ) {      # a sunday                  
            print "[$Idx] Sunday found on day $days of $year\n";
            $Count++ 
        }

    }
    
    ### the start of the next year will have a new index. The index is offset
    ### by the days left over from the last year
    $Idx = $Wanted - ($days % $Wanted);
}

print "Total sundays found: $Count\n";
    
    
