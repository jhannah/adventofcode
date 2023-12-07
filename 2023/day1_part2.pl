use 5.38.0;
use ARGV::OrDATA;
use FileHandle;
STDOUT->autoflush();

my $total;
my $reg = qr/(one|two|three|four|five|six|seven|eight|nine|\d)/;
my %convert = (
  one   => 1,
  two   => 2,
  three => 3,
  four  => 4,
  five  => 5,
  six   => 6,
  seven => 7,
  eight => 8,
  nine  => 9,
);
while (<>) {
  chomp;
  # wut??
  # > The right calibration values for string "eighthree" is 83 and for "sevenine" is 79.
  # > The examples do not cover such cases.
  # that is unexpected and silly
  # https://www.reddit.com/r/adventofcode/comments/1884fpl/2023_day_1for_those_who_stuck_on_part_2/

  # This does overlapping matches?
  # perldoc perlre
  #   "(?=*pattern*)"
  #     "(*pla:*pattern*)"
  #     "(*positive_lookahead:*pattern*)"
  #         A zero-width positive lookahead assertion. For example,
  #         "/\w+(?=\t)/" matches a word followed by a tab, without
  #         including the tab in $&.
  my @digits = ($_ =~ /(?=$reg)/g);
  # say join " ", @digits;
  my $first = shift @digits;
  my $last = pop @digits;
  # say $first . $last;
  unless ($last) {
    $last = $first;
  }
  foreach ($first, $last) {
    if (/\D/) {
      $_ = $convert{$_};
    }
  }
  # say $first . $last;
  my $this_line = $first . $last;
  say;
  say "$total + $this_line\n";
  $total += $first . $last;
}
say $total;

__DATA__
eighthree
sevenine
