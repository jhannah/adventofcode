use Modern::Perl;
use ARGV::OrDATA;

my ($tot);
while (<>) {
  chomp;
  my ($l, $w, $h) = split /x/;
  $tot += 2 * $l * $w + 2 * $w * $h + 2 * $h * $l;
  my @sides = sort { $a <=> $b } ($l, $w, $h);
  $tot += $sides[0] * $sides[1];   # The "slack"
}
say "Part 1: $tot";

__DATA__
2x3x4
1x1x10
