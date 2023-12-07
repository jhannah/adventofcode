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
  my @digits = ($_ =~ /$reg/g);
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
  say "$total + $this_line";
  $total += $first . $last;
}
say $total;

__DATA__
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen