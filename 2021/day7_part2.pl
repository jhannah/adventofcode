use Modern::Perl;
use ARGV::OrDATA;
use List::Util qw(sum);

my $fuel;
while (<>) {
  chomp;
  my @c = split /,/;
  my $final_pos = sprintf("%.0f", sum(@c) / scalar(@c));   # average, rounded
  say "Move to $final_pos";
  foreach my $c (@c) {
    my $distance = abs($c - $final_pos);
    say "Moving $c to $final_pos";
    foreach my $i (1..$distance) {
      $fuel += $i;
      say "  + $i";
    }
    say "  = $fuel";
  }
  say "Part 2: fuel is $fuel";
}

__DATA__
16,1,2,0,4,2,7,1,2,14
