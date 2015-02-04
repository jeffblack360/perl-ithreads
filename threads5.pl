#!/usr/bin/perl
use threads;

my $thr = threads->new(\&sub1); # spawn thread

sleep(15); # Let the thread run for a bit

sub sub1 
{
    threads->detach(); # Now we officially don't care anymore
    my $a = 0;
    while (1) 
    {
        $a++;
        print("\$a is $a\n");
        sleep(1);
    }
}
