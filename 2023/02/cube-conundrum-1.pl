#!/usr/bin/perl -n
use List::Util max;

max (/(\d+) red/g  ) <= $ENV{RED}   &&
max (/(\d+) green/g) <= $ENV{GREEN} &&
max (/(\d+) blue/g ) <= $ENV{BLUE}  &&
(/Game (\d+)/, $a+=$1);

END { print $a,"\n" }
