#!/usr/bin/perl -n
use List::Util product;

chomp;
push @D, ".$_.";
!$l && ($l = '.' x (length ($_) + 2));

END {
  unshift @D, $l;
  push    @D, $l;

  $c = -1;
  for (@D){
    ++$c || next;

    $l  = $_;
    $pl = 0;

    while ($l =~ /\d+/) {
      $b  = $-[0];
      $e  = $+[0];
      $ml = $e-$b+2;
      $f  = $pl+$b-1;
      $n  = $&;

      substr ($l      , $b-1, 1) eq  '*' && push(@{$g{$c  }{$f        }}, $n);
      substr ($l      , $e  , 1) eq  '*' && push(@{$g{$c  }{$pl+$e    }}, $n);
      substr ($D[$c-1], $f, $ml) =~ /\*/ && push(@{$g{$c-1}{$f + $-[0]}}, $n);
      substr ($D[$c+1], $f, $ml) =~ /\*/ && push(@{$g{$c+1}{$f + $-[0]}}, $n);
      
      $pl += $e;
      $l = substr ($l, $e);
    }
  }
  for (keys %g) {
    for (values %{$g{$_}}) {
      @$_ == 2 || next;
      $s += product(@$_)
    }
  }
  print $s, "\n"
}