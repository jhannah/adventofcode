use 5.38.0;
use ARGV::OrDATA;

my $total;
while (<>) {
  chomp;
  my ($game_number) = /Game (\d+): /;
  # say $game_number;
  s/.*: //;
  my @draws = split /; /;
  if (is_possible(@draws)) {
    $total += $game_number;
  }
}
say $total;

sub is_possible {
  my (@draws) = @_;
  foreach my $draw (@draws) {
    my @set = split /, /, $draw;
    foreach my $set (@set) {
      my ($count, $color) = split / /, $set;
      # say "  $count of $color";
      if    ($color eq "red")   { return 0 if $count > 12 }
      elsif ($color eq "green") { return 0 if $count > 13 }
      elsif ($color eq "blue")  { return 0 if $count > 14 }
      else  { return 0 }
    }
  }
  return 1;
}

__DATA__
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green