use Modern::Perl;
use ARGV::OrDATA;
use List::Util qw(sum);

my $days = 80;
my $fish = {};
while (<>) {
  chomp;
  foreach my $timer (split /,/) {
    $fish->{$timer}++;  # Count the fish with a certain timer
  }
}
tick() for (1..$days);
say "After $days days there are " . sum(values %$fish) . " fish";

sub tick {
  my $new_fish = {};
  foreach my $timer (keys %$fish) {
    if ($timer > 0) {
      $new_fish->{$timer - 1} += $fish->{$timer};
    } else {
      $new_fish->{6} += $fish->{$timer};
      $new_fish->{8} += $fish->{$timer};
    }
 }
  $fish = $new_fish;
}



# say "Part 1: $rval";

__DATA__
3,4,3,1,2
