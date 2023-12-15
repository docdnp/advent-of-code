#!/usr/bin/perl -n

s/Card.*:\s*|\|//g;
push @c, [split (/\s+/, $_)];

sub ndups { my %c; scalar(grep ++$c{$_} == 2, @{$_[0]}) }

sub c {
  my ($c, $nc, $r, @c) = (shift, 0, 1, @{$_[0]});
  $nc = ndups $c[$c];
  $nc || return 1;
  for ($c+1..$c+$nc) { $r += c($_, \@c) }
  return $r;
}

END {
  for (0..@c-1) { $s += c($_, \@c) }
  print $s, "\n";
}
