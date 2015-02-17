#!/mtg/tool/bin/perl
use warnings;
use strict;
use autodie;
use feature qw(say);

use threads;
use threads::shared;

my $a :shared = 1;

my $thr1 = threads->create(\&sub1, "thr1");
my $thr2 = threads->create(\&sub1, "thr2");

$thr1->join();
$thr2->join();

say "$a";

sub sub1
{
    say "Starting thread: ". shift;

    my $foo = $a;
    $a = $foo + 1;

    return;
}

sub sub2
{
    say "Starting thread: ". shift;

    my $bar = $a;
    $a = $bar + 1;

    return;
}
