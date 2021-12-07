use Modern::Perl;
use ARGV::OrDATA;
no warnings "experimental";

my %map;
my ($x, $y) = (0, 0);
while (<>) {
  chomp;
  foreach my $d (split //) {
    $map{"$x,$y"}++;
    for ($d) {
      when (/>/)  { $x += 1 }
      when (/v/)  { $y -= 1 }
      when (/</)  { $x -= 1 }
      when (/\^/) { $y += 1 }
      $map{"$x,$y"}++;
    }
  }
}
say "Part 1: " . scalar(keys %map) . " houses got presents";

__DATA__
^>v<
