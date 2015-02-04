#!/usr/bin/perl
use threads;

my ($thr) = threads->new(\&sub1);

my @ReturnData = $thr->join();

print('Thread returned ', join(', ', @ReturnData), "\n");

sub sub1 {
    return ('Fifty-six', 'foo', 2);
}
