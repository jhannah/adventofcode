use 5.36.0;
use ARGV::OrDATA;
use Data::Printer;

my %score_for_selection = (
  A => 1, X => 1,  # Rock
  B => 2, Y => 2,  # Paper
  C => 3, Z => 3,  # Scissors
);
my %score_for_result = (
  AX => [3, 3], # draw
  AY => [0, 6], # right side wins
  AZ => [6, 0], # left side wins
  BX => [6, 0], # left side wins
  BY => [3, 3], # draw
  BZ => [0, 6], # right side wins
  CX => [0, 6], # right side wins
  CY => [6, 0], # left side wins
  CZ => [3, 3], # draw
);
my $score = 0;
while (<>) {
  chomp;
  my ($they_chose, $i_chose) = split / /;
  $score += $score_for_selection{$i_chose};
  my $i = $score_for_result{$they_chose . $i_chose};
  # p $i;
  $score += $$i[1];
}

say "Part 1: " . $score;


__DATA__
A Y
B X
C Z