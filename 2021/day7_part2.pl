use Modern::Perl;
use ARGV::OrDATA;
use List::Util qw(sum);
use Devel::Timer;

my $t = Devel::Timer->new();
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
$t->mark('input parsing complete');

my %all_costs;
foreach my $x ($min..$max) {
  my $cost = cost_to_move_to($x);
  $all_costs{$cost} = $x;
}
my ($min_cost) = sort { $a <=> $b } keys %all_costs;
say "Move to $all_costs{$min_cost}, which will cost you $min_cost";
$t->mark('solution found');
$t->report;

sub cost_to_move_to {
  (my $x) = @_;
  my $fuel;
  foreach my $p (keys %pos) {
    my $distance = abs($x - $p);
    # This mirrors the AoC explanation, but is computationally slow:
    # foreach my $i (1..$distance) {
    #   $fuel += $i * $pos{$p};
    # }
    # https://techlahoma.slack.com/archives/C01FR9T1Z8W/p1638897813173100?thread_ts=1638885374.152200&cid=C01FR9T1Z8W
    # This achieves the same thing, but math, so faster:
    $fuel += $distance * ($distance + 1) / 2 * $pos{$p};
  }
  # say "Moving to $x would cost $fuel";
  return $fuel;
}


__DATA__
16,1,2,0,4,2,7,1,2,14
