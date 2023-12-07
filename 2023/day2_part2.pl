use 5.38.0;
use ARGV::OrDATA;

my $total;
while (<>) {
  chomp;
  my ($game_number) = /Game (\d+): /;
  # say $game_number;
  s/.*: //;
  my @draws = split /; /;
  my $minimum = minimum(@draws);
  my $product = 1;
  foreach my $color (keys %$minimum) {
    # say $$minimum{$color} . " of " . $color;
    $product *= $$minimum{$color};
  }
  $total += $product;
}
say $total;

sub minimum {
  my (@draws) = @_;
  my $minimum = {};
  foreach my $draw (@draws) {
    my @set = split /, /, $draw;
    foreach my $set (@set) {
      my ($count, $color) = split / /, $set;
      no warnings "uninitialized";
      if ($$minimum{$color} < $count) {
        $$minimum{$color} = $count;
      }
    }
  }
  return $minimum;
}

__DATA__
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green