#! /usr/bin/perl

use strict;
use warnings;

open(TXT, "nroff -ms -Tascii $ARGV[0]|") || die;
my @collectedtitles = ();

while(<TXT>) {
    push @collectedtitles, $1 if /^(\d.*\S)/;
    next unless /\[Page (\d+)\]$/;
    my $page = $1;
    foreach my $title (@collectedtitles) {
	$title .= " " . '.'x72;
	$_ = $title;
	s/\s.*//;
	y/.//cd;
	my $indent = 3*length;
	printf "%*s%s %2d\n", $indent, "", substr($title,0,72-$indent-3), $page;
    }
    @collectedtitles = ();
}
