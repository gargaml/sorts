#!/usr/bin/env perl

use 5.14.0;

use warnings;
use strict;

use threads;
use List::Util qw/max/;

sub hold_on {
    my ($element) = @_;
    sleep $element;
    say $element;
}

sub sleep_sort {
    for (@_) {
        threads->new(\&hold_on, $_)->detach();
    }
}

chomp($_ = <STDIN>);
my @elements = split;
sleep_sort(@elements);
sleep(max(@elements));
