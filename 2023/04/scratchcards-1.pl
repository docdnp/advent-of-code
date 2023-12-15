#!/usr/bin/perl -n
s/Card.*:\s*|\|//g;
sub ndups { my %c; scalar(grep ++$c{$_} == 2, @{$_[0]}) }
$s += int(2 **  ndups([split /\s+/, $_])/2);
END { print $s, "\n" }
