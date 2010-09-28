#!/usr/bin/perl

use strict;
use warnings;

my $skip = 1;
while(<>) {
    next if /^\s*$/ && $skip;
    $skip = 0;
    print;
    next unless /\[Page \d+\]$/;
    print "\f\n";
    $skip = 1;
}
