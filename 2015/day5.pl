#! env perl

use 5.36.0;
# use ARGV::OrDATA;
use Data::Printer;
use Test::More;

is(check("ugknbfddgicrmopn"), "nice"   );
is(check("aaa"),              "nice"   );
is(check("jchzalrnumimnmhp"), "naughty");
is(check("haegwjzuvuyypxyu"), "naughty");
is(check("dvszwmarrgswjxmb"), "naughty");
done_testing();

my $cnt = 0;
while (<>) {
  chomp;
  $cnt++ if (check($_) eq "nice");
}
say "Part 1: $cnt words were nice";

sub check {
  my ($in) = @_;
  my $cnt = ($in =~ tr/aeiou/aeiou/);
  return "naughty" if ($cnt < 3);
  return "naughty" unless ($in =~ /(\w)(\1)/);
  return "naughty" if ($in =~ /(ab|cd|pq|xy)/);
  return "nice";
}
