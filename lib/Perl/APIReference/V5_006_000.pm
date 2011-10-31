package Perl::APIReference::V5_006_000;
use strict;
use warnings;
use parent 'Perl::APIReference';

sub new {
  my $class = shift;
  my $VAR1;

do{$VAR1 = {'SvOOK' => {'text' => 'Returns a boolean indicating whether the SvIVX is a valid offset value for
the SvPVX.  This hack is used internally to speed up removal of characters
from the beginning of a SvPV.  When SvOOK is true, then the start of the
allocated string buffer is really (SvPVX - SvIVX).

	bool	SvOOK(SV* sv)','name' => 'SvOOK'},'hv_store_ent' => {'text' => 'Stores C<val> in a hash.  The hash key is specified as C<key>.  The C<hash>
parameter is the precomputed hash value; if it is zero then Perl will
compute it.  The return value is the new hash entry so created.  It will be
NULL if the operation failed or if the value did not need to be actually
stored within the hash (as in the case of tied hashes).  Otherwise the
contents of the return value can be accessed using the C<He???> macros
described here.  Note that the caller is responsible for suitably
incrementing the reference count of C<val> before the call, and
decrementing it if the function returned NULL. 

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	HE*	hv_store_ent(HV* tb, SV* key, SV* val, U32 hash)','name' => 'hv_store_ent'},'gv_stashsv' => {'text' => 'Returns a pointer to the stash for a specified package, which must be a
valid UTF-8 string.  See C<gv_stashpv>.

	HV*	gv_stashsv(SV* sv, I32 create)','name' => 'gv_stashsv'},'newXSproto' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.  Adds Perl prototypes to
the subs.','name' => 'newXSproto'},'XSRETURN_NV' => {'text' => 'Return an double from an XSUB immediately.  Uses C<XST_mNV>.

	void	XSRETURN_NV(NV nv)','name' => 'XSRETURN_NV'},'strGE' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than or equal to
the second, C<s2>.  Returns true or false.

	bool	strGE(char* s1, char* s2)','name' => 'strGE'},'SvPV' => {'text' => 'Returns a pointer to the string in the SV, or a stringified form of the SV
if the SV does not contain a string.  Handles \'get\' magic.

	char*	SvPV(SV* sv, STRLEN len)','name' => 'SvPV'},'svtype' => {'text' => 'An enum of flags for Perl types.  These are found in the file B<sv.h> 
in the C<svtype> enum.  Test these flags with the C<SvTYPE> macro.','name' => 'svtype'},'hv_clear' => {'text' => 'Clears a hash, making it empty.

	void	hv_clear(HV* tb)','name' => 'hv_clear'},'get_hv' => {'text' => 'Returns the HV of the specified Perl hash.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	HV*	get_hv(const char* name, I32 create)','name' => 'get_hv'},'XSRETURN_YES' => {'text' => 'Return C<&PL_sv_yes> from an XSUB immediately.  Uses C<XST_mYES>.

		XSRETURN_YES;','name' => 'XSRETURN_YES'},'Renewc' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function, with
cast.

	void	Renewc(void* ptr, int nitems, type, cast)','name' => 'Renewc'},'sv_insert' => {'text' => 'Inserts a string at the specified offset/length within the SV. Similar to
the Perl substr() function.

	void	sv_insert(SV* bigsv, STRLEN offset, STRLEN len, char* little, STRLEN littlelen)','name' => 'sv_insert'},'sv_catpvf_mg' => {'text' => 'Like C<sv_catpvf>, but also handles \'set\' magic.

	void	sv_catpvf_mg(SV *sv, const char* pat, ...)','name' => 'sv_catpvf_mg'},'SvPOK_off' => {'text' => 'Unsets the PV status of an SV.

	void	SvPOK_off(SV* sv)','name' => 'SvPOK_off'},'SvPOK' => {'text' => 'Returns a boolean indicating whether the SV contains a character
string.

	bool	SvPOK(SV* sv)','name' => 'SvPOK'},'PUSHu' => {'text' => 'Push an unsigned integer onto the stack.  The stack must have room for this
element.  See C<XPUSHu>.

	void	PUSHu(UV uv)','name' => 'PUSHu'},'get_sv' => {'text' => 'Returns the SV of the specified Perl scalar.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	SV*	get_sv(const char* name, I32 create)','name' => 'get_sv'},'newSVsv' => {'text' => 'Creates a new SV which is an exact duplicate of the original SV.

	SV*	newSVsv(SV* old)','name' => 'newSVsv'},'hv_magic' => {'text' => 'Adds magic to a hash.  See C<sv_magic>.

	void	hv_magic(HV* hv, GV* gv, int how)','name' => 'hv_magic'},'sv_setpv_mg' => {'text' => 'Like C<sv_setpv>, but also handles \'set\' magic.

	void	sv_setpv_mg(SV *sv, const char *ptr)','name' => 'sv_setpv_mg'},'XS' => {'text' => 'Macro to declare an XSUB and its C parameter list.  This is handled by
C<xsubpp>.','name' => 'XS'},'sv_setpvn' => {'text' => 'Copies a string into an SV.  The C<len> parameter indicates the number of
bytes to be copied.  Does not handle \'set\' magic.  See C<sv_setpvn_mg>.

	void	sv_setpvn(SV* sv, const char* ptr, STRLEN len)','name' => 'sv_setpvn'},'sv_2mortal' => {'text' => 'Marks an SV as mortal.  The SV will be destroyed when the current context
ends.

	SV*	sv_2mortal(SV* sv)','name' => 'sv_2mortal'},'mg_magical' => {'text' => 'Turns on the magical status of an SV.  See C<sv_magic>.

	void	mg_magical(SV* sv)','name' => 'mg_magical'},'newSVrv' => {'text' => 'Creates a new SV for the RV, C<rv>, to point to.  If C<rv> is not an RV then
it will be upgraded to one.  If C<classname> is non-null then the new SV will
be blessed in the specified package.  The new SV is returned and its
reference count is 1.

	SV*	newSVrv(SV* rv, const char* classname)','name' => 'newSVrv'},'strnEQ' => {'text' => 'Test two strings to see if they are equal.  The C<len> parameter indicates
the number of bytes to compare.  Returns true or false. (A wrapper for
C<strncmp>).

	bool	strnEQ(char* s1, char* s2, STRLEN len)','name' => 'strnEQ'},'av_undef' => {'text' => 'Undefines the array.  Frees the memory used by the array itself.

	void	av_undef(AV* ar)','name' => 'av_undef'},'HeKEY' => {'text' => 'Returns the actual pointer stored in the key slot of the hash entry. The
pointer may be either C<char*> or C<SV*>, depending on the value of
C<HeKLEN()>.  Can be assigned to.  The C<HePV()> or C<HeSVKEY()> macros are
usually preferable for finding the value of a key.

	void*	HeKEY(HE* he)','name' => 'HeKEY'},'sv_cmp' => {'text' => 'Compares the strings in two SVs.  Returns -1, 0, or 1 indicating whether the
string in C<sv1> is less than, equal to, or greater than the string in
C<sv2>.

	I32	sv_cmp(SV* sv1, SV* sv2)','name' => 'sv_cmp'},'SvNIOK_off' => {'text' => 'Unsets the NV/IV status of an SV.

	void	SvNIOK_off(SV* sv)','name' => 'SvNIOK_off'},'SvEND' => {'text' => 'Returns a pointer to the last character in the string which is in the SV.
See C<SvCUR>.  Access the character as *(SvEND(sv)).

	char*	SvEND(SV* sv)','name' => 'SvEND'},'sv_magic' => {'text' => 'Adds magic to an SV.

	void	sv_magic(SV* sv, SV* obj, int how, const char* name, I32 namlen)','name' => 'sv_magic'},'mg_free' => {'text' => 'Free any magic storage used by the SV.  See C<sv_magic>.

	int	mg_free(SV* sv)','name' => 'mg_free'},'GIMME_V' => {'text' => 'The XSUB-writer\'s equivalent to Perl\'s C<wantarray>.  Returns C<G_VOID>,
C<G_SCALAR> or C<G_ARRAY> for void, scalar or array context,
respectively.

	U32	GIMME_V','name' => 'GIMME_V'},'dMARK' => {'text' => 'Declare a stack marker variable, C<mark>, for the XSUB.  See C<MARK> and
C<dORIGMARK>.

		dMARK;','name' => 'dMARK'},'New' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.

	void	New(int id, void* ptr, int nitems, type)','name' => 'New'},'Copy' => {'text' => 'The XSUB-writer\'s interface to the C C<memcpy> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and C<type> is
the type.  May fail on overlapping copies.  See also C<Move>.

	void	Copy(void* src, void* dest, int nitems, type)','name' => 'Copy'},'CvSTASH' => {'text' => 'Returns the stash of the CV.

	HV*	CvSTASH(CV* cv)','name' => 'CvSTASH'},'SvNOK_off' => {'text' => 'Unsets the NV status of an SV.

	void	SvNOK_off(SV* sv)','name' => 'SvNOK_off'},'G_ARRAY' => {'text' => 'Used to indicate array context.  See C<GIMME_V>, C<GIMME> and
L<perlcall>.','name' => 'G_ARRAY'},'dXSARGS' => {'text' => 'Sets up stack and mark pointers for an XSUB, calling dSP and dMARK.  This
is usually handled automatically by C<xsubpp>.  Declares the C<items>
variable to indicate the number of items on the stack.

		dXSARGS;','name' => 'dXSARGS'},'XS_VERSION_BOOTCHECK' => {'text' => 'Macro to verify that a PM module\'s $VERSION variable matches the XS
module\'s C<XS_VERSION> variable.  This is usually handled automatically by
C<xsubpp>.  See L<perlxs/"The VERSIONCHECK: Keyword">.

		XS_VERSION_BOOTCHECK;','name' => 'XS_VERSION_BOOTCHECK'},'Safefree' => {'text' => 'The XSUB-writer\'s interface to the C C<free> function.

	void	Safefree(void* src, void* dest, int nitems, type)','name' => 'Safefree'},'isSPACE' => {'text' => 'Returns a boolean indicating whether the C C<char> is whitespace.

	bool	isSPACE(char ch)','name' => 'isSPACE'},'SvROK' => {'text' => 'Tests if the SV is an RV.

	bool	SvROK(SV* sv)','name' => 'SvROK'},'sv_unref' => {'text' => 'Unsets the RV status of the SV, and decrements the reference count of
whatever was being referenced by the RV.  This can almost be thought of
as a reversal of C<newSVrv>.  See C<SvROK_off>.

	void	sv_unref(SV* sv)','name' => 'sv_unref'},'SvSETMAGIC' => {'text' => 'Invokes C<mg_set> on an SV if it has \'set\' magic.  This macro evaluates its
argument more than once.

	void	SvSETMAGIC(SV* sv)','name' => 'SvSETMAGIC'},'G_EVAL' => {'text' => 'Used to force a Perl C<eval> wrapper around a callback.  See
L<perlcall>.','name' => 'G_EVAL'},'sv_catsv_mg' => {'text' => 'Like C<sv_catsv>, but also handles \'set\' magic.

	void	sv_catsv_mg(SV *dstr, SV *sstr)','name' => 'sv_catsv_mg'},'call_argv' => {'text' => 'Performs a callback to the specified Perl sub.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_argv(const char* sub_name, I32 flags, char** argv)','name' => 'call_argv'},'SvPV_nolen' => {'text' => 'Returns a pointer to the string in the SV, or a stringified form of the SV
if the SV does not contain a string.  Handles \'get\' magic.

	char*	SvPV_nolen(SV* sv)','name' => 'SvPV_nolen'},'sv_setnv' => {'text' => 'Copies a double into the given SV.  Does not handle \'set\' magic.  See
C<sv_setnv_mg>.

	void	sv_setnv(SV* sv, NV num)','name' => 'sv_setnv'},'SvSetSV' => {'text' => 'Calls C<sv_setsv> if dsv is not the same as ssv.  May evaluate arguments
more than once.

	void	SvSetSV(SV* dsb, SV* ssv)','name' => 'SvSetSV'},'XPUSHp' => {'text' => 'Push a string onto the stack, extending the stack if necessary.  The C<len>
indicates the length of the string.  Handles \'set\' magic.  See
C<PUSHp>.

	void	XPUSHp(char* str, STRLEN len)','name' => 'XPUSHp'},'newHV' => {'text' => 'Creates a new HV.  The reference count is set to 1.

	HV*	newHV()','name' => 'newHV'},'strnNE' => {'text' => 'Test two strings to see if they are different.  The C<len> parameter
indicates the number of bytes to compare.  Returns true or false. (A
wrapper for C<strncmp>).

	bool	strnNE(char* s1, char* s2, STRLEN len)','name' => 'strnNE'},'strNE' => {'text' => 'Test two strings to see if they are different.  Returns true or
false.

	bool	strNE(char* s1, char* s2)','name' => 'strNE'},'sv_setpvn_mg' => {'text' => 'Like C<sv_setpvn>, but also handles \'set\' magic.

	void	sv_setpvn_mg(SV *sv, const char *ptr, STRLEN len)','name' => 'sv_setpvn_mg'},'savepv' => {'text' => 'Copy a string to a safe spot.  This does not use an SV.

	char*	savepv(const char* sv)','name' => 'savepv'},'toLOWER' => {'text' => 'Converts the specified character to lowercase.

	char	toLOWER(char ch)','name' => 'toLOWER'},'newAV' => {'text' => 'Creates a new AV.  The reference count is set to 1.

	AV*	newAV()','name' => 'newAV'},'POPp' => {'text' => 'Pops a string off the stack.

	char*	POPp','name' => 'POPp'},'HvNAME' => {'text' => 'Returns the package name of a stash.  See C<SvSTASH>, C<CvSTASH>.

	char*	HvNAME(HV* stash)','name' => 'HvNAME'},'av_make' => {'text' => 'Creates a new AV and populates it with a list of SVs.  The SVs are copied
into the array, so they may be freed after the call to av_make.  The new AV
will have a reference count of 1.

	AV*	av_make(I32 size, SV** svp)','name' => 'av_make'},'RETVAL' => {'text' => 'Variable which is setup by C<xsubpp> to hold the return value for an 
XSUB. This is always the proper type for the XSUB. See 
L<perlxs/"The RETVAL Variable">.

	(whatever)	RETVAL','name' => 'RETVAL'},'HeSVKEY' => {'text' => 'Returns the key as an C<SV*>, or C<Nullsv> if the hash entry does not
contain an C<SV*> key.

	SV*	HeSVKEY(HE* he)','name' => 'HeSVKEY'},'SvUV' => {'text' => 'Coerces the given SV to an unsigned integer and returns it.

	UV	SvUV(SV* sv)','name' => 'SvUV'},'perl_run' => {'text' => 'Tells a Perl interpreter to run.  See L<perlembed>.

	int	perl_run(PerlInterpreter* interp)','name' => 'perl_run'},'Nullav' => {'text' => 'Null AV pointer.','name' => 'Nullav'},'PL_DBtrace' => {'text' => 'Trace variable used when Perl is run in debugging mode, with the B<-d>
switch.  This is the C variable which corresponds to Perl\'s $DB::trace
variable.  See C<PL_DBsingle>.

	SV *	PL_DBtrace','name' => 'PL_DBtrace'},'sv_setpviv' => {'text' => 'Copies an integer into the given SV, also updating its string value.
Does not handle \'set\' magic.  See C<sv_setpviv_mg>.

	void	sv_setpviv(SV* sv, IV num)','name' => 'sv_setpviv'},'sv_setnv_mg' => {'text' => 'Like C<sv_setnv>, but also handles \'set\' magic.

	void	sv_setnv_mg(SV *sv, NV num)','name' => 'sv_setnv_mg'},'hv_iternextsv' => {'text' => 'Performs an C<hv_iternext>, C<hv_iterkey>, and C<hv_iterval> in one
operation.

	SV*	hv_iternextsv(HV* hv, char** key, I32* retlen)','name' => 'hv_iternextsv'},'sv_derived_from' => {'text' => 'Returns a boolean indicating whether the SV is derived from the specified
class.  This is the function that implements C<UNIVERSAL::isa>.  It works
for class names as well as for objects.

	bool	sv_derived_from(SV* sv, const char* name)','name' => 'sv_derived_from'},'SvIOK_on' => {'text' => 'Tells an SV that it is an integer.

	void	SvIOK_on(SV* sv)','name' => 'SvIOK_on'},'XST_mIV' => {'text' => 'Place an integer into the specified position C<pos> on the stack.  The
value is stored in a new mortal SV.

	void	XST_mIV(int pos, IV iv)','name' => 'XST_mIV'},'hv_exists' => {'text' => 'Returns a boolean indicating whether the specified hash key exists.  The
C<klen> is the length of the key.

	bool	hv_exists(HV* tb, const char* key, U32 klen)','name' => 'hv_exists'},'dSP' => {'text' => 'Declares a local copy of perl\'s stack pointer for the XSUB, available via
the C<SP> macro.  See C<SP>.

		dSP;','name' => 'dSP'},'G_DISCARD' => {'text' => 'Indicates that arguments returned from a callback should be discarded.  See
L<perlcall>.','name' => 'G_DISCARD'},'Nullsv' => {'text' => 'Null SV pointer.','name' => 'Nullsv'},'mg_length' => {'text' => 'Report on the SV\'s length.  See C<sv_magic>.

	U32	mg_length(SV* sv)','name' => 'mg_length'},'GvSV' => {'text' => 'Return the SV from the GV.

	SV*	GvSV(GV* gv)','name' => 'GvSV'},'SvPVX' => {'text' => 'Returns a pointer to the string in the SV.  The SV must contain a
string.

	char*	SvPVX(SV* sv)','name' => 'SvPVX'},'XST_mNV' => {'text' => 'Place a double into the specified position C<pos> on the stack.  The value
is stored in a new mortal SV.

	void	XST_mNV(int pos, NV nv)','name' => 'XST_mNV'},'XPUSHi' => {'text' => 'Push an integer onto the stack, extending the stack if necessary.  Handles
\'set\' magic. See C<PUSHi>.

	void	XPUSHi(IV iv)','name' => 'XPUSHi'},'HEf_SVKEY' => {'text' => 'This flag, used in the length slot of hash entries and magic structures,
specifies the structure contains a C<SV*> pointer where a C<char*> pointer
is to be expected. (For information only--not to be used).','name' => 'HEf_SVKEY'},'POPi' => {'text' => 'Pops an integer off the stack.

	IV	POPi','name' => 'POPi'},'SvTAINTED_on' => {'text' => 'Marks an SV as tainted.

	void	SvTAINTED_on(SV* sv)','name' => 'SvTAINTED_on'},'SVt_NV' => {'text' => 'Double type flag for scalars.  See C<svtype>.','name' => 'SVt_NV'},'sv_vcatpvfn' => {'text' => 'Processes its arguments like C<vsprintf> and appends the formatted output
to an SV.  Uses an array of SVs if the C style variable argument list is
missing (NULL).  When running with taint checks enabled, indicates via
C<maybe_tainted> if results are untrustworthy (often due to the use of
locales).

	void	sv_vcatpvfn(SV* sv, const char* pat, STRLEN patlen, va_list* args, SV** svargs, I32 svmax, bool *maybe_tainted)','name' => 'sv_vcatpvfn'},'av_store' => {'text' => 'Stores an SV in an array.  The array index is specified as C<key>.  The
return value will be NULL if the operation failed or if the value did not
need to be actually stored within the array (as in the case of tied
arrays). Otherwise it can be dereferenced to get the original C<SV*>.  Note
that the caller is responsible for suitably incrementing the reference
count of C<val> before the call, and decrementing it if the function
returned NULL.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays.

	SV**	av_store(AV* ar, I32 key, SV* val)','name' => 'av_store'},'PUSHMARK' => {'text' => 'Opening bracket for arguments on a callback.  See C<PUTBACK> and
L<perlcall>.

		PUSHMARK;','name' => 'PUSHMARK'},'ST' => {'text' => 'Used to access elements on the XSUB\'s stack.

	SV*	ST(int ix)','name' => 'ST'},'strLT' => {'text' => 'Test two strings to see if the first, C<s1>, is less than the second,
C<s2>.  Returns true or false.

	bool	strLT(char* s1, char* s2)','name' => 'strLT'},'call_pv' => {'text' => 'Performs a callback to the specified Perl sub.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_pv(const char* sub_name, I32 flags)','name' => 'call_pv'},'av_shift' => {'text' => 'Shifts an SV off the beginning of the array.

	SV*	av_shift(AV* ar)','name' => 'av_shift'},'av_fetch' => {'text' => 'Returns the SV at the specified index in the array.  The C<key> is the
index.  If C<lval> is set then the fetch will be part of a store.  Check
that the return value is non-null before dereferencing it to a C<SV*>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays. 

	SV**	av_fetch(AV* ar, I32 key, I32 lval)','name' => 'av_fetch'},'SvNOK_only' => {'text' => 'Tells an SV that it is a double and disables all other OK bits.

	void	SvNOK_only(SV* sv)','name' => 'SvNOK_only'},'hv_iterval' => {'text' => 'Returns the value from the current position of the hash iterator.  See
C<hv_iterkey>.

	SV*	hv_iterval(HV* tb, HE* entry)','name' => 'hv_iterval'},'SVt_IV' => {'text' => 'Integer type flag for scalars.  See C<svtype>.','name' => 'SVt_IV'},'av_len' => {'text' => 'Returns the highest index in the array.  Returns -1 if the array is
empty.

	I32	av_len(AV* ar)','name' => 'av_len'},'sv_setiv_mg' => {'text' => 'Like C<sv_setiv>, but also handles \'set\' magic.

	void	sv_setiv_mg(SV *sv, IV i)','name' => 'sv_setiv_mg'},'sv_catsv' => {'text' => 'Concatenates the string from SV C<ssv> onto the end of the string in SV
C<dsv>.  Handles \'get\' magic, but not \'set\' magic.  See C<sv_catsv_mg>.

	void	sv_catsv(SV* dsv, SV* ssv)','name' => 'sv_catsv'},'SvTAINT' => {'text' => 'Taints an SV if tainting is enabled

	void	SvTAINT(SV* sv)','name' => 'SvTAINT'},'PUTBACK' => {'text' => 'Closing bracket for XSUB arguments.  This is usually handled by C<xsubpp>.
See C<PUSHMARK> and L<perlcall> for other uses.

		PUTBACK;','name' => 'PUTBACK'},'SvPOK_on' => {'text' => 'Tells an SV that it is a string.

	void	SvPOK_on(SV* sv)','name' => 'SvPOK_on'},'mg_clear' => {'text' => 'Clear something magical that the SV represents.  See C<sv_magic>.

	int	mg_clear(SV* sv)','name' => 'mg_clear'},'SvCUR_set' => {'text' => 'Set the length of the string which is in the SV.  See C<SvCUR>.

	void	SvCUR_set(SV* sv, STRLEN len)','name' => 'SvCUR_set'},'SvNOK' => {'text' => 'Returns a boolean indicating whether the SV contains a double.

	bool	SvNOK(SV* sv)','name' => 'SvNOK'},'gv_stashpv' => {'text' => 'Returns a pointer to the stash for a specified package.  C<name> should
be a valid UTF-8 string.  If C<create> is set then the package will be
created if it does not already exist.  If C<create> is not set and the
package does not exist then NULL is returned.

	HV*	gv_stashpv(const char* name, I32 create)','name' => 'gv_stashpv'},'G_SCALAR' => {'text' => 'Used to indicate scalar context.  See C<GIMME_V>, C<GIMME>, and
L<perlcall>.','name' => 'G_SCALAR'},'PUSHi' => {'text' => 'Push an integer onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  See C<XPUSHi>.

	void	PUSHi(IV iv)','name' => 'PUSHi'},'hv_exists_ent' => {'text' => 'Returns a boolean indicating whether the specified hash key exists. C<hash>
can be a valid precomputed hash value, or 0 to ask for it to be
computed.

	bool	hv_exists_ent(HV* tb, SV* key, U32 hash)','name' => 'hv_exists_ent'},'SvNIOK' => {'text' => 'Returns a boolean indicating whether the SV contains a number, integer or
double.

	bool	SvNIOK(SV* sv)','name' => 'SvNIOK'},'SvTAINTED_off' => {'text' => 'Untaints an SV. Be I<very> careful with this routine, as it short-circuits
some of Perl\'s fundamental security features. XS module authors should not
use this function unless they fully understand all the implications of
unconditionally untainting the value. Untainting should be done in the
standard perl fashion, via a carefully crafted regexp, rather than directly
untainting variables.

	void	SvTAINTED_off(SV* sv)','name' => 'SvTAINTED_off'},'newSVpvf' => {'text' => 'Creates a new SV an initialize it with the string formatted like
C<sprintf>.

	SV*	newSVpvf(const char* pat, ...)','name' => 'newSVpvf'},'require_pv' => {'text' => 'Tells Perl to C<require> a module.

NOTE: the perl_ form of this function is deprecated.

	void	require_pv(const char* pv)','name' => 'require_pv'},'sv_upgrade' => {'text' => 'Upgrade an SV to a more complex form.  Use C<SvUPGRADE>.  See
C<svtype>.

	bool	sv_upgrade(SV* sv, U32 mt)','name' => 'sv_upgrade'},'strEQ' => {'text' => 'Test two strings to see if they are equal.  Returns true or false.

	bool	strEQ(char* s1, char* s2)','name' => 'strEQ'},'hv_store' => {'text' => 'Stores an SV in a hash.  The hash key is specified as C<key> and C<klen> is
the length of the key.  The C<hash> parameter is the precomputed hash
value; if it is zero then Perl will compute it.  The return value will be
NULL if the operation failed or if the value did not need to be actually
stored within the hash (as in the case of tied hashes).  Otherwise it can
be dereferenced to get the original C<SV*>.  Note that the caller is
responsible for suitably incrementing the reference count of C<val> before
the call, and decrementing it if the function returned NULL.  

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	SV**	hv_store(HV* tb, const char* key, U32 klen, SV* val, U32 hash)','name' => 'hv_store'},'XSRETURN_IV' => {'text' => 'Return an integer from an XSUB immediately.  Uses C<XST_mIV>.

	void	XSRETURN_IV(IV iv)','name' => 'XSRETURN_IV'},'SvIVX' => {'text' => 'Returns the integer which is stored in the SV, assuming SvIOK is
true.

	IV	SvIVX(SV* sv)','name' => 'SvIVX'},'perl_destruct' => {'text' => 'Shuts down a Perl interpreter.  See L<perlembed>.

	void	perl_destruct(PerlInterpreter* interp)','name' => 'perl_destruct'},'isUPPER' => {'text' => 'Returns a boolean indicating whether the C C<char> is an uppercase
character.

	bool	isUPPER(char ch)','name' => 'isUPPER'},'SvREFCNT_dec' => {'text' => 'Decrements the reference count of the given SV.

	void	SvREFCNT_dec(SV* sv)','name' => 'SvREFCNT_dec'},'XST_mYES' => {'text' => 'Place C<&PL_sv_yes> into the specified position C<pos> on the
stack.

	void	XST_mYES(int pos)','name' => 'XST_mYES'},'sv_setsv' => {'text' => 'Copies the contents of the source SV C<ssv> into the destination SV C<dsv>.
The source SV may be destroyed if it is mortal.  Does not handle \'set\'
magic.  See the macro forms C<SvSetSV>, C<SvSetSV_nosteal> and
C<sv_setsv_mg>.

	void	sv_setsv(SV* dsv, SV* ssv)','name' => 'sv_setsv'},'SvIOK_off' => {'text' => 'Unsets the IV status of an SV.

	void	SvIOK_off(SV* sv)','name' => 'SvIOK_off'},'POPs' => {'text' => 'Pops an SV off the stack.

	SV*	POPs','name' => 'POPs'},'SvNV' => {'text' => 'Coerce the given SV to a double and return it.

	NV	SvNV(SV* sv)','name' => 'SvNV'},'gv_fetchmethod_autoload' => {'text' => 'Returns the glob which contains the subroutine to call to invoke the method
on the C<stash>.  In fact in the presence of autoloading this may be the
glob for "AUTOLOAD".  In this case the corresponding variable $AUTOLOAD is
already setup. 

The third parameter of C<gv_fetchmethod_autoload> determines whether
AUTOLOAD lookup is performed if the given method is not present: non-zero
means yes, look for AUTOLOAD; zero means no, don\'t look for AUTOLOAD. 
Calling C<gv_fetchmethod> is equivalent to calling C<gv_fetchmethod_autoload>
with a non-zero C<autoload> parameter. 

These functions grant C<"SUPER"> token as a prefix of the method name. Note
that if you want to keep the returned glob for a long time, you need to
check for it being "AUTOLOAD", since at the later time the call may load a
different subroutine due to $AUTOLOAD changing its value. Use the glob
created via a side effect to do this. 

These functions have the same side-effects and as C<gv_fetchmeth> with
C<level==0>.  C<name> should be writable if contains C<\':\'> or C<\'
\'\'>. The warning against passing the GV returned by C<gv_fetchmeth> to
C<call_sv> apply equally to these functions. 

	GV*	gv_fetchmethod_autoload(HV* stash, const char* name, I32 autoload)','name' => 'gv_fetchmethod_autoload'},'sv_setsv_mg' => {'text' => 'Like C<sv_setsv>, but also handles \'set\' magic.

	void	sv_setsv_mg(SV *dstr, SV *sstr)','name' => 'sv_setsv_mg'},'hv_fetch_ent' => {'text' => 'Returns the hash entry which corresponds to the specified key in the hash.
C<hash> must be a valid precomputed hash number for the given C<key>, or 0
if you want the function to compute it.  IF C<lval> is set then the fetch
will be part of a store.  Make sure the return value is non-null before
accessing it.  The return value when C<tb> is a tied hash is a pointer to a
static location, so be sure to make a copy of the structure if you need to
store it somewhere. 

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	HE*	hv_fetch_ent(HV* tb, SV* key, I32 lval, U32 hash)','name' => 'hv_fetch_ent'},'ENTER' => {'text' => 'Opening bracket on a callback.  See C<LEAVE> and L<perlcall>.

		ENTER;','name' => 'ENTER'},'isLOWER' => {'text' => 'Returns a boolean indicating whether the C C<char> is a lowercase
character.

	bool	isLOWER(char ch)','name' => 'isLOWER'},'sv_eq' => {'text' => 'Returns a boolean indicating whether the strings in the two SVs are
identical.

	I32	sv_eq(SV* sv1, SV* sv2)','name' => 'sv_eq'},'SvTAINTED' => {'text' => 'Checks to see if an SV is tainted. Returns TRUE if it is, FALSE if
not.

	bool	SvTAINTED(SV* sv)','name' => 'SvTAINTED'},'PL_sv_no' => {'text' => 'This is the C<false> SV.  See C<PL_sv_yes>.  Always refer to this as
C<&PL_sv_no>.

	SV	PL_sv_no','name' => 'PL_sv_no'},'hv_iterkey' => {'text' => 'Returns the key from the current position of the hash iterator.  See
C<hv_iterinit>.

	char*	hv_iterkey(HE* entry, I32* retlen)','name' => 'hv_iterkey'},'SvNOKp' => {'text' => 'Returns a boolean indicating whether the SV contains a double.  Checks the
B<private> setting.  Use C<SvNOK>.

	bool	SvNOKp(SV* sv)','name' => 'SvNOKp'},'ix' => {'text' => 'Variable which is setup by C<xsubpp> to indicate which of an 
XSUB\'s aliases was used to invoke it.  See L<perlxs/"The ALIAS: Keyword">.

	I32	ix','name' => 'ix'},'StructCopy' => {'text' => 'This is an architecture-independant macro to copy one structure to another.

	void	StructCopy(type src, type dest, type)','name' => 'StructCopy'},'PUSHs' => {'text' => 'Push an SV onto the stack.  The stack must have room for this element. 
Does not handle \'set\' magic.  See C<XPUSHs>.

	void	PUSHs(SV* sv)','name' => 'PUSHs'},'sv_setuv' => {'text' => 'Copies an unsigned integer into the given SV.  Does not handle \'set\' magic.
See C<sv_setuv_mg>.

	void	sv_setuv(SV* sv, UV num)','name' => 'sv_setuv'},'SvUPGRADE' => {'text' => 'Used to upgrade an SV to a more complex form.  Uses C<sv_upgrade> to
perform the upgrade if necessary.  See C<svtype>.

	void	SvUPGRADE(SV* sv, svtype type)','name' => 'SvUPGRADE'},'items' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the number of 
items on the stack.  See L<perlxs/"Variable-length Parameter Lists">.

	I32	items','name' => 'items'},'XST_mPV' => {'text' => 'Place a copy of a string into the specified position C<pos> on the stack. 
The value is stored in a new mortal SV.

	void	XST_mPV(int pos, char* str)','name' => 'XST_mPV'},'dXSI32' => {'text' => 'Sets up the C<ix> variable for an XSUB which has aliases.  This is usually
handled automatically by C<xsubpp>.

		dXSI32;','name' => 'dXSI32'},'sv_setref_iv' => {'text' => 'Copies an integer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<Nullch> to avoid the blessing.  The new SV
will be returned and will have a reference count of 1.

	SV*	sv_setref_iv(SV* rv, const char* classname, IV iv)','name' => 'sv_setref_iv'},'sv_chop' => {'text' => 'Efficient removal of characters from the beginning of the string buffer. 
SvPOK(sv) must be true and the C<ptr> must be a pointer to somewhere inside
the string buffer.  The C<ptr> becomes the first character of the adjusted
string.

	void	sv_chop(SV* sv, char* ptr)','name' => 'sv_chop'},'XPUSHu' => {'text' => 'Push an unsigned integer onto the stack, extending the stack if necessary. 
See C<PUSHu>.

	void	XPUSHu(UV uv)','name' => 'XPUSHu'},'sv_grow' => {'text' => 'Expands the character buffer in the SV.  This will use C<sv_unref> and will
upgrade the SV to C<SVt_PV>.  Returns a pointer to the character buffer.
Use C<SvGROW>.

	char*	sv_grow(SV* sv, STRLEN newlen)','name' => 'sv_grow'},'sv_setuv_mg' => {'text' => 'Like C<sv_setuv>, but also handles \'set\' magic.

	void	sv_setuv_mg(SV *sv, UV u)','name' => 'sv_setuv_mg'},'XS_VERSION' => {'text' => 'The version identifier for an XS module.  This is usually
handled automatically by C<ExtUtils::MakeMaker>.  See C<XS_VERSION_BOOTCHECK>.','name' => 'XS_VERSION'},'newSVnv' => {'text' => 'Creates a new SV and copies a floating point value into it.
The reference count for the SV is set to 1.

	SV*	newSVnv(NV n)','name' => 'newSVnv'},'XPUSHs' => {'text' => 'Push an SV onto the stack, extending the stack if necessary.  Does not
handle \'set\' magic.  See C<PUSHs>.

	void	XPUSHs(SV* sv)','name' => 'XPUSHs'},'HeVAL' => {'text' => 'Returns the value slot (type C<SV*>) stored in the hash entry.

	SV*	HeVAL(HE* he)','name' => 'HeVAL'},'HePV' => {'text' => 'Returns the key slot of the hash entry as a C<char*> value, doing any
necessary dereferencing of possibly C<SV*> keys.  The length of the string
is placed in C<len> (this is a macro, so do I<not> use C<&len>).  If you do
not care about what the length of the key is, you may use the global
variable C<PL_na>, though this is rather less efficient than using a local
variable.  Remember though, that hash keys in perl are free to contain
embedded nulls, so using C<strlen()> or similar is not a good way to find
the length of hash keys. This is very similar to the C<SvPV()> macro
described elsewhere in this document.

	char*	HePV(HE* he, STRLEN len)','name' => 'HePV'},'PL_na' => {'text' => 'A convenience variable which is typically used with C<SvPV> when one
doesn\'t care about the length of the string.  It is usually more efficient
to either declare a local variable and use that instead or to use the
C<SvPV_nolen> macro.

	STRLEN	PL_na','name' => 'PL_na'},'newSViv' => {'text' => 'Creates a new SV and copies an integer into it.  The reference count for the
SV is set to 1.

	SV*	newSViv(IV i)','name' => 'newSViv'},'sv_setpv' => {'text' => 'Copies a string into an SV.  The string must be null-terminated.  Does not
handle \'set\' magic.  See C<sv_setpv_mg>.

	void	sv_setpv(SV* sv, const char* ptr)','name' => 'sv_setpv'},'SVt_PVHV' => {'text' => 'Type flag for hashes.  See C<svtype>.','name' => 'SVt_PVHV'},'gv_fetchmethod' => {'text' => 'See L<gv_fetchmethod_autoload>.

	GV*	gv_fetchmethod(HV* stash, const char* name)','name' => 'gv_fetchmethod'},'PL_DBsub' => {'text' => 'When Perl is run in debugging mode, with the B<-d> switch, this GV contains
the SV which holds the name of the sub being debugged.  This is the C
variable which corresponds to Perl\'s $DB::sub variable.  See
C<PL_DBsingle>.

	GV *	PL_DBsub','name' => 'PL_DBsub'},'SvGETMAGIC' => {'text' => 'Invokes C<mg_get> on an SV if it has \'get\' magic.  This macro evaluates its
argument more than once.

	void	SvGETMAGIC(SV* sv)','name' => 'SvGETMAGIC'},'SvGROW' => {'text' => 'Expands the character buffer in the SV so that it has room for the
indicated number of bytes (remember to reserve space for an extra trailing
NUL character).  Calls C<sv_grow> to perform the expansion if necessary. 
Returns a pointer to the character buffer.

	void	SvGROW(SV* sv, STRLEN len)','name' => 'SvGROW'},'sv_inc' => {'text' => 'Auto-increment of the value in the SV.

	void	sv_inc(SV* sv)','name' => 'sv_inc'},'sv_usepvn' => {'text' => 'Tells an SV to use C<ptr> to find its string value.  Normally the string is
stored inside the SV but sv_usepvn allows the SV to use an outside string. 
The C<ptr> should point to memory that was allocated by C<malloc>.  The
string length, C<len>, must be supplied.  This function will realloc the
memory pointed to by C<ptr>, so that pointer should not be freed or used by
the programmer after giving it to sv_usepvn.  Does not handle \'set\' magic.
See C<sv_usepvn_mg>.

	void	sv_usepvn(SV* sv, char* ptr, STRLEN len)','name' => 'sv_usepvn'},'sv_catpv' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.
Handles \'get\' magic, but not \'set\' magic.  See C<sv_catpv_mg>.

	void	sv_catpv(SV* sv, const char* ptr)','name' => 'sv_catpv'},'SvREFCNT' => {'text' => 'Returns the value of the object\'s reference count.

	U32	SvREFCNT(SV* sv)','name' => 'SvREFCNT'},'sv_len' => {'text' => 'Returns the length of the string in the SV.  See also C<SvCUR>.

	STRLEN	sv_len(SV* sv)','name' => 'sv_len'},'warn' => {'text' => 'This is the XSUB-writer\'s interface to Perl\'s C<warn> function.  Use this
function the same way you use the C C<printf> function.  See
C<croak>.

	void	warn(const char* pat, ...)','name' => 'warn'},'LEAVE' => {'text' => 'Closing bracket on a callback.  See C<ENTER> and L<perlcall>.

		LEAVE;','name' => 'LEAVE'},'SVt_PVAV' => {'text' => 'Type flag for arrays.  See C<svtype>.','name' => 'SVt_PVAV'},'hv_delete' => {'text' => 'Deletes a key/value pair in the hash.  The value SV is removed from the
hash and returned to the caller.  The C<klen> is the length of the key. 
The C<flags> value will normally be zero; if set to G_DISCARD then NULL
will be returned.

	SV*	hv_delete(HV* tb, const char* key, U32 klen, I32 flags)','name' => 'hv_delete'},'hv_undef' => {'text' => 'Undefines the hash.

	void	hv_undef(HV* tb)','name' => 'hv_undef'},'hv_delete_ent' => {'text' => 'Deletes a key/value pair in the hash.  The value SV is removed from the
hash and returned to the caller.  The C<flags> value will normally be zero;
if set to G_DISCARD then NULL will be returned.  C<hash> can be a valid
precomputed hash value, or 0 to ask for it to be computed.

	SV*	hv_delete_ent(HV* tb, SV* key, I32 flags, U32 hash)','name' => 'hv_delete_ent'},'CLASS' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the 
class name for a C++ XS constructor.  This is always a C<char*>.  See C<THIS>.

	char*	CLASS','name' => 'CLASS'},'Newc' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function, with
cast.

	void	Newc(int id, void* ptr, int nitems, type, cast)','name' => 'Newc'},'sv_isobject' => {'text' => 'Returns a boolean indicating whether the SV is an RV pointing to a blessed
object.  If the SV is not an RV, or if the object is not blessed, then this
will return false.

	int	sv_isobject(SV* sv)','name' => 'sv_isobject'},'HeKLEN' => {'text' => 'If this is negative, and amounts to C<HEf_SVKEY>, it indicates the entry
holds an C<SV*> key.  Otherwise, holds the actual length of the key.  Can
be assigned to. The C<HePV()> macro is usually preferable for finding key
lengths.

	STRLEN	HeKLEN(HE* he)','name' => 'HeKLEN'},'PUSHn' => {'text' => 'Push a double onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  See C<XPUSHn>.

	void	PUSHn(NV nv)','name' => 'PUSHn'},'SvIV' => {'text' => 'Coerces the given SV to an integer and returns it.

	IV	SvIV(SV* sv)','name' => 'SvIV'},'sv_setiv' => {'text' => 'Copies an integer into the given SV.  Does not handle \'set\' magic.  See
C<sv_setiv_mg>.

	void	sv_setiv(SV* sv, IV num)','name' => 'sv_setiv'},'EXTEND' => {'text' => 'Used to extend the argument stack for an XSUB\'s return values. Once
used, guarrantees that there is room for at least C<nitems> to be pushed
onto the stack.

	void	EXTEND(SP, int nitems)','name' => 'EXTEND'},'PL_sv_yes' => {'text' => 'This is the C<true> SV.  See C<PL_sv_no>.  Always refer to this as
C<&PL_sv_yes>.

	SV	PL_sv_yes','name' => 'PL_sv_yes'},'newSVuv' => {'text' => 'Creates a new SV and copies an unsigned integer into it.
The reference count for the SV is set to 1.

	SV*	newSVuv(UV u)','name' => 'newSVuv'},'SvNVX' => {'text' => 'Returns the double which is stored in the SV, assuming SvNOK is
true.

	NV	SvNVX(SV* sv)','name' => 'SvNVX'},'gv_fetchmeth' => {'text' => 'Returns the glob with the given C<name> and a defined subroutine or
C<NULL>.  The glob lives in the given C<stash>, or in the stashes
accessible via @ISA and @UNIVERSAL. 

The argument C<level> should be either 0 or -1.  If C<level==0>, as a
side-effect creates a glob with the given C<name> in the given C<stash>
which in the case of success contains an alias for the subroutine, and sets
up caching info for this glob.  Similarly for all the searched stashes. 

This function grants C<"SUPER"> token as a postfix of the stash name. The
GV returned from C<gv_fetchmeth> may be a method cache entry, which is not
visible to Perl code.  So when calling C<call_sv>, you should not use
the GV directly; instead, you should use the method\'s CV, which can be
obtained from the GV with the C<GvCV> macro. 

	GV*	gv_fetchmeth(HV* stash, const char* name, STRLEN len, I32 level)','name' => 'gv_fetchmeth'},'looks_like_number' => {'text' => 'Test if an the content of an SV looks like a number (or is a
number).

	I32	looks_like_number(SV* sv)','name' => 'looks_like_number'},'sv_catpv_mg' => {'text' => 'Like C<sv_catpv>, but also handles \'set\' magic.

	void	sv_catpv_mg(SV *sv, const char *ptr)','name' => 'sv_catpv_mg'},'XSRETURN_EMPTY' => {'text' => 'Return an empty list from an XSUB immediately.

		XSRETURN_EMPTY;','name' => 'XSRETURN_EMPTY'},'HeHASH' => {'text' => 'Returns the computed hash stored in the hash entry.

	U32	HeHASH(HE* he)','name' => 'HeHASH'},'SvIOK' => {'text' => 'Returns a boolean indicating whether the SV contains an integer.

	bool	SvIOK(SV* sv)','name' => 'SvIOK'},'newSVpv' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  If C<len> is zero, Perl will compute the length using
strlen().  For efficiency, consider using C<newSVpvn> instead.

	SV*	newSVpv(const char* s, STRLEN len)','name' => 'newSVpv'},'fbm_instr' => {'text' => 'Returns the location of the SV in the string delimited by C<str> and
C<strend>.  It returns C<Nullch> if the string can\'t be found.  The C<sv>
does not have to be fbm_compiled, but the search will not be as fast
then.

	char*	fbm_instr(unsigned char* big, unsigned char* bigend, SV* littlesv, U32 flags)','name' => 'fbm_instr'},'sv_setpvf' => {'text' => 'Processes its arguments like C<sprintf> and sets an SV to the formatted
output.  Does not handle \'set\' magic.  See C<sv_setpvf_mg>.

	void	sv_setpvf(SV* sv, const char* pat, ...)','name' => 'sv_setpvf'},'XPUSHn' => {'text' => 'Push a double onto the stack, extending the stack if necessary.  Handles
\'set\' magic.  See C<PUSHn>.

	void	XPUSHn(NV nv)','name' => 'XPUSHn'},'SvPV_force' => {'text' => 'Like <SvPV> but will force the SV into becoming a string (SvPOK).  You want
force if you are going to update the SvPVX directly.

	char*	SvPV_force(SV* sv, STRLEN len)','name' => 'SvPV_force'},'SvLEN' => {'text' => 'Returns the size of the string buffer in the SV.  See C<SvCUR>.

	STRLEN	SvLEN(SV* sv)','name' => 'SvLEN'},'call_sv' => {'text' => 'Performs a callback to the Perl sub whose name is in the SV.  See
L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_sv(SV* sv, I32 flags)','name' => 'call_sv'},'SVt_PV' => {'text' => 'Pointer type flag for scalars.  See C<svtype>.','name' => 'SVt_PV'},'strGT' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than the second,
C<s2>.  Returns true or false.

	bool	strGT(char* s1, char* s2)','name' => 'strGT'},'mg_get' => {'text' => 'Do magic after a value is retrieved from the SV.  See C<sv_magic>.

	int	mg_get(SV* sv)','name' => 'mg_get'},'SvTRUE' => {'text' => 'Returns a boolean indicating whether Perl would evaluate the SV as true or
false, defined or undefined.  Does not handle \'get\' magic.

	bool	SvTRUE(SV* sv)','name' => 'SvTRUE'},'HeSVKEY_set' => {'text' => 'Sets the key to a given C<SV*>, taking care to set the appropriate flags to
indicate the presence of an C<SV*> key, and returns the same
C<SV*>.

	SV*	HeSVKEY_set(HE* he, SV* sv)','name' => 'HeSVKEY_set'},'POPl' => {'text' => 'Pops a long off the stack.

	long	POPl','name' => 'POPl'},'SPAGAIN' => {'text' => 'Refetch the stack pointer.  Used after a callback.  See L<perlcall>.

		SPAGAIN;','name' => 'SPAGAIN'},'call_method' => {'text' => 'Performs a callback to the specified Perl method.  The blessed object must
be on the stack.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_method(const char* methname, I32 flags)','name' => 'call_method'},'sv_vsetpvfn' => {'text' => 'Works like C<vcatpvfn> but copies the text into the SV instead of
appending it.

	void	sv_vsetpvfn(SV* sv, const char* pat, STRLEN patlen, va_list* args, SV** svargs, I32 svmax, bool *maybe_tainted)','name' => 'sv_vsetpvfn'},'get_cv' => {'text' => 'Returns the CV of the specified Perl subroutine.  If C<create> is set and
the Perl subroutine does not exist then it will be declared (which has the
same effect as saying C<sub name;>).  If C<create> is not set and the
subroutine does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	CV*	get_cv(const char* name, I32 create)','name' => 'get_cv'},'SvIOKp' => {'text' => 'Returns a boolean indicating whether the SV contains an integer.  Checks
the B<private> setting.  Use C<SvIOK>.

	bool	SvIOKp(SV* sv)','name' => 'SvIOKp'},'XST_mUNDEF' => {'text' => 'Place C<&PL_sv_undef> into the specified position C<pos> on the
stack.

	void	XST_mUNDEF(int pos)','name' => 'XST_mUNDEF'},'perl_parse' => {'text' => 'Tells a Perl interpreter to parse a Perl script.  See L<perlembed>.

	int	perl_parse(PerlInterpreter* interp, XSINIT_t xsinit, int argc, char** argv, char** env)','name' => 'perl_parse'},'av_clear' => {'text' => 'Clears an array, making it empty.  Does not free the memory used by the
array itself.

	void	av_clear(AV* ar)','name' => 'av_clear'},'av_unshift' => {'text' => 'Unshift the given number of C<undef> values onto the beginning of the
array.  The array will grow automatically to accommodate the addition.  You
must then use C<av_store> to assign values to these new elements.

	void	av_unshift(AV* ar, I32 num)','name' => 'av_unshift'},'mg_set' => {'text' => 'Do magic after a value is assigned to the SV.  See C<sv_magic>.

	int	mg_set(SV* sv)','name' => 'mg_set'},'sv_mortalcopy' => {'text' => 'Creates a new SV which is a copy of the original SV.  The new SV is marked
as mortal.

	SV*	sv_mortalcopy(SV* oldsv)','name' => 'sv_mortalcopy'},'G_NOARGS' => {'text' => 'Indicates that no arguments are being sent to a callback.  See
L<perlcall>.','name' => 'G_NOARGS'},'PL_DBsingle' => {'text' => 'When Perl is run in debugging mode, with the B<-d> switch, this SV is a
boolean which indicates whether subs are being single-stepped. 
Single-stepping is automatically turned on after every step.  This is the C
variable which corresponds to Perl\'s $DB::single variable.  See
C<PL_DBsub>.

	SV *	PL_DBsingle','name' => 'PL_DBsingle'},'SvUVX' => {'text' => 'Returns the unsigned integer which is stored in the SV, assuming SvIOK is
true.

	UV	SvUVX(SV* sv)','name' => 'SvUVX'},'Newz' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.  The allocated
memory is zeroed with C<memzero>.

	void	Newz(int id, void* ptr, int nitems, type)','name' => 'Newz'},'savepvn' => {'text' => 'Copy a string to a safe spot.  The C<len> indicates number of bytes to
copy.  This does not use an SV.

	char*	savepvn(const char* sv, I32 len)','name' => 'savepvn'},'eval_sv' => {'text' => 'Tells Perl to C<eval> the string in the SV.

NOTE: the perl_ form of this function is deprecated.

	I32	eval_sv(SV* sv, I32 flags)','name' => 'eval_sv'},'FREETMPS' => {'text' => 'Closing bracket for temporaries on a callback.  See C<SAVETMPS> and
L<perlcall>.

		FREETMPS;','name' => 'FREETMPS'},'SvCUR' => {'text' => 'Returns the length of the string which is in the SV.  See C<SvLEN>.

	STRLEN	SvCUR(SV* sv)','name' => 'SvCUR'},'Move' => {'text' => 'The XSUB-writer\'s interface to the C C<memmove> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and C<type> is
the type.  Can do overlapping moves.  See also C<Copy>.

	void	Move(void* src, void* dest, int nitems, type)','name' => 'Move'},'GIMME' => {'text' => 'A backward-compatible version of C<GIMME_V> which can only return
C<G_SCALAR> or C<G_ARRAY>; in a void context, it returns C<G_SCALAR>.
Deprecated.  Use C<GIMME_V> instead.

	U32	GIMME','name' => 'GIMME'},'NEWSV' => {'text' => 'Creates a new SV.  A non-zero C<len> parameter indicates the number of
bytes of preallocated string space the SV should have.  An extra byte for a
tailing NUL is also reserved.  (SvPOK is not set for the SV even if string
space is allocated.)  The reference count for the new SV is set to 1. 
C<id> is an integer id between 0 and 1299 (used to identify leaks).

	SV*	NEWSV(int id, STRLEN len)','name' => 'NEWSV'},'sv_bless' => {'text' => 'Blesses an SV into a specified package.  The SV must be an RV.  The package
must be designated by its stash (see C<gv_stashpv()>).  The reference count
of the SV is unaffected.

	SV*	sv_bless(SV* sv, HV* stash)','name' => 'sv_bless'},'newXS' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.','name' => 'newXS'},'isALNUM' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ascii alphanumeric
character or digit.

	bool	isALNUM(char ch)','name' => 'isALNUM'},'sv_isa' => {'text' => 'Returns a boolean indicating whether the SV is blessed into the specified
class.  This does not check for subtypes; use C<sv_derived_from> to verify
an inheritance relationship.

	int	sv_isa(SV* sv, const char* name)','name' => 'sv_isa'},'sv_catpvf' => {'text' => 'Processes its arguments like C<sprintf> and appends the formatted output
to an SV.  Handles \'get\' magic, but not \'set\' magic.  C<SvSETMAGIC()> must
typically be called after calling this function to handle \'set\' magic.

	void	sv_catpvf(SV* sv, const char* pat, ...)','name' => 'sv_catpvf'},'XSRETURN_PV' => {'text' => 'Return a copy of a string from an XSUB immediately.  Uses C<XST_mPV>.

	void	XSRETURN_PV(char* str)','name' => 'XSRETURN_PV'},'perl_alloc' => {'text' => 'Allocates a new Perl interpreter.  See L<perlembed>.

	PerlInterpreter*	perl_alloc()','name' => 'perl_alloc'},'isALPHA' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ascii alphabetic
character.

	bool	isALPHA(char ch)','name' => 'isALPHA'},'Nullhv' => {'text' => 'Null HV pointer.','name' => 'Nullhv'},'SvREFCNT_inc' => {'text' => 'Increments the reference count of the given SV.

	SV*	SvREFCNT_inc(SV* sv)','name' => 'SvREFCNT_inc'},'perl_construct' => {'text' => 'Initializes a new Perl interpreter.  See L<perlembed>.

	void	perl_construct(PerlInterpreter* interp)','name' => 'perl_construct'},'SvTYPE' => {'text' => 'Returns the type of the SV.  See C<svtype>.

	svtype	SvTYPE(SV* sv)','name' => 'SvTYPE'},'SvIOK_only' => {'text' => 'Tells an SV that it is an integer and disables all other OK bits.

	void	SvIOK_only(SV* sv)','name' => 'SvIOK_only'},'sv_dec' => {'text' => 'Auto-decrement of the value in the SV.

	void	sv_dec(SV* sv)','name' => 'sv_dec'},'strLE' => {'text' => 'Test two strings to see if the first, C<s1>, is less than or equal to the
second, C<s2>.  Returns true or false.

	bool	strLE(char* s1, char* s2)','name' => 'strLE'},'SvROK_off' => {'text' => 'Unsets the RV status of an SV.

	void	SvROK_off(SV* sv)','name' => 'SvROK_off'},'Renew' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function.

	void	Renew(void* ptr, int nitems, type)','name' => 'Renew'},'perl_free' => {'text' => 'Releases a Perl interpreter.  See L<perlembed>.

	void	perl_free(PerlInterpreter* interp)','name' => 'perl_free'},'SvOK' => {'text' => 'Returns a boolean indicating whether the value is an SV.

	bool	SvOK(SV* sv)','name' => 'SvOK'},'sv_setref_nv' => {'text' => 'Copies a double into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<Nullch> to avoid the blessing.  The new SV
will be returned and will have a reference count of 1.

	SV*	sv_setref_nv(SV* rv, const char* classname, NV nv)','name' => 'sv_setref_nv'},'mg_find' => {'text' => 'Finds the magic pointer for type matching the SV.  See C<sv_magic>.

	MAGIC*	mg_find(SV* sv, int type)','name' => 'mg_find'},'isDIGIT' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ascii
digit.

	bool	isDIGIT(char ch)','name' => 'isDIGIT'},'SvNOK_on' => {'text' => 'Tells an SV that it is a double.

	void	SvNOK_on(SV* sv)','name' => 'SvNOK_on'},'eval_pv' => {'text' => 'Tells Perl to C<eval> the given string and return an SV* result.

NOTE: the perl_ form of this function is deprecated.

	SV*	eval_pv(const char* p, I32 croak_on_error)','name' => 'eval_pv'},'sv_setpvf_mg' => {'text' => 'Like C<sv_setpvf>, but also handles \'set\' magic.

	void	sv_setpvf_mg(SV *sv, const char* pat, ...)','name' => 'sv_setpvf_mg'},'SvPOKp' => {'text' => 'Returns a boolean indicating whether the SV contains a character string.
Checks the B<private> setting.  Use C<SvPOK>.

	bool	SvPOKp(SV* sv)','name' => 'SvPOKp'},'sv_catpvn' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.  The
C<len> indicates number of bytes to copy.  Handles \'get\' magic, but not
\'set\' magic.  See C<sv_catpvn_mg>.

	void	sv_catpvn(SV* sv, const char* ptr, STRLEN len)','name' => 'sv_catpvn'},'newCONSTSUB' => {'text' => 'Creates a constant sub equivalent to Perl C<sub FOO () { 123 }> which is
eligible for inlining at compile-time.

	void	newCONSTSUB(HV* stash, char* name, SV* sv)','name' => 'newCONSTSUB'},'sv_setref_pv' => {'text' => 'Copies a pointer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  If the C<pv> argument is NULL then C<PL_sv_undef> will be placed
into the SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<Nullch> to avoid the blessing.  The new SV
will be returned and will have a reference count of 1.

Do not use with other Perl types such as HV, AV, SV, CV, because those
objects will become corrupted by the pointer copy process.

Note that C<sv_setref_pvn> copies the string while this copies the pointer.

	SV*	sv_setref_pv(SV* rv, const char* classname, void* pv)','name' => 'sv_setref_pv'},'av_pop' => {'text' => 'Pops an SV off the end of the array.  Returns C<&PL_sv_undef> if the array
is empty.

	SV*	av_pop(AV* ar)','name' => 'av_pop'},'fbm_compile' => {'text' => 'Analyses the string in order to make fast searches on it using fbm_instr()
-- the Boyer-Moore algorithm.

	void	fbm_compile(SV* sv, U32 flags)','name' => 'fbm_compile'},'SvNIOKp' => {'text' => 'Returns a boolean indicating whether the SV contains a number, integer or
double.  Checks the B<private> setting.  Use C<SvNIOK>.

	bool	SvNIOKp(SV* sv)','name' => 'SvNIOKp'},'croak' => {'text' => 'This is the XSUB-writer\'s interface to Perl\'s C<die> function.  Use this
function the same way you use the C C<printf> function.  See
C<warn>.

	void	croak(const char* pat, ...)','name' => 'croak'},'THIS' => {'text' => 'Variable which is setup by C<xsubpp> to designate the object in a C++ 
XSUB.  This is always the proper type for the C++ object.  See C<CLASS> and 
L<perlxs/"Using XS With C++">.

	(whatever)	THIS','name' => 'THIS'},'XSRETURN' => {'text' => 'Return from XSUB, indicating number of items on the stack.  This is usually
handled by C<xsubpp>.

	void	XSRETURN(int nitems)','name' => 'XSRETURN'},'sv_setref_pvn' => {'text' => 'Copies a string into a new SV, optionally blessing the SV.  The length of the
string must be specified with C<n>.  The C<rv> argument will be upgraded to
an RV.  That RV will be modified to point to the new SV.  The C<classname>
argument indicates the package for the blessing.  Set C<classname> to
C<Nullch> to avoid the blessing.  The new SV will be returned and will have
a reference count of 1.

Note that C<sv_setref_pv> copies the pointer while this copies the string.

	SV*	sv_setref_pvn(SV* rv, const char* classname, char* pv, STRLEN n)','name' => 'sv_setref_pvn'},'SVt_PVMG' => {'text' => 'Type flag for blessed scalars.  See C<svtype>.','name' => 'SVt_PVMG'},'PUSHp' => {'text' => 'Push a string onto the stack.  The stack must have room for this element.
The C<len> indicates the length of the string.  Handles \'set\' magic.  See
C<XPUSHp>.

	void	PUSHp(char* str, STRLEN len)','name' => 'PUSHp'},'Nullcv' => {'text' => 'Null CV pointer.','name' => 'Nullcv'},'get_av' => {'text' => 'Returns the AV of the specified Perl array.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	AV*	get_av(const char* name, I32 create)','name' => 'get_av'},'PL_sv_undef' => {'text' => 'This is the C<undef> SV.  Always refer to this as C<&PL_sv_undef>.

	SV	PL_sv_undef','name' => 'PL_sv_undef'},'hv_iterkeysv' => {'text' => 'Returns the key as an C<SV*> from the current position of the hash
iterator.  The return value will always be a mortal copy of the key.  Also
see C<hv_iterinit>.

	SV*	hv_iterkeysv(HE* entry)','name' => 'hv_iterkeysv'},'XST_mNO' => {'text' => 'Place C<&PL_sv_no> into the specified position C<pos> on the
stack.

	void	XST_mNO(int pos)','name' => 'XST_mNO'},'toUPPER' => {'text' => 'Converts the specified character to uppercase.

	char	toUPPER(char ch)','name' => 'toUPPER'},'SAVETMPS' => {'text' => 'Opening bracket for temporaries on a callback.  See C<FREETMPS> and
L<perlcall>.

		SAVETMPS;','name' => 'SAVETMPS'},'AvFILL' => {'text' => 'Same as C<av_len()>.  Deprecated, use C<av_len()> instead.

	int	AvFILL(AV* av)','name' => 'AvFILL'},'ORIGMARK' => {'text' => 'The original stack mark for the XSUB.  See C<dORIGMARK>.','name' => 'ORIGMARK'},'SP' => {'text' => 'Stack pointer.  This is usually handled by C<xsubpp>.  See C<dSP> and
C<SPAGAIN>.','name' => 'SP'},'SvPOK_only' => {'text' => 'Tells an SV that it is a string and disables all other OK bits.

	void	SvPOK_only(SV* sv)','name' => 'SvPOK_only'},'SvSetSV_nosteal' => {'text' => 'Calls a non-destructive version of C<sv_setsv> if dsv is not the same as
ssv. May evaluate arguments more than once.

	void	SvSetSV_nosteal(SV* dsv, SV* ssv)','name' => 'SvSetSV_nosteal'},'PL_dowarn' => {'text' => 'The C variable which corresponds to Perl\'s $^W warning variable.

	bool	PL_dowarn','name' => 'PL_dowarn'},'sv_catpvn_mg' => {'text' => 'Like C<sv_catpvn>, but also handles \'set\' magic.

	void	sv_catpvn_mg(SV *sv, const char *ptr, STRLEN len)','name' => 'sv_catpvn_mg'},'sv_usepvn_mg' => {'text' => 'Like C<sv_usepvn>, but also handles \'set\' magic.

	void	sv_usepvn_mg(SV *sv, char *ptr, STRLEN len)','name' => 'sv_usepvn_mg'},'Zero' => {'text' => 'The XSUB-writer\'s interface to the C C<memzero> function.  The C<dest> is the
destination, C<nitems> is the number of items, and C<type> is the type.

	void	Zero(void* dest, int nitems, type)','name' => 'Zero'},'hv_fetch' => {'text' => 'Returns the SV which corresponds to the specified key in the hash.  The
C<klen> is the length of the key.  If C<lval> is set then the fetch will be
part of a store.  Check that the return value is non-null before
dereferencing it to a C<SV*>. 

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	SV**	hv_fetch(HV* tb, const char* key, U32 klen, I32 lval)','name' => 'hv_fetch'},'SvSTASH' => {'text' => 'Returns the stash of the SV.

	HV*	SvSTASH(SV* sv)','name' => 'SvSTASH'},'PL_modglobal' => {'text' => 'C<PL_modglobal> is a general purpose, interpreter global HV for use by 
extensions that need to keep information on a per-interpreter basis.
In a pinch, it can also be used as a symbol table for extensions 
to share data among each other.  It is a good idea to use keys 
prefixed by the package name of the extension that owns the data.

	HV*	PL_modglobal','name' => 'PL_modglobal'},'XSRETURN_UNDEF' => {'text' => 'Return C<&PL_sv_undef> from an XSUB immediately.  Uses C<XST_mUNDEF>.

		XSRETURN_UNDEF;','name' => 'XSRETURN_UNDEF'},'SvRV' => {'text' => 'Dereferences an RV to return the SV.

	SV*	SvRV(SV* sv)','name' => 'SvRV'},'Nullch' => {'text' => 'Null character pointer.','name' => 'Nullch'},'mg_copy' => {'text' => 'Copies the magic from one SV to another.  See C<sv_magic>.

	int	mg_copy(SV* sv, SV* nsv, const char* key, I32 klen)','name' => 'mg_copy'},'HeSVKEY_force' => {'text' => 'Returns the key as an C<SV*>.  Will create and return a temporary mortal
C<SV*> if the hash entry contains only a C<char*> key.

	SV*	HeSVKEY_force(HE* he)','name' => 'HeSVKEY_force'},'MARK' => {'text' => 'Stack marker variable for the XSUB.  See C<dMARK>.','name' => 'MARK'},'newSVpvn' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  Note that if C<len> is zero, Perl will create a zero length 
string.  You are responsible for ensuring that the source string is at least
C<len> bytes long.

	SV*	newSVpvn(const char* s, STRLEN len)','name' => 'newSVpvn'},'newRV_inc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original SV is
incremented.

	SV*	newRV_inc(SV* sv)','name' => 'newRV_inc'},'SVt_PVCV' => {'text' => 'Type flag for code refs.  See C<svtype>.','name' => 'SVt_PVCV'},'av_push' => {'text' => 'Pushes an SV onto the end of the array.  The array will grow automatically
to accommodate the addition.

	void	av_push(AV* ar, SV* val)','name' => 'av_push'},'XSRETURN_NO' => {'text' => 'Return C<&PL_sv_no> from an XSUB immediately.  Uses C<XST_mNO>.

		XSRETURN_NO;','name' => 'XSRETURN_NO'},'POPn' => {'text' => 'Pops a double off the stack.

	NV	POPn','name' => 'POPn'},'newRV_noinc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original
SV is B<not> incremented.

	SV*	newRV_noinc(SV *sv)','name' => 'newRV_noinc'},'av_extend' => {'text' => 'Pre-extend an array.  The C<key> is the index to which the array should be
extended.

	void	av_extend(AV* ar, I32 key)','name' => 'av_extend'},'sv_setpviv_mg' => {'text' => 'Like C<sv_setpviv>, but also handles \'set\' magic.

	void	sv_setpviv_mg(SV *sv, IV iv)','name' => 'sv_setpviv_mg'},'SvROK_on' => {'text' => 'Tells an SV that it is an RV.

	void	SvROK_on(SV* sv)','name' => 'SvROK_on'},'hv_iternext' => {'text' => 'Returns entries from a hash iterator.  See C<hv_iterinit>.

	HE*	hv_iternext(HV* tb)','name' => 'hv_iternext'},'dORIGMARK' => {'text' => 'Saves the original stack mark for the XSUB.  See C<ORIGMARK>.

		dORIGMARK;','name' => 'dORIGMARK'},'G_VOID' => {'text' => 'Used to indicate void context.  See C<GIMME_V> and L<perlcall>.','name' => 'G_VOID'},'sv_newmortal' => {'text' => 'Creates a new SV which is mortal.  The reference count of the SV is set to 1.

	SV*	sv_newmortal()','name' => 'sv_newmortal'},'hv_iterinit' => {'text' => 'Prepares a starting point to traverse a hash table.  Returns the number of
keys in the hash (i.e. the same as C<HvKEYS(tb)>).  The return value is
currently only meaningful for hashes without tie magic. 

NOTE: Before version 5.004_65, C<hv_iterinit> used to return the number of
hash buckets that happen to be in use.  If you still need that esoteric
value, you can get it through the macro C<HvFILL(tb)>.

	I32	hv_iterinit(HV* tb)','name' => 'hv_iterinit'}};};

  my $self = bless({
    'index' => $VAR1,
    perl_version => '5.006',
  } => $class);
  return $self;
}

1;
