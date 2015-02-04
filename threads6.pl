#!/usr/bin/perl
use threads;

my $thr1 = threads->new(\&sub1, "test1");
my $thr2 = threads->new(\&sub1, "test2");

sub sub1 
{
    my ($message) = @_;
    sleep(1);
    print "thread $message\n";
}

$thr1->join();
$thr2->join();
