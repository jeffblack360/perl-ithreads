#!/mtg/tool/bin/perl
use warnings;
use strict;
use autodie;
use feature qw(say);

use threads;
use threads::shared;

my $var = 1;
my $svar :shared = 2;
my %hash :shared;

my $thr1 = threads->create(\&sub1, "thr1");
my $thr2 = threads->create(\&sub1, "thr2");

$thr1->join();
$thr2->join();

sub sub1
{
    say "Starting thread: ". shift;
    if (exists $hash{a} ) 
    {
        say '$hash{a} = ' . $hash{a};
    }
    else 
    {
        say '$hash{a} is not initialized!';
        $hash{a} = 1;
        $hash{a} = $var;
        $hash{a} = $svar;
        #$hash{a} = \$svar;
        $hash{a} = \$var; # this will die because $var is not shared
        delete($hash{a}); 
    }

    return;
}
