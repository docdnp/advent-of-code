#!/usr/bin/perl -n
use List::Util max;

$a += max (/(\d+) red/g  ) * max (/(\d+) green/g) * max (/(\d+) blue/g ) ;

END { print $a,"\n" }
