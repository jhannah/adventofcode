use Modern::Perl;
use ARGV::OrDATA;
use Statistics::Basic qw(median);

my $fuel;
while (<>) {
  chomp;
  my @c = split /,/;
  my $median = median(@c);
  foreach my $c (@c) {
    $fuel += abs($c - $median);
  }
  say "Part 1: fuel is $fuel";
}

__DATA__
16,1,2,0,4,2,7,1,2,14
