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
  my $elf1 = $_;
  my $elf2 = <>; chomp $elf2;
  my $elf3 = <>; chomp $elf3;
  # say "$elf1 $elf2 $elf3";
  my %already_found;
  foreach my $i (split '', $elf1) {
    # say "looking for $i";
    if ($elf2 =~ /$i/ && $elf3 =~ /$i/) {
      next if ($already_found{$i});
      # say "  found $i";
      $sum += $priority{$i};
      $already_found{$i} = 1;
    }
  }
}

say "Part 2: $sum";


__DATA__
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw