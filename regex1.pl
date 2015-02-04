#!/usr/bin/perl
use warnings;
use strict;
use threads;
use feature qw(say);


my $thr1 = threads->new(\&sub1, "test1");
#my $thr2 = threads->new(\&sub1, "test2");

$thr1->join();
#$thr2->join();

sub sub1 
{
    my @strings = qw( abba
                      abacus
                      abbba
                      babble
                      Barbarella
                      Yello );

my @regexes = ( qr/ab?/,
                qr/ab*/,
                qr/ab+/, );

    foreach my $string (@strings) {
        foreach my $regex (@regexes) {
            if ($string =~ $regex) {
               say "'$regex' matches '$string'";
            } 
        }
    }

    say "Thread complete";
}
