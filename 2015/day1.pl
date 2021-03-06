use Modern::Perl;
use ARGV::OrDATA;

my ($f, $p, $p_answer);
while (<>) {
  chomp;
  foreach my $c (split //) {
    if ($c eq "(") { $f++ }
    if ($c eq ")") { $f-- }
    $p++;
    # say "$p $f";
    if ($f == -1) {
      $p_answer //= $p;
    }
  }
}
say "Part 1: floor: $f";
say "Part 2: position: $p_answer";

__DATA__
()())
