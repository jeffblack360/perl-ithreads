#!/mtg/tool/bin/perl
# Synchronization and control
# Controlling access: lock()
use warnings;
use strict;
use autodie;
use feature qw(say);

use threads;
use threads::shared;

my $total :shared = 0;

sub sub1
{
    say "Starting thread: ". shift;

    while (1)
    {
        my $result = 0;

      {
        lock($total);
        $total += $result;
      }

      last if $result == 0;
    }

    return;
}

my $thr1 = threads->create(\&sub1, "thr1");
my $thr2 = threads->create(\&sub1, "thr2");
my $thr3 = threads->create(\&sub1, "thr3");

$thr1->join();
$thr2->join();
$thr3->join();

say "total=$total";
