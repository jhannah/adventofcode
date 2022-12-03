#! env perl

use 5.36.0;
use Digest::MD5 qw(md5_hex);

say md5_hex("abcdef609043");

my $i = 1;
while (md5_hex("yzbqklnj$i") !~ /^00000/) {
  $i++;
}
say "Part 1: $i";

while (md5_hex("yzbqklnj$i") !~ /^000000/) {
  $i++;
}
say "Part 2: $i";
