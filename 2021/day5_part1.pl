use Modern::Perl;
use ARGV::OrDATA;

my $map = {};
while (<>) {
  chomp;
  mark (split /\D+/);
}
# print_map(150);
count_2_or_more();

sub mark {
  my ($x1, $y1, $x2, $y2) = @_;
  # To use ".." below, we need to sort them numerically.
  ($x1, $x2) = sort { $a <=> $b } $x1, $x2;
  ($y1, $y2) = sort { $a <=> $b } $y1, $y2;
  if ($x1 == $x2) {
    # Mark vertical line
    foreach my $y ($y1..$y2) {
      $map->{$x1}->{$y}++;
    }
  } elsif ($y1 == $y2) {
    # Mark horizontal line
    foreach my $x ($x1..$x2) {
      $map->{$x}->{$y1}++;
    }
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
  say "Part 1: $rval";
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
