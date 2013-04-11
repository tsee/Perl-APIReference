use strict;
use warnings;
use Perl::APIReference;

my @Perls;
BEGIN {
  @Perls = sort keys %Perl::APIReference::Perls;
}

use Test::More tests => scalar( @Perls );

foreach my $version (@Perls) {
  my $err;
  ok(
    eval {
      Perl::APIReference->new( perl_version => $version );
      1;
    } || do {$err = $@||'Zombie Error'; 0},
    $version
  )
  or warn "Caught exception: $err";
}
