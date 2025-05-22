package Perl::APIReference::V5_028_001;
use strict;
use warnings;
use parent 'Perl::APIReference::V5_028_000';

sub new {
  my $class = shift;
  my $obj = $class->SUPER::new(@_);

  $obj->{perl_version} = '5.028001';
  bless $obj => $class;

  return $obj;
}

1;
