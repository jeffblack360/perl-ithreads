#!/usr/bin/perl
use threads;

my $thr = threads->create(\&sub1);

sub sub1 {
    print("In the thread\n");
}
