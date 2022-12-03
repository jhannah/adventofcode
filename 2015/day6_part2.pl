#! env perl

use 5.36.0;
# use ARGV::OrDATA;
# use Data::Printer;
# use Test::More;

my $grid = {};
while (<>) {
  my ($cmd, $x1, $y1, $x2, $y2) = (/(\w+) (\d+),(\d+).+?(\d+),(\d+)/);
  # say "$cmd, $x1, $y1, $x2, $y2";
  foreach my $x ($x1..$x2) {
    foreach my $y ($y1..$y2) {
      if ($cmd eq "on") {
        $grid->{$x}->{$y} += 1;
      } elsif ($cmd eq "off") {
        $grid->{$x}->{$y} -= 1;
        if ($grid->{$x}->{$y} < 0) {
          $grid->{$x}->{$y} = 0;
        }
      } elsif ($cmd eq "toggle") {
        $grid->{$x}->{$y} += 2;
      } else {
        die "wut?";
      }
    }
  }
}
my $cnt = 0;
foreach my $x (0..999) {
  foreach my $y (0..999) {
    $cnt += $grid->{$x}->{$y} || 0;
  }
}
say "Part 2: $cnt total brightness";

