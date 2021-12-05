use Modern::Perl;
use ARGV::OrDATA;

my ($paper, $ribbon);
while (<>) {
  chomp;
  my ($l, $w, $h) = split /x/;

  $paper += 2 * $l * $w + 2 * $w * $h + 2 * $h * $l;
  my @sides = sort { $a <=> $b } ($l, $w, $h);
  $paper += $sides[0] * $sides[1];   # The "slack"

  $ribbon += $sides[0] * 2 + $sides[1] * 2 + $l * $w * $h;
}
say "Part 1: paper:  $paper";
say "Part 2: ribbon: $ribbon";

__DATA__
2x3x4
1x1x10
