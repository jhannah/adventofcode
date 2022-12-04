#! env perl

use 5.36.0;
use ARGV::OrDATA;
use Data::Printer;

my $part1_cnt = 0;
my $part2_cnt = 0;
while (<>) {
  chomp;
  # lol $a and $b are magic variables (sort), so don't use those!
  # https://perlmaven.com/dont-use-a-and-b-variables
  #   ( turns out $a and $b were not the problem, my typo was. But still. :) )
  my ($j, $k, $l, $m) = split /\D/;
  if (
    ($j >= $l && $k <= $m) ||   # First is a subset of second
    ($l >= $j && $m <= $k)      # Second is a subset of first
  ) {
    $part1_cnt++;
  }
  if (                         #   j--k
    ($l >= $j && $l <= $k) ||  #      l--m
    ($m >= $j && $m <= $k) ||  # l-m
    ($l <= $j && $m >= $k)     #  l----m
  ) {
    say "$j-$k,$l-$m is true";
    say "  " . (($l >= $j && $l <= $k) ? "true" : "false");
    say "  " . (($m >= $j && $m <= $k) ? "true" : "false");
    say "  " . (($l <= $j && $m >= $k) ? "true" : "false");
    say "    " . (($l <= $j) ? "true" : "false");
    say "    " . (($m >= $k) ? "true" : "false");
    say "  " . ((($l <= $j) && ($m >= $k)) ? "true" : "false");
    $part2_cnt++;
  }
}

say "Part 1: $part1_cnt";
say "Part 2: $part2_cnt";


__DATA__
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8