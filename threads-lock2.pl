#!/mtg/tool/bin/perl
# Synchronization and control
# Controlling access: lock()
# Demo that locks are recursive.
use warnings;
use strict;
use autodie;
use feature qw(say);

use threads;
use threads::shared;

my $total :shared = 0;
my $x     :shared = 0;

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

sub sub2
{
    say "Starting thread: ". shift;

    {
      lock($x); #Wait for lock
      $x++;
      lock($x); #NOOP - already have the lock
      {
          lock($x); # Another NOOP
          {
              lock($x); # Yet another NOOP
              lockit_some_more();
          }
      }
    } # *** Implicit unlock here ***

  return;
}

sub lockit_some_more
{
    lock($x); # NOOP
    $x++;
} # Nothing happens here

my $thr1 = threads->create(\&sub1, "thr1");
my $thr2 = threads->create(\&sub1, "thr2");
my $thr3 = threads->create(\&sub1, "thr3");
my $thr4 = threads->create(\&sub2, "thr4");
my $thr5 = threads->create(\&sub2, "thr5");

$thr1->join();
$thr2->join();
$thr3->join();
$thr4->join();
$thr5->join();

say "total=$total";
say "x=$x";
