#!/usr/bin/perl
use threads;

my $thr = threads->new(\&sub1); # spawn thread

$thr->detach(); # Now we officially don't care anymore

print "Preparing to sleep...\n";
print "zzzzz\n";
sleep(15); # Let the thread run for a bit
print "All done.\n";

sub sub1 
{
    my $a = 0;
    while (1) 
    {
        $a++;
        print("\$a is $a\n");
        sleep(1);
    }
}
