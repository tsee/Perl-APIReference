package Perl::APIReference::V5_022_001;
use strict;
use warnings;
use parent 'Perl::APIReference::V5_022_000';

sub new {
  my $class = shift;
  my $obj = $class->SUPER::new(@_);

  $obj->{perl_version} = '5.022001';
  bless $obj => $class;
  # Override the few changes since 5.22.0
  $obj->{'index'}{'av_clear'} = {'text' => 'Frees the all the elements of an array, leaving it empty.
The XS equivalent of C<@array = ()>.  See also L</av_undef>.

Note that it is possible that the actions of a destructor called directly
or indirectly by freeing an element of the array could cause the reference
count of the array itself to be reduced (e.g. by deleting an entry in the
symbol table). So it is a possibility that the AV could have been freed
(or even reallocated) on return from the call unless you hold a reference
to it.

	void	av_clear(AV *av)','name' => 'av_clear'};
  $obj->{'index'}{'av_undef'} = {'text' => 'Undefines the array. The XS equivalent of C<undef(@array)>.

As well as freeing all the elements of the array (like C<av_clear()>), this
also frees the memory used by the av to store its list of scalars.

See L</av_clear> for a note about the array possibly being invalid on
return.

	void	av_undef(AV *av)','name' => 'av_undef'};
  $obj->{'index'}{'call_sv'} = {'text' => 'Performs a callback to the Perl sub specified by the SV.

If neither the C<G_METHOD> or C<G_METHOD_NAMED> flag is supplied, the
SV may be any of a CV, a GV, a reference to a CV, a reference to a GV
or C<SvPV(sv)> will be used as the name of the sub to call.

If the C<G_METHOD> flag is supplied, the SV may be a reference to a CV or
C<SvPV(sv)> will be used as the name of the method to call.

If the C<G_METHOD_NAMED> flag is supplied, C<SvPV(sv)> will be used as
the name of the method to call.

Some other values are treated specially for internal use and should
not be depended on.

See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_sv(SV* sv, VOL I32 flags)','name' => 'call_sv'};

  return $obj;
}

1;
