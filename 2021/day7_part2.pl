use Modern::Perl;
use ARGV::OrDATA;
use List::Util qw(sum);

my %pos;   # count of crabs at each position
while (<>) {
  chomp;
  foreach my $c (split /,/) {
    $pos{$c}++;
  }
}

my @all_pos = sort { $a <=> $b } keys %pos;
my $min = $all_pos[0];
my $max = $all_pos[-1];
my %all_costs;
foreach my $x ($min..$max) {
  my $cost = cost_to_move_to($x);
  $all_costs{$cost} = $x;
}
my ($min_cost) = sort { $a <=> $b } keys %all_costs;
say "Move to $all_costs{$min_cost}, which will cost you $min_cost";


sub cost_to_move_to {
  (my $x) = @_;
  my $fuel;
  foreach my $p (keys %pos) {
    my $distance = abs($x - $p);
    foreach my $i (1..$distance) {
      $fuel += $i * $pos{$p};
    }
  }
  say "Moving to $x would cost $fuel";
  return $fuel;
}


__DATA__
16,1,2,0,4,2,7,1,2,14
