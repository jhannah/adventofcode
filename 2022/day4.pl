#! env perl

use 5.36.0;
use ARGV::OrDATA;
use Data::Printer;

my $cnt = 0;
while (<>) {
  chomp;
  my ($a, $b, $c, $d) = split /\D/;
  if (
    ($a >= $c && $b <= $d) ||   # First is a subset of second
    ($c >= $a && $d <= $b)      # Second is a subset of first
  ) {
    $cnt++;
  }
}

say "Part 1: $cnt";


__DATA__
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8