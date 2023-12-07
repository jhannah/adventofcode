use 5.38.0;
use ARGV::OrDATA;

my $total;
while (<>) {
  chomp;
  my @digits = /(\d)/g;
  my $first = shift @digits;
  my $last = pop @digits;
  unless ($last) {
    $last = $first;
  }
  $total += $first . $last;
}
say $total;

__DATA__
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet