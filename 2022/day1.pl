use 5.36.0;
use ARGV::OrDATA;

my @elves;
my $tot;
while (<>) {
  chomp;
  if (/\d/) {
    $tot += $_;
  } else {
    push @elves, $tot;
    $tot = 0;
  }
  # say "$_ $tot";
}
push @elves, $tot;

@elves = sort { $b <=> $a } @elves;
say "Part 1: " . $elves[0];
# say join " ", @elves;
say "Part 2: " . ($elves[0] + $elves[1] + $elves[2]);


__DATA__
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000