#!/mtg/tool/bin/perl
use warnings;
use strict;
use autodie;
use feature qw(say);

use threads;
use threads::shared;

my $foo :shared = 1;
my $bar = 1;

my $thr1 = threads->create(\&sub1);
$thr1->join();

say("$foo"); # prints 2 since $foo is shared
say("$bar"); # prints 1 since $bar is not shared

sub sub1
{
    open(my $fh, "<", "threads6.pl");
    say $fh;
    $foo++;
    $bar++;
}
