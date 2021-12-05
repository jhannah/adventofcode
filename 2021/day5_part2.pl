use Modern::Perl;
use ARGV::OrDATA;

my $map = {};
while (<>) {
  chomp;
  mark (split /\D+/);
}
print_map(9);   # 150 or whatever to see (part of) the 1000x1000 map
count_2_or_more();

sub mark {
  my ($x1, $y1, $x2, $y2) = @_;
  # say "$x1,$y1 -> $x2,$y2";
  if ($x1 == $x2) {
    # say "  Mark vertical line";
    # To use ".." below, we need to sort them numerically.
    ($y1, $y2) = sort { $a <=> $b } $y1, $y2;
    foreach my $y ($y1..$y2) {
      $map->{$x1}->{$y}++;
    }
    return;
  }
  if ($y1 == $y2) {
    # say "  Mark horizontal line";
    # To use ".." below, we need to sort them numerically.
    ($x1, $x2) = sort { $a <=> $b } $x1, $x2;
    foreach my $x ($x1..$x2) {
      $map->{$x}->{$y1}++;
    }
    return;
  }
  # Mark diaganal line. There are 4 possible inputs:
  # A.D  A -> B  C -> D
  # ...  B -> A  D -> C
  # C.B  
  my @x = $x1..$x2;
  my @y = $y1..$y2;
  if ($x2 > $x1) {
    if ($y2 < $y1) {
      @y = reverse($y2..$y1);  # C -> D
    }
    # A -> B (we're good)
  } else {
    if ($y2 > $y1) {
      @x = reverse($x2..$x1);  # D -> C
    } else {
      # B -> A
      @x = $x2..$x1;
      @y = $y2..$y1;
    }
  }
  for (my $i = 0; $i < scalar(@x); $i++) {
    # say "  mark $x[$i],$y[$i]";
    $map->{$x[$i]}->{$y[$i]}++;
  }
}

sub print_map {
  my ($size) = @_;
  foreach my $y (0..$size) {
    foreach my $x (0..$size) {
      print $map->{$x}->{$y} // ".";
    }
    print "\n";
  }
}

sub count_2_or_more {
  my $rval;
  foreach my $x (keys %$map) {
    foreach my $y (keys %{$map->{$x}}) {
      my $c = $map->{$x}->{$y};
      $rval++ if ($c > 1);
    }
  }
  say "Part 2: $rval";
}

__DATA__
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
