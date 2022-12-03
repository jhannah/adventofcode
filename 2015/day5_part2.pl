#! env perl

use 5.36.0;
# use ARGV::OrDATA;
use Data::Printer;
use Test::More;

is(check("qjhvhtzxzqqjkmpb"), "nice",    "qjhvhtzxzqqjkmpb");
is(check("xxyxx"),            "nice",    "xxyxx"           );
is(check("uurcxstgmygtbstg"), "naughty", "uurcxstgmygtbstg");
is(check("ieodomkazucvgmuy"), "naughty", "ieodomkazucvgmuy");
done_testing();

my $cnt = 0;
while (<>) {
  chomp;
  $cnt++ if (check($_) eq "nice");
}
say "Part 1: $cnt words were nice";

sub check {
  my ($in) = @_;
  return "naughty" unless ($in =~ /(\w\w).*(\1)/);
  return "naughty" unless ($in =~ /(\w).(\1)/);
  return "nice";
}
