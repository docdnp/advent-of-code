#!/usr/bin/perl -n

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

      ! (substr ($l      , $b-1, 1  ) eq '.'
      && substr ($l      , $e  , 1  ) eq '.'
      && substr ($D[$c-1], $f  , $ml) =~ /^[\.\d]+$/
      && substr ($D[$c+1], $f  , $ml) =~ /^[\.\d]+$/
      ) && ($s += $n);

      $pl += $e;
      $l = substr ($l, $e);
    }
  }
  print $s,"\n"
}