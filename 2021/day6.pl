use Modern::Perl;
use ARGV::OrDATA;
use List::Util qw(sum);

my $input_fish = {};
while (<>) {
  chomp;
  foreach my $timer (split /,/) {
    $input_fish->{$timer}++;  # Count the fish with a certain timer
  }
}

my $fish = $input_fish;
my $days = 80;
tick() for (1..$days);
say "Part 1: After $days days there are " . sum(values %$fish) . " fish";

$fish = $input_fish;
$days = 256;
tick() for (1..$days);
say "Part 2: After $days days there are " . sum(values %$fish) . " fish";


sub tick {
  my $new_fish = {};
  foreach my $timer (keys %$fish) {
    if ($timer > 0) {
      $new_fish->{$timer - 1} += $fish->{$timer};  # Another day older
    } else {
      $new_fish->{6} += $fish->{$timer};   # Reset the mom's timers
      $new_fish->{8} += $fish->{$timer};   # oooo cute! baby fish!
    }
 }
  $fish = $new_fish;
}

__DATA__
3,4,3,1,2
