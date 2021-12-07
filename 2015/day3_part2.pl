use Modern::Perl;
use ARGV::OrDATA;
no warnings "experimental";

my %map;
my ($santa_x, $santa_y)           = (0, 0);
my ($robo_santa_x, $robo_santa_y) = (0, 0);
while (<>) {
  chomp;
  my @d = split //;
  while (@d) {
    mark(shift @d, \$santa_x,      \$santa_y);
    mark(shift @d, \$robo_santa_x, \$robo_santa_y);
  }
}

sub mark {
  my ($d, $x, $y) = (@_);  # $x and $y are refs
  $map{"$$x,$$y"}++;
  for ($d) {
    when (/>/)  { $$x += 1 }
    when (/v/)  { $$y -= 1 }
    when (/</)  { $$x -= 1 }
    when (/\^/) { $$y += 1 }
  }
  $map{"$$x,$$y"}++;
}
say "Part 2: " . scalar(keys %map) . " houses got presents";

__DATA__
^v^v^v^v^v
