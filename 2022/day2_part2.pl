use 5.36.0;
use ARGV::OrDATA;
use Data::Printer;

my %score_per_round = (
  AX => 3 + 0, # Scissors + lose
  AY => 1 + 3, # Rock     + draw
  AZ => 2 + 6, # Paper    + win
  BX => 1 + 0, # Rock     + lose
  BY => 2 + 3, # Paper    + draw
  BZ => 3 + 6, # Scissors + win
  CX => 2 + 0, # Paper    + lose
  CY => 3 + 3, # Scissors + draw
  CZ => 1 + 6, # Rock     + win
);
my $score = 0;
while (<>) {
  s/[^A-Z]//g;
  $score += $score_per_round{$_};
}

say "Part 2: " . $score;


__DATA__
A Y
B X
C Z