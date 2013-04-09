use strict;
use warnings;

BEGIN {
    use Perl::APIReference;
    use vars qw( @Perls );
    @Perls = sort keys %Perl::APIReference::Perls;
}

use Test::More tests => scalar( @Perls );

foreach my $version (@Perls) {
    eval "Perl::APIReference->new( perl_version => $version );";
    ok( !$@, $version );
}
