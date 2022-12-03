#! env perl

use 5.36.0;
use ARGV::OrDATA;
use Data::Printer;

my %priority;
my $p = 1;
foreach my $i ("a".."z", "A".."Z") {
  $priority{$i} = $p++;
}
# p %priority;

my $sum = 0;
while (<>) {
  chomp;
  # say;
  my $len = length($_) / 2;
  my ($comp1, $comp2) = /(.{$len})/g;   # compartments
  # p $comp1;
  # p $comp2;
  my %already_found;
  foreach my $i (split '', $comp1) {
    if ($comp2 =~ /$i/) {
      next if ($already_found{$i});
      # say "  found $i";
      $sum += $priority{$i};
      $already_found{$i} = 1;
    }
  }
  # say $sum;
}

say "Part 1: $sum";


__DATA__
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw