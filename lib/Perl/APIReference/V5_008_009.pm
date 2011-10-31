package Perl::APIReference::V5_008_009;
use strict;
use warnings;
use parent 'Perl::APIReference';

sub new {
  my $class = shift;
  my $VAR1;

do{$VAR1 = {'hv_store_ent' => {'text' => 'Stores C<val> in a hash.  The hash key is specified as C<key>.  The C<hash>
parameter is the precomputed hash value; if it is zero then Perl will
compute it.  The return value is the new hash entry so created.  It will be
NULL if the operation failed or if the value did not need to be actually
stored within the hash (as in the case of tied hashes).  Otherwise the
contents of the return value can be accessed using the C<He?> macros
described here.  Note that the caller is responsible for suitably
incrementing the reference count of C<val> before the call, and
decrementing it if the function returned NULL.  Effectively a successful
hv_store_ent takes ownership of one reference to C<val>.  This is
usually what you want; a newly created SV has a reference count of one, so
if all your code does is create SVs then store them in a hash, hv_store
will own the only reference to the new SV, and your code doesn\'t need to do
anything further to tidy up.  Note that hv_store_ent only reads the C<key>;
unlike C<val> it does not take ownership of it, so maintaining the correct
reference count on C<key> is entirely the caller\'s responsibility.  hv_store
is not implemented as a call to hv_store_ent, and does not create a temporary
SV for the key, so if your key data is not already in SV form then use
hv_store in preference to hv_store_ent.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	HE*	hv_store_ent(HV* tb, SV* key, SV* val, U32 hash)','name' => 'hv_store_ent'},'gv_stashsv' => {'text' => 'Returns a pointer to the stash for a specified package.  See C<gv_stashpvn>.

	HV*	gv_stashsv(SV* sv, I32 flags)','name' => 'gv_stashsv'},'newXSproto' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.  Adds Perl prototypes to
the subs.','name' => 'newXSproto'},'strGE' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than or equal to
the second, C<s2>.  Returns true or false.

	bool	strGE(char* s1, char* s2)','name' => 'strGE'},'form' => {'text' => 'Takes a sprintf-style format pattern and conventional
(non-SV) arguments and returns the formatted string.

    (char *) Perl_form(pTHX_ const char* pat, ...)

can be used any place a string (char *) is required:

    char * s = Perl_form("%d.%d",major,minor);

Uses a single private buffer so if you want to format several strings you
must explicitly copy the earlier strings away (and free the copies when you
are done).

	char*	form(const char* pat, ...)','name' => 'form'},'SvPV' => {'text' => 'Returns a pointer to the string in the SV, or a stringified form of
the SV if the SV does not contain a string.  The SV may cache the
stringified version becoming C<SvPOK>.  Handles \'get\' magic. See also
C<SvPVx> for a version which guarantees to evaluate sv only once.

	char*	SvPV(SV* sv, STRLEN len)','name' => 'SvPV'},'is_utf8_string' => {'text' => 'Returns true if first C<len> bytes of the given string form a valid
UTF-8 string, false otherwise.  Note that \'a valid UTF-8 string\' does
not mean \'a string that contains code points above 0x7F encoded in UTF-8\'
because a valid ASCII string is a valid UTF-8 string.

See also is_utf8_string_loclen() and is_utf8_string_loc().

	bool	is_utf8_string(U8 *s, STRLEN len)','name' => 'is_utf8_string'},'sv_insert' => {'text' => 'Inserts a string at the specified offset/length within the SV. Similar to
the Perl substr() function.

	void	sv_insert(SV* bigsv, STRLEN offset, STRLEN len, char* little, STRLEN littlelen)','name' => 'sv_insert'},'SvPOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a character
string.

	U32	SvPOK(SV* sv)','name' => 'SvPOK'},'sv_vsetpvf_mg' => {'text' => 'Like C<sv_vsetpvf>, but also handles \'set\' magic.

Usually used via its frontend C<sv_setpvf_mg>.

	void	sv_vsetpvf_mg(SV* sv, const char* pat, va_list* args)','name' => 'sv_vsetpvf_mg'},'sv_destroyable' => {'text' => 'Dummy routine which reports that object can be destroyed when there is no
sharing module present.  It ignores its single SV argument, and returns
\'true\'.  Exists to avoid test for a NULL function pointer and because it
could potentially warn under some level of strict-ness.

	bool	sv_destroyable(SV *sv)','name' => 'sv_destroyable'},'SvPVutf8' => {'text' => 'Like C<SvPV>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8(SV* sv, STRLEN len)','name' => 'SvPVutf8'},'XS' => {'text' => 'Macro to declare an XSUB and its C parameter list.  This is handled by
C<xsubpp>.','name' => 'XS'},'scan_oct' => {'text' => 'For backwards compatibility. Use C<grok_oct> instead.

	NV	scan_oct(char* start, STRLEN len, STRLEN* retlen)','name' => 'scan_oct'},'sv_setpvn' => {'text' => 'Copies a string into an SV.  The C<len> parameter indicates the number of
bytes to be copied.  If the C<ptr> argument is NULL the SV will become
undefined.  Does not handle \'set\' magic.  See C<sv_setpvn_mg>.

	void	sv_setpvn(SV* sv, const char* ptr, STRLEN len)','name' => 'sv_setpvn'},'mg_magical' => {'text' => 'Turns on the magical status of an SV.  See C<sv_magic>.

	void	mg_magical(SV* sv)','name' => 'mg_magical'},'newSVrv' => {'text' => 'Creates a new SV for the RV, C<rv>, to point to.  If C<rv> is not an RV then
it will be upgraded to one.  If C<classname> is non-null then the new SV will
be blessed in the specified package.  The new SV is returned and its
reference count is 1.

	SV*	newSVrv(SV* rv, const char* classname)','name' => 'newSVrv'},'strnEQ' => {'text' => 'Test two strings to see if they are equal.  The C<len> parameter indicates
the number of bytes to compare.  Returns true or false. (A wrapper for
C<strncmp>).

	bool	strnEQ(char* s1, char* s2, STRLEN len)','name' => 'strnEQ'},'find_runcv' => {'text' => 'Locate the CV corresponding to the currently executing sub or eval.
If db_seqp is non_null, skip CVs that are in the DB package and populate
*db_seqp with the cop sequence number at the point that the DB:: code was
entered. (allows debuggers to eval in the scope of the breakpoint rather
than in the scope of the debugger itself).

	CV*	find_runcv(U32 *db_seqp)','name' => 'find_runcv'},'PoisonWith' => {'text' => 'Fill up memory with a byte pattern (a byte repeated over and over
again) that hopefully catches attempts to access uninitialized memory.

	void	PoisonWith(void* dest, int nitems, type, U8 byte)','name' => 'PoisonWith'},'utf8n_to_uvuni' => {'text' => 'Bottom level UTF-8 decode routine.
Returns the Unicode code point value of the first character in the string C<s>
which is assumed to be in UTF-8 encoding and no longer than C<curlen>;
C<retlen> will be set to the length, in bytes, of that character.

If C<s> does not point to a well-formed UTF-8 character, the behaviour
is dependent on the value of C<flags>: if it contains UTF8_CHECK_ONLY,
it is assumed that the caller will raise a warning, and this function
will silently just set C<retlen> to C<-1> and return zero.  If the
C<flags> does not contain UTF8_CHECK_ONLY, warnings about
malformations will be given, C<retlen> will be set to the expected
length of the UTF-8 character in bytes, and zero will be returned.

The C<flags> can also contain various flags to allow deviations from
the strict UTF-8 encoding (see F<utf8.h>).

Most code should use utf8_to_uvchr() rather than call this directly.

	UV	utf8n_to_uvuni(U8 *s, STRLEN curlen, STRLEN *retlen, U32 flags)','name' => 'utf8n_to_uvuni'},'av_create_and_unshift_one' => {'text' => 'Unshifts an SV onto the beginning of the array, creating the array if
necessary.
A small internal helper function to remove a commonly duplicated idiom.

NOTE: this function is experimental and may change or be
removed without notice.

	SV**	av_create_and_unshift_one(AV **const avp, SV *const val)','name' => 'av_create_and_unshift_one'},'SvNIOK_off' => {'text' => 'Unsets the NV/IV status of an SV.

	void	SvNIOK_off(SV* sv)','name' => 'SvNIOK_off'},'newSVpvn_utf8' => {'text' => 'Creates a new SV and copies a string into it.  If utf8 is true, calls
C<SvUTF8_on> on the new SV.  Implemented as a wrapper around C<newSVpvn_flags>.

	SV*	newSVpvn_utf8(NULLOK const char* s, STRLEN len, U32 utf8)','name' => 'newSVpvn_utf8'},'sv_magic' => {'text' => 'Adds magic to an SV. First upgrades C<sv> to type C<SVt_PVMG> if necessary,
then adds a new magic item of type C<how> to the head of the magic list.

See C<sv_magicext> (which C<sv_magic> now calls) for a description of the
handling of the C<name> and C<namlen> arguments.

You need to use C<sv_magicext> to add magic to SvREADONLY SVs and also
to add more than one instance of the same \'how\'.

	void	sv_magic(SV* sv, SV* obj, int how, const char* name, I32 namlen)','name' => 'sv_magic'},'dMARK' => {'text' => 'Declare a stack marker variable, C<mark>, for the XSUB.  See C<MARK> and
C<dORIGMARK>.

		dMARK;','name' => 'dMARK'},'sv_utf8_upgrade_flags' => {'text' => 'Converts the PV of an SV to its UTF-8-encoded form.
Forces the SV to string form if it is not already.
Always sets the SvUTF8 flag to avoid future validity checks even
if all the bytes have hibit clear. If C<flags> has C<SV_GMAGIC> bit set,
will C<mg_get> on C<sv> if appropriate, else not. C<sv_utf8_upgrade> and
C<sv_utf8_upgrade_nomg> are implemented in terms of this function.

This is not as a general purpose byte encoding to Unicode interface:
use the Encode extension for that.

	STRLEN	sv_utf8_upgrade_flags(SV *sv, I32 flags)','name' => 'sv_utf8_upgrade_flags'},'ibcmp_utf8' => {'text' => 'Return true if the strings s1 and s2 differ case-insensitively, false
if not (if they are equal case-insensitively).  If u1 is true, the
string s1 is assumed to be in UTF-8-encoded Unicode.  If u2 is true,
the string s2 is assumed to be in UTF-8-encoded Unicode.  If u1 or u2
are false, the respective string is assumed to be in native 8-bit
encoding.

If the pe1 and pe2 are non-NULL, the scanning pointers will be copied
in there (they will point at the beginning of the I<next> character).
If the pointers behind pe1 or pe2 are non-NULL, they are the end
pointers beyond which scanning will not continue under any
circumstances.  If the byte lengths l1 and l2 are non-zero, s1+l1 and
s2+l2 will be used as goal end pointers that will also stop the scan,
and which qualify towards defining a successful match: all the scans
that define an explicit length must reach their goal pointers for
a match to succeed).

For case-insensitiveness, the "casefolding" of Unicode is used
instead of upper/lowercasing both the characters, see
http://www.unicode.org/unicode/reports/tr21/ (Case Mappings).

	I32	ibcmp_utf8(const char* a, char **pe1, UV l1, bool u1, const char* b, char **pe2, UV l2, bool u2)','name' => 'ibcmp_utf8'},'SvREFCNT_inc_void' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the
return value.  The macro doesn\'t need to return a meaningful value.

	void	SvREFCNT_inc_void(SV* sv)','name' => 'SvREFCNT_inc_void'},'mXPUSHp' => {'text' => 'Push a string onto the stack, extending the stack if necessary.  The C<len>
indicates the length of the string.  Does not use C<TARG>.  See also C<XPUSHp>,
C<mPUSHp> and C<PUSHp>.

	void	mXPUSHp(char* str, STRLEN len)','name' => 'mXPUSHp'},'CvSTASH' => {'text' => 'Returns the stash of the CV.

	HV*	CvSTASH(CV* cv)','name' => 'CvSTASH'},'gv_const_sv' => {'text' => 'If C<gv> is a typeglob whose subroutine entry is a constant sub eligible for
inlining, or C<gv> is a placeholder reference that would be promoted to such
a typeglob, then returns the value returned by the sub.  Otherwise, returns
NULL.

	SV*	gv_const_sv(GV* gv)','name' => 'gv_const_sv'},'sv_replace' => {'text' => 'Make the first argument a copy of the second, then delete the original.
The target SV physically takes over ownership of the body of the source SV
and inherits its flags; however, the target keeps any magic it owns,
and any magic in the source is discarded.
Note that this is a rather specialist SV copying operation; most of the
time you\'ll want to use C<sv_setsv> or one of its many macro front-ends.

	void	sv_replace(SV* sv, SV* nsv)','name' => 'sv_replace'},'utf8n_to_uvchr' => {'text' => 'flags

Returns the native character value of the first character in the string 
C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

Allows length and flags to be passed to low level routine.

	UV	utf8n_to_uvchr(U8 *s, STRLEN curlen, STRLEN *retlen, U32 flags)','name' => 'utf8n_to_uvchr'},'G_ARRAY' => {'text' => 'Used to indicate list context.  See C<GIMME_V>, C<GIMME> and
L<perlcall>.','name' => 'G_ARRAY'},'XS_VERSION_BOOTCHECK' => {'text' => 'Macro to verify that a PM module\'s $VERSION variable matches the XS
module\'s C<XS_VERSION> variable.  This is usually handled automatically by
C<xsubpp>.  See L<perlxs/"The VERSIONCHECK: Keyword">.

		XS_VERSION_BOOTCHECK;','name' => 'XS_VERSION_BOOTCHECK'},'SvROK' => {'text' => 'Tests if the SV is an RV.

	U32	SvROK(SV* sv)','name' => 'SvROK'},'mXPUSHn' => {'text' => 'Push a double onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHn>, C<mPUSHn> and C<PUSHn>.

	void	mXPUSHn(NV nv)','name' => 'mXPUSHn'},'sv_unref' => {'text' => 'Unsets the RV status of the SV, and decrements the reference count of
whatever was being referenced by the RV.  This can almost be thought of
as a reversal of C<newSVrv>.  This is C<sv_unref_flags> with the C<flag>
being zero.  See C<SvROK_off>.

	void	sv_unref(SV* sv)','name' => 'sv_unref'},'SvSETMAGIC' => {'text' => 'Invokes C<mg_set> on an SV if it has \'set\' magic.  This macro evaluates its
argument more than once.

	void	SvSETMAGIC(SV* sv)','name' => 'SvSETMAGIC'},'G_EVAL' => {'text' => 'Used to force a Perl C<eval> wrapper around a callback.  See
L<perlcall>.','name' => 'G_EVAL'},'sv_catsv_mg' => {'text' => 'Like C<sv_catsv>, but also handles \'set\' magic.

	void	sv_catsv_mg(SV *dstr, SV *sstr)','name' => 'sv_catsv_mg'},'call_argv' => {'text' => 'Performs a callback to the specified Perl sub.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_argv(const char* sub_name, I32 flags, char** argv)','name' => 'call_argv'},'SvPV_nolen' => {'text' => 'Returns a pointer to the string in the SV, or a stringified form of
the SV if the SV does not contain a string.  The SV may cache the
stringified form becoming C<SvPOK>.  Handles \'get\' magic.

	char*	SvPV_nolen(SV* sv)','name' => 'SvPV_nolen'},'perl_clone' => {'text' => 'Create and return a new interpreter by cloning the current one.

perl_clone takes these flags as parameters:

CLONEf_COPY_STACKS - is used to, well, copy the stacks also, 
without it we only clone the data and zero the stacks, 
with it we copy the stacks and the new perl interpreter is 
ready to run at the exact same point as the previous one. 
The pseudo-fork code uses COPY_STACKS while the 
threads->create doesn\'t.

CLONEf_KEEP_PTR_TABLE
perl_clone keeps a ptr_table with the pointer of the old 
variable as a key and the new variable as a value, 
this allows it to check if something has been cloned and not 
clone it again but rather just use the value and increase the 
refcount. If KEEP_PTR_TABLE is not set then perl_clone will kill 
the ptr_table using the function 
C<ptr_table_free(PL_ptr_table); PL_ptr_table = NULL;>, 
reason to keep it around is if you want to dup some of your own 
variable who are outside the graph perl scans, example of this 
code is in threads.xs create

CLONEf_CLONE_HOST
This is a win32 thing, it is ignored on unix, it tells perls 
win32host code (which is c++) to clone itself, this is needed on 
win32 if you want to run two threads at the same time, 
if you just want to do some stuff in a separate perl interpreter 
and then throw it away and return to the original one, 
you don\'t need to do anything.

	PerlInterpreter*	perl_clone(PerlInterpreter* interp, UV flags)','name' => 'perl_clone'},'sv_setnv' => {'text' => 'Copies a double into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setnv_mg>.

	void	sv_setnv(SV* sv, NV num)','name' => 'sv_setnv'},'sv_2nv' => {'text' => 'Return the num value of an SV, doing any necessary string or integer
conversion, magic etc. Normally used via the C<SvNV(sv)> and C<SvNVx(sv)>
macros.

	NV	sv_2nv(SV* sv)','name' => 'sv_2nv'},'SvREFCNT_inc_simple_NN' => {'text' => 'Same as SvREFCNT_inc_simple, but can only be used if you know I<sv>
is not NULL.  Since we don\'t have to check the NULLness, it\'s faster
and smaller.

	SV*	SvREFCNT_inc_simple_NN(SV* sv)','name' => 'SvREFCNT_inc_simple_NN'},'SvSetSV' => {'text' => 'Calls C<sv_setsv> if dsv is not the same as ssv.  May evaluate arguments
more than once.

	void	SvSetSV(SV* dsb, SV* ssv)','name' => 'SvSetSV'},'hv_fetchs' => {'text' => 'Like C<hv_fetch>, but takes a literal string instead of a string/length pair.

	SV**	hv_fetchs(HV* tb, const char* key, I32 lval)','name' => 'hv_fetchs'},'newHV' => {'text' => 'Creates a new HV.  The reference count is set to 1.

	HV*	newHV()','name' => 'newHV'},'strnNE' => {'text' => 'Test two strings to see if they are different.  The C<len> parameter
indicates the number of bytes to compare.  Returns true or false. (A
wrapper for C<strncmp>).

	bool	strnNE(char* s1, char* s2, STRLEN len)','name' => 'strnNE'},'strNE' => {'text' => 'Test two strings to see if they are different.  Returns true or
false.

	bool	strNE(char* s1, char* s2)','name' => 'strNE'},'sv_pvutf8n_force' => {'text' => 'The backend for the C<SvPVutf8x_force> macro. Always use the macro instead.

	char*	sv_pvutf8n_force(SV* sv, STRLEN* lp)','name' => 'sv_pvutf8n_force'},'savepv' => {'text' => 'Perl\'s version of C<strdup()>. Returns a pointer to a newly allocated
string which is a duplicate of C<pv>. The size of the string is
determined by C<strlen()>. The memory allocated for the new string can
be freed with the C<Safefree()> function.

	char*	savepv(const char* pv)','name' => 'savepv'},'SvNV_set' => {'text' => 'Set the value of the NV pointer in sv to val.  See C<SvIV_set>.

	void	SvNV_set(SV* sv, NV val)','name' => 'SvNV_set'},'bytes_from_utf8' => {'text' => 'Converts a string C<s> of length C<len> from UTF-8 into byte encoding.
Unlike C<utf8_to_bytes> but like C<bytes_to_utf8>, returns a pointer to
the newly-created string, and updates C<len> to contain the new
length.  Returns the original string if no conversion occurs, C<len>
is unchanged. Do nothing if C<is_utf8> points to 0. Sets C<is_utf8> to
0 if C<s> is converted or contains all 7bit characters.

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	bytes_from_utf8(U8 *s, STRLEN *len, bool *is_utf8)','name' => 'bytes_from_utf8'},'newAV' => {'text' => 'Creates a new AV.  The reference count is set to 1.

	AV*	newAV()','name' => 'newAV'},'HvNAME' => {'text' => 'Returns the package name of a stash, or NULL if C<stash> isn\'t a stash.
See C<SvSTASH>, C<CvSTASH>.

	char*	HvNAME(HV* stash)','name' => 'HvNAME'},'sv_recode_to_utf8' => {'text' => 'The encoding is assumed to be an Encode object, on entry the PV
of the sv is assumed to be octets in that encoding, and the sv
will be converted into Unicode (and UTF-8).

If the sv already is UTF-8 (or if it is not POK), or if the encoding
is not a reference, nothing is done to the sv.  If the encoding is not
an C<Encode::XS> Encoding object, bad things will happen.
(See F<lib/encoding.pm> and L<Encode>).

The PV of the sv is returned.

	char*	sv_recode_to_utf8(SV* sv, SV *encoding)','name' => 'sv_recode_to_utf8'},'av_make' => {'text' => 'Creates a new AV and populates it with a list of SVs.  The SVs are copied
into the array, so they may be freed after the call to av_make.  The new AV
will have a reference count of 1.

	AV*	av_make(I32 size, SV** svp)','name' => 'av_make'},'SvUV' => {'text' => 'Coerces the given SV to an unsigned integer and returns it.  See C<SvUVx>
for a version which guarantees to evaluate sv only once.

	UV	SvUV(SV* sv)','name' => 'SvUV'},'perl_run' => {'text' => 'Tells a Perl interpreter to run.  See L<perlembed>.

	int	perl_run(PerlInterpreter* interp)','name' => 'perl_run'},'sv_catsv_flags' => {'text' => 'Concatenates the string from SV C<ssv> onto the end of the string in
SV C<dsv>.  Modifies C<dsv> but not C<ssv>.  If C<flags> has C<SV_GMAGIC>
bit set, will C<mg_get> on the SVs if appropriate, else not. C<sv_catsv>
and C<sv_catsv_nomg> are implemented in terms of this function.

	void	sv_catsv_flags(SV* dsv, SV* ssv, I32 flags)','name' => 'sv_catsv_flags'},'SvPVutf8_nolen' => {'text' => 'Like C<SvPV_nolen>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8_nolen(SV* sv)','name' => 'SvPVutf8_nolen'},'sv_setpviv' => {'text' => 'Copies an integer into the given SV, also updating its string value.
Does not handle \'set\' magic.  See C<sv_setpviv_mg>.

	void	sv_setpviv(SV* sv, IV num)','name' => 'sv_setpviv'},'sv_true' => {'text' => 'Returns true if the SV has a true value by Perl\'s rules.
Use the C<SvTRUE> macro instead, which may call C<sv_true()> or may
instead use an in-line version.

	I32	sv_true(SV *sv)','name' => 'sv_true'},'sv_derived_from' => {'text' => 'Returns a boolean indicating whether the SV is derived from the specified class
I<at the C level>.  To check derivation at the Perl level, call C<isa()> as a
normal Perl method.

	bool	sv_derived_from(SV* sv, const char* name)','name' => 'sv_derived_from'},'SvIOK_on' => {'text' => 'Tells an SV that it is an integer.

	void	SvIOK_on(SV* sv)','name' => 'SvIOK_on'},'sv_cmp_locale' => {'text' => 'Compares the strings in two SVs in a locale-aware manner. Is UTF-8 and
\'use bytes\' aware, handles get magic, and will coerce its args to strings
if necessary.  See also C<sv_cmp>.

	I32	sv_cmp_locale(SV* sv1, SV* sv2)','name' => 'sv_cmp_locale'},'sv_catpvs' => {'text' => 'Like C<sv_catpvn>, but takes a literal string instead of a string/length pair.

	void	sv_catpvs(SV* sv, const char* s)','name' => 'sv_catpvs'},'hv_exists' => {'text' => 'Returns a boolean indicating whether the specified hash key exists.  The
C<klen> is the length of the key.

	bool	hv_exists(HV* tb, const char* key, I32 klen)','name' => 'hv_exists'},'dSP' => {'text' => 'Declares a local copy of perl\'s stack pointer for the XSUB, available via
the C<SP> macro.  See C<SP>.

		dSP;','name' => 'dSP'},'Nullsv' => {'text' => 'Null SV pointer.','name' => 'Nullsv'},'mg_length' => {'text' => 'Report on the SV\'s length.  See C<sv_magic>.

	U32	mg_length(SV* sv)','name' => 'mg_length'},'SvPVX' => {'text' => 'Returns a pointer to the physical string in the SV.  The SV must contain a
string.

	char*	SvPVX(SV* sv)','name' => 'SvPVX'},'XPUSHi' => {'text' => 'Push an integer onto the stack, extending the stack if necessary.  Handles
\'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to
declare it.  Do not call multiple C<TARG>-oriented macros to return lists
from XSUB\'s - see C<mXPUSHi> instead.  See also C<PUSHi> and C<mPUSHi>.

	void	XPUSHi(IV iv)','name' => 'XPUSHi'},'HEf_SVKEY' => {'text' => 'This flag, used in the length slot of hash entries and magic structures,
specifies the structure contains an C<SV*> pointer where a C<char*> pointer
is to be expected. (For information only--not to be used).','name' => 'HEf_SVKEY'},'utf8_length' => {'text' => 'Return the length of the UTF-8 char encoded string C<s> in characters.
Stops at C<e> (inclusive).  If C<e E<lt> s> or if the scan would end
up past C<e>, croaks.

	STRLEN	utf8_length(U8* s, U8 *e)','name' => 'utf8_length'},'SvTAINTED_on' => {'text' => 'Marks an SV as tainted if tainting is enabled.

	void	SvTAINTED_on(SV* sv)','name' => 'SvTAINTED_on'},'SvIOK_only_UV' => {'text' => 'Tells and SV that it is an unsigned integer and disables all other OK bits.

	void	SvIOK_only_UV(SV* sv)','name' => 'SvIOK_only_UV'},'sv_nolocking' => {'text' => 'Dummy routine which "locks" an SV when there is no locking module present.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

"Superseded" by sv_nosharing().

	void	sv_nolocking(SV *sv)','name' => 'sv_nolocking'},'sv_vcatpvfn' => {'text' => 'Processes its arguments like C<vsprintf> and appends the formatted output
to an SV.  Uses an array of SVs if the C style variable argument list is
missing (NULL).  When running with taint checks enabled, indicates via
C<maybe_tainted> if results are untrustworthy (often due to the use of
locales).

XXX Except that it maybe_tainted is never assigned to.

Usually used via one of its frontends C<sv_vcatpvf> and C<sv_vcatpvf_mg>.

	void	sv_vcatpvfn(SV* sv, const char* pat, STRLEN patlen, va_list* args, SV** svargs, I32 svmax, bool *maybe_tainted)','name' => 'sv_vcatpvfn'},'strLT' => {'text' => 'Test two strings to see if the first, C<s1>, is less than the second,
C<s2>.  Returns true or false.

	bool	strLT(char* s1, char* s2)','name' => 'strLT'},'av_shift' => {'text' => 'Shifts an SV off the beginning of the array. Returns C<&PL_sv_undef> if the 
array is empty.

	SV*	av_shift(AV* ar)','name' => 'av_shift'},'sv_pvutf8n' => {'text' => 'A private implementation of the C<SvPVutf8> macro for compilers
which can\'t cope with complex macro expressions. Always use the macro
instead.

	char*	sv_pvutf8n(SV *sv, STRLEN *len)','name' => 'sv_pvutf8n'},'newSV' => {'text' => 'Creates a new SV.  A non-zero C<len> parameter indicates the number of
bytes of preallocated string space the SV should have.  An extra byte for a
trailing NUL is also reserved.  (SvPOK is not set for the SV even if string
space is allocated.)  The reference count for the new SV is set to 1.

In 5.9.3, newSV() replaces the older NEWSV() API, and drops the first
parameter, I<x>, a debug aid which allowed callers to identify themselves.
This aid has been superseded by a new build option, PERL_MEM_LOG (see
L<perlhack/PERL_MEM_LOG>).  The older API is still there for use in XS
modules supporting older perls.

	SV*	newSV(STRLEN len)','name' => 'newSV'},'sv_2pvutf8' => {'text' => 'Return a pointer to the UTF-8-encoded representation of the SV, and set *lp
to its length.  May cause the SV to be upgraded to UTF-8 as a side-effect.

Usually accessed via the C<SvPVutf8> macro.

	char*	sv_2pvutf8(SV* sv, STRLEN* lp)','name' => 'sv_2pvutf8'},'sv_nounlocking' => {'text' => 'Dummy routine which "unlocks" an SV when there is no locking module present.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

"Superseded" by sv_nosharing().

	void	sv_nounlocking(SV *sv)','name' => 'sv_nounlocking'},'dITEMS' => {'text' => 'Sets up the C<items> variable.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dITEMS;','name' => 'dITEMS'},'SvUV_set' => {'text' => 'Set the value of the UV pointer in sv to val.  See C<SvIV_set>.

	void	SvUV_set(SV* sv, UV val)','name' => 'SvUV_set'},'CopyD' => {'text' => 'Like C<Copy> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	CopyD(void* src, void* dest, int nitems, type)','name' => 'CopyD'},'sv_setiv_mg' => {'text' => 'Like C<sv_setiv>, but also handles \'set\' magic.

	void	sv_setiv_mg(SV *sv, IV i)','name' => 'sv_setiv_mg'},'PUTBACK' => {'text' => 'Closing bracket for XSUB arguments.  This is usually handled by C<xsubpp>.
See C<PUSHMARK> and L<perlcall> for other uses.

		PUTBACK;','name' => 'PUTBACK'},'savesharedpvn' => {'text' => 'A version of C<savepvn()> which allocates the duplicate string in memory
which is shared between threads. (With the specific difference that a NULL
pointer is not acceptable)

	char*	savesharedpvn(const char *const pv, const STRLEN len)','name' => 'savesharedpvn'},'dAXMARK' => {'text' => 'Sets up the C<ax> variable and stack marker variable C<mark>.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dAXMARK;','name' => 'dAXMARK'},'SvCUR_set' => {'text' => 'Set the current length of the string which is in the SV.  See C<SvCUR>
and C<SvIV_set>.

	void	SvCUR_set(SV* sv, STRLEN len)','name' => 'SvCUR_set'},'sv_2uv_flags' => {'text' => 'Return the unsigned integer value of an SV, doing any necessary string
conversion.  If flags includes SV_GMAGIC, does an mg_get() first.
Normally used via the C<SvUV(sv)> and C<SvUVx(sv)> macros.

	UV	sv_2uv_flags(SV* sv, I32 flags)','name' => 'sv_2uv_flags'},'SvNOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a double.

	U32	SvNOK(SV* sv)','name' => 'SvNOK'},'mPUSHn' => {'text' => 'Push a double onto the stack.  The stack must have room for this element.
Does not use C<TARG>.  See also C<PUSHn>, C<mXPUSHn> and C<XPUSHn>.

	void	mPUSHn(NV nv)','name' => 'mPUSHn'},'G_SCALAR' => {'text' => 'Used to indicate scalar context.  See C<GIMME_V>, C<GIMME>, and
L<perlcall>.','name' => 'G_SCALAR'},'sv_reset' => {'text' => 'Underlying implementation for the C<reset> Perl function.
Note that the perl-level function is vaguely deprecated.

	void	sv_reset(char* s, HV* stash)','name' => 'sv_reset'},'sv_2pv_flags' => {'text' => 'Returns a pointer to the string value of an SV, and sets *lp to its length.
If flags includes SV_GMAGIC, does an mg_get() first. Coerces sv to a string
if necessary.
Normally invoked via the C<SvPV_flags> macro. C<sv_2pv()> and C<sv_2pv_nomg>
usually end up here too.

	char*	sv_2pv_flags(SV* sv, STRLEN* lp, I32 flags)','name' => 'sv_2pv_flags'},'SvTAINTED_off' => {'text' => 'Untaints an SV. Be I<very> careful with this routine, as it short-circuits
some of Perl\'s fundamental security features. XS module authors should not
use this function unless they fully understand all the implications of
unconditionally untainting the value. Untainting should be done in the
standard perl fashion, via a carefully crafted regexp, rather than directly
untainting variables.

	void	SvTAINTED_off(SV* sv)','name' => 'SvTAINTED_off'},'SvNVx' => {'text' => 'Coerces the given SV to a double and returns it. Guarantees to evaluate
C<sv> only once. Only use this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvNV>.

	NV	SvNVx(SV* sv)','name' => 'SvNVx'},'require_pv' => {'text' => 'Tells Perl to C<require> the file named by the string argument.  It is
analogous to the Perl code C<eval "require \'$file\'">.  It\'s even
implemented that way; consider using load_module instead.

NOTE: the perl_ form of this function is deprecated.

	void	require_pv(const char* pv)','name' => 'require_pv'},'sv_upgrade' => {'text' => 'Upgrade an SV to a more complex form.  Generally adds a new body type to the
SV, then copies across as much information as possible from the old body.
You generally want to use the C<SvUPGRADE> macro wrapper. See also C<svtype>.

	bool	sv_upgrade(SV* sv, U32 mt)','name' => 'sv_upgrade'},'strEQ' => {'text' => 'Test two strings to see if they are equal.  Returns true or false.

	bool	strEQ(char* s1, char* s2)','name' => 'strEQ'},'hv_store' => {'text' => 'Stores an SV in a hash.  The hash key is specified as C<key> and C<klen> is
the length of the key.  The C<hash> parameter is the precomputed hash
value; if it is zero then Perl will compute it.  The return value will be
NULL if the operation failed or if the value did not need to be actually
stored within the hash (as in the case of tied hashes).  Otherwise it can
be dereferenced to get the original C<SV*>.  Note that the caller is
responsible for suitably incrementing the reference count of C<val> before
the call, and decrementing it if the function returned NULL.  Effectively
a successful hv_store takes ownership of one reference to C<val>.  This is
usually what you want; a newly created SV has a reference count of one, so
if all your code does is create SVs then store them in a hash, hv_store
will own the only reference to the new SV, and your code doesn\'t need to do
anything further to tidy up.  hv_store is not implemented as a call to
hv_store_ent, and does not create a temporary SV for the key, so if your
key data is not already in SV form then use hv_store in preference to
hv_store_ent.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	SV**	hv_store(HV* tb, const char* key, I32 klen, SV* val, U32 hash)','name' => 'hv_store'},'isUPPER' => {'text' => 'Returns a boolean indicating whether the C C<char> is an uppercase
character.

	bool	isUPPER(char ch)','name' => 'isUPPER'},'sv_setsv_mg' => {'text' => 'Like C<sv_setsv>, but also handles \'set\' magic.

	void	sv_setsv_mg(SV *dstr, SV *sstr)','name' => 'sv_setsv_mg'},'hv_fetch_ent' => {'text' => 'Returns the hash entry which corresponds to the specified key in the hash.
C<hash> must be a valid precomputed hash number for the given C<key>, or 0
if you want the function to compute it.  IF C<lval> is set then the fetch
will be part of a store.  Make sure the return value is non-null before
accessing it.  The return value when C<tb> is a tied hash is a pointer to a
static location, so be sure to make a copy of the structure if you need to
store it somewhere.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	HE*	hv_fetch_ent(HV* tb, SV* key, I32 lval, U32 hash)','name' => 'hv_fetch_ent'},'isLOWER' => {'text' => 'Returns a boolean indicating whether the C C<char> is a lowercase
character.

	bool	isLOWER(char ch)','name' => 'isLOWER'},'ENTER' => {'text' => 'Opening bracket on a callback.  See C<LEAVE> and L<perlcall>.

		ENTER;','name' => 'ENTER'},'hv_iterkey' => {'text' => 'Returns the key from the current position of the hash iterator.  See
C<hv_iterinit>.

	char*	hv_iterkey(HE* entry, I32* retlen)','name' => 'hv_iterkey'},'PL_sv_no' => {'text' => 'This is the C<false> SV.  See C<PL_sv_yes>.  Always refer to this as
C<&PL_sv_no>.

	SV	PL_sv_no','name' => 'PL_sv_no'},'SvNOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a double.  Checks the
B<private> setting.  Use C<SvNOK>.

	U32	SvNOKp(SV* sv)','name' => 'SvNOKp'},'Newx' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.

In 5.9.3, Newx() and friends replace the older New() API, and drops
the first parameter, I<x>, a debug aid which allowed callers to identify
themselves.  This aid has been superseded by a new build option,
PERL_MEM_LOG (see L<perlhack/PERL_MEM_LOG>).  The older API is still
there for use in XS modules supporting older perls.

	void	Newx(void* ptr, int nitems, type)','name' => 'Newx'},'PUSHs' => {'text' => 'Push an SV onto the stack.  The stack must have room for this element.
Does not handle \'set\' magic.  Does not use C<TARG>.  See also C<PUSHmortal>,
C<XPUSHs> and C<XPUSHmortal>.

	void	PUSHs(SV* sv)','name' => 'PUSHs'},'sv_setuv' => {'text' => 'Copies an unsigned integer into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setuv_mg>.

	void	sv_setuv(SV* sv, UV num)','name' => 'sv_setuv'},'SvUPGRADE' => {'text' => 'Used to upgrade an SV to a more complex form.  Uses C<sv_upgrade> to
perform the upgrade if necessary.  See C<svtype>.

	void	SvUPGRADE(SV* sv, svtype type)','name' => 'SvUPGRADE'},'utf8_to_uvchr' => {'text' => 'Returns the native character value of the first character in the string C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

If C<s> does not point to a well-formed UTF-8 character, zero is
returned and retlen is set, if possible, to -1.

	UV	utf8_to_uvchr(U8 *s, STRLEN *retlen)','name' => 'utf8_to_uvchr'},'nothreadhook' => {'text' => 'Stub that provides thread hook for perl_destruct when there are
no threads.

	int	nothreadhook()','name' => 'nothreadhook'},'bytes_to_utf8' => {'text' => 'Converts a string C<s> of length C<len> from ASCII into UTF-8 encoding.
Returns a pointer to the newly-created string, and sets C<len> to
reflect the new length.

If you want to convert to UTF-8 from other encodings than ASCII,
see sv_recode_to_utf8().

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	bytes_to_utf8(U8 *s, STRLEN *len)','name' => 'bytes_to_utf8'},'SvIsCOW_shared_hash' => {'text' => 'Returns a boolean indicating whether the SV is Copy-On-Write shared hash key
scalar.

	bool	SvIsCOW_shared_hash(SV* sv)','name' => 'SvIsCOW_shared_hash'},'sv_pvn' => {'text' => 'A private implementation of the C<SvPV> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	char*	sv_pvn(SV *sv, STRLEN *len)','name' => 'sv_pvn'},'sv_setref_iv' => {'text' => 'Copies an integer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_iv(SV* rv, const char* classname, IV iv)','name' => 'sv_setref_iv'},'sv_chop' => {'text' => 'Efficient removal of characters from the beginning of the string buffer.
SvPOK(sv) must be true and the C<ptr> must be a pointer to somewhere inside
the string buffer.  The C<ptr> becomes the first character of the adjusted
string. Uses the "OOK hack".
Beware: after this function returns, C<ptr> and SvPVX_const(sv) may no longer
refer to the same chunk of data.

	void	sv_chop(SV* sv, char* ptr)','name' => 'sv_chop'},'sv_backoff' => {'text' => 'Remove any string offset. You should normally use the C<SvOOK_off> macro
wrapper instead.

	int	sv_backoff(SV* sv)','name' => 'sv_backoff'},'sv_catsv_nomg' => {'text' => 'Like C<sv_catsv> but doesn\'t process magic.

	void	sv_catsv_nomg(SV* dsv, SV* ssv)','name' => 'sv_catsv_nomg'},'XPUSHu' => {'text' => 'Push an unsigned integer onto the stack, extending the stack if necessary.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to
return lists from XSUB\'s - see C<mXPUSHu> instead.  See also C<PUSHu> and
C<mPUSHu>.

	void	XPUSHu(UV uv)','name' => 'XPUSHu'},'sv_setuv_mg' => {'text' => 'Like C<sv_setuv>, but also handles \'set\' magic.

	void	sv_setuv_mg(SV *sv, UV u)','name' => 'sv_setuv_mg'},'XS_VERSION' => {'text' => 'The version identifier for an XS module.  This is usually
handled automatically by C<ExtUtils::MakeMaker>.  See C<XS_VERSION_BOOTCHECK>.','name' => 'XS_VERSION'},'PL_na' => {'text' => 'A convenience variable which is typically used with C<SvPV> when one
doesn\'t care about the length of the string.  It is usually more efficient
to either declare a local variable and use that instead or to use the
C<SvPV_nolen> macro.

	STRLEN	PL_na','name' => 'PL_na'},'newSViv' => {'text' => 'Creates a new SV and copies an integer into it.  The reference count for the
SV is set to 1.

	SV*	newSViv(IV i)','name' => 'newSViv'},'sv_untaint' => {'text' => 'Untaint an SV. Use C<SvTAINTED_off> instead.
	void	sv_untaint(SV* sv)','name' => 'sv_untaint'},'sv_setpv' => {'text' => 'Copies a string into an SV.  The string must be null-terminated.  Does not
handle \'set\' magic.  See C<sv_setpv_mg>.

	void	sv_setpv(SV* sv, const char* ptr)','name' => 'sv_setpv'},'Newxz' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.  The allocated
memory is zeroed with C<memzero>.  See also C<Newx>.

	void	Newxz(void* ptr, int nitems, type)','name' => 'Newxz'},'SVt_PVHV' => {'text' => 'Type flag for hashes.  See C<svtype>.','name' => 'SVt_PVHV'},'SvGROW' => {'text' => 'Expands the character buffer in the SV so that it has room for the
indicated number of bytes (remember to reserve space for an extra trailing
NUL character).  Calls C<sv_grow> to perform the expansion if necessary.
Returns a pointer to the character buffer.

	char *	SvGROW(SV* sv, STRLEN len)','name' => 'SvGROW'},'gv_fetchmethod' => {'text' => 'See L<gv_fetchmethod_autoload>.

	GV*	gv_fetchmethod(HV* stash, const char* name)','name' => 'gv_fetchmethod'},'dMULTICALL' => {'text' => 'Declare local variables for a multicall. See L<perlcall/Lightweight Callbacks>.

		dMULTICALL;','name' => 'dMULTICALL'},'sv_catpv' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.
If the SV has the UTF-8 status set, then the bytes appended should be
valid UTF-8.  Handles \'get\' magic, but not \'set\' magic.  See C<sv_catpv_mg>.

	void	sv_catpv(SV* sv, const char* ptr)','name' => 'sv_catpv'},'sv_len' => {'text' => 'Returns the length of the string in the SV. Handles magic and type
coercion.  See also C<SvCUR>, which gives raw access to the xpv_cur slot.

	STRLEN	sv_len(SV* sv)','name' => 'sv_len'},'SvPVbyte_nolen' => {'text' => 'Like C<SvPV_nolen>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte_nolen(SV* sv)','name' => 'SvPVbyte_nolen'},'sv_pvutf8' => {'text' => 'Use the C<SvPVutf8_nolen> macro instead

	char*	sv_pvutf8(SV *sv)','name' => 'sv_pvutf8'},'SVt_PVAV' => {'text' => 'Type flag for arrays.  See C<svtype>.','name' => 'SVt_PVAV'},'LEAVE' => {'text' => 'Closing bracket on a callback.  See C<ENTER> and L<perlcall>.

		LEAVE;','name' => 'LEAVE'},'hv_undef' => {'text' => 'Undefines the hash.

	void	hv_undef(HV* tb)','name' => 'hv_undef'},'SvSetMagicSV_nosteal' => {'text' => 'Like C<SvSetSV_nosteal>, but does any set magic required afterwards.

	void	SvSetMagicSV_nosteal(SV* dsv, SV* ssv)','name' => 'SvSetMagicSV_nosteal'},'hv_delete_ent' => {'text' => 'Deletes a key/value pair in the hash.  The value SV is removed from the
hash and returned to the caller.  The C<flags> value will normally be zero;
if set to G_DISCARD then NULL will be returned.  C<hash> can be a valid
precomputed hash value, or 0 to ask for it to be computed.

	SV*	hv_delete_ent(HV* tb, SV* key, I32 flags, U32 hash)','name' => 'hv_delete_ent'},'CLASS' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the 
class name for a C++ XS constructor.  This is always a C<char*>.  See C<THIS>.

	char*	CLASS','name' => 'CLASS'},'savesvpv' => {'text' => 'A version of C<savepv()>/C<savepvn()> which gets the string to duplicate from
the passed in SV using C<SvPV()>

	char*	savesvpv(SV* sv)','name' => 'savesvpv'},'sv_isobject' => {'text' => 'Returns a boolean indicating whether the SV is an RV pointing to a blessed
object.  If the SV is not an RV, or if the object is not blessed, then this
will return false.

	int	sv_isobject(SV* sv)','name' => 'sv_isobject'},'sv_pvn_force_flags' => {'text' => 'Get a sensible string out of the SV somehow.
If C<flags> has C<SV_GMAGIC> bit set, will C<mg_get> on C<sv> if
appropriate, else not. C<sv_pvn_force> and C<sv_pvn_force_nomg> are
implemented in terms of this function.
You normally want to use the various wrapper macros instead: see
C<SvPV_force> and C<SvPV_force_nomg>

	char*	sv_pvn_force_flags(SV* sv, STRLEN* lp, I32 flags)','name' => 'sv_pvn_force_flags'},'HeKLEN' => {'text' => 'If this is negative, and amounts to C<HEf_SVKEY>, it indicates the entry
holds an C<SV*> key.  Otherwise, holds the actual length of the key.  Can
be assigned to. The C<HePV()> macro is usually preferable for finding key
lengths.

	STRLEN	HeKLEN(HE* he)','name' => 'HeKLEN'},'to_utf8_title' => {'text' => 'Convert the UTF-8 encoded character at p to its titlecase version and
store that in UTF-8 in ustrp and its length in bytes in lenp.  Note
that the ustrp needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
titlecase version may be longer than the original character.

The first character of the titlecased version is returned
(but note, as explained above, that there may be more.)

	UV	to_utf8_title(U8 *p, U8* ustrp, STRLEN *lenp)','name' => 'to_utf8_title'},'mPUSHi' => {'text' => 'Push an integer onto the stack.  The stack must have room for this element.
Does not use C<TARG>.  See also C<PUSHi>, C<mXPUSHi> and C<XPUSHi>.

	void	mPUSHi(IV iv)','name' => 'mPUSHi'},'PUSHn' => {'text' => 'Push a double onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to
return lists from XSUB\'s - see C<mPUSHn> instead.  See also C<XPUSHn> and
C<mXPUSHn>.

	void	PUSHn(NV nv)','name' => 'PUSHn'},'SvIV' => {'text' => 'Coerces the given SV to an integer and returns it. See C<SvIVx> for a
version which guarantees to evaluate sv only once.

	IV	SvIV(SV* sv)','name' => 'SvIV'},'PL_sv_yes' => {'text' => 'This is the C<true> SV.  See C<PL_sv_no>.  Always refer to this as
C<&PL_sv_yes>.

	SV	PL_sv_yes','name' => 'PL_sv_yes'},'sv_nosharing' => {'text' => 'Dummy routine which "shares" an SV when there is no sharing module present.
Or "locks" it. Or "unlocks" it. In other words, ignores its single SV argument.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

	void	sv_nosharing(SV *sv)','name' => 'sv_nosharing'},'SvUTF8_off' => {'text' => 'Unsets the UTF-8 status of an SV.

	void	SvUTF8_off(SV *sv)','name' => 'SvUTF8_off'},'looks_like_number' => {'text' => 'Test if the content of an SV looks like a number (or is a number).
C<Inf> and C<Infinity> are treated as numbers (so will not issue a
non-numeric warning), even if your atof() doesn\'t grok them.

	I32	looks_like_number(SV* sv)','name' => 'looks_like_number'},'sv_catpv_mg' => {'text' => 'Like C<sv_catpv>, but also handles \'set\' magic.

	void	sv_catpv_mg(SV *sv, const char *ptr)','name' => 'sv_catpv_mg'},'XSRETURN_EMPTY' => {'text' => 'Return an empty list from an XSUB immediately.

		XSRETURN_EMPTY;','name' => 'XSRETURN_EMPTY'},'sv_setref_uv' => {'text' => 'Copies an unsigned integer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_uv(SV* rv, const char* classname, UV uv)','name' => 'sv_setref_uv'},'getcwd_sv' => {'text' => 'Fill the sv with current working directory

	int	getcwd_sv(SV* sv)','name' => 'getcwd_sv'},'newSVpvs_share' => {'text' => 'Like C<newSVpvn_share>, but takes a literal string instead of a string/length
pair and omits the hash parameter.

	SV*	newSVpvs_share(const char* s)','name' => 'newSVpvs_share'},'newSVpv' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  If C<len> is zero, Perl will compute the length using
strlen().  For efficiency, consider using C<newSVpvn> instead.

	SV*	newSVpv(const char* s, STRLEN len)','name' => 'newSVpv'},'sv_2pvbyte' => {'text' => 'Return a pointer to the byte-encoded representation of the SV, and set *lp
to its length.  May cause the SV to be downgraded from UTF-8 as a
side-effect.

Usually accessed via the C<SvPVbyte> macro.

	char*	sv_2pvbyte(SV* sv, STRLEN* lp)','name' => 'sv_2pvbyte'},'fbm_instr' => {'text' => 'Returns the location of the SV in the string delimited by C<str> and
C<strend>.  It returns C<NULL> if the string can\'t be found.  The C<sv>
does not have to be fbm_compiled, but the search will not be as fast
then.

	char*	fbm_instr(unsigned char* big, unsigned char* bigend, SV* littlesv, U32 flags)','name' => 'fbm_instr'},'sv_setpvf' => {'text' => 'Works like C<sv_catpvf> but copies the text into the SV instead of
appending it.  Does not handle \'set\' magic.  See C<sv_setpvf_mg>.

	void	sv_setpvf(SV* sv, const char* pat, ...)','name' => 'sv_setpvf'},'XPUSHn' => {'text' => 'Push a double onto the stack, extending the stack if necessary.  Handles
\'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to
declare it.  Do not call multiple C<TARG>-oriented macros to return lists
from XSUB\'s - see C<mXPUSHn> instead.  See also C<PUSHn> and C<mPUSHn>.

	void	XPUSHn(NV nv)','name' => 'XPUSHn'},'SVt_PV' => {'text' => 'Pointer type flag for scalars.  See C<svtype>.','name' => 'SVt_PV'},'call_sv' => {'text' => 'Performs a callback to the Perl sub whose name is in the SV.  See
L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_sv(SV* sv, VOL I32 flags)','name' => 'call_sv'},'strGT' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than the second,
C<s2>.  Returns true or false.

	bool	strGT(char* s1, char* s2)','name' => 'strGT'},'mXPUSHs' => {'text' => 'Push an SV onto the stack, extending the stack if necessary and mortalizes
the SV.  Does not use C<TARG>.  See also C<XPUSHs> and C<mPUSHs>.

	void	mXPUSHs(SV* sv)','name' => 'mXPUSHs'},'sv_vcatpvf' => {'text' => 'Processes its arguments like C<vsprintf> and appends the formatted output
to an SV.  Does not handle \'set\' magic.  See C<sv_vcatpvf_mg>.

Usually used via its frontend C<sv_catpvf>.

	void	sv_vcatpvf(SV* sv, const char* pat, va_list* args)','name' => 'sv_vcatpvf'},'sv_pos_u2b' => {'text' => 'Converts the value pointed to by offsetp from a count of UTF-8 chars from
the start of the string, to a count of the equivalent number of bytes; if
lenp is non-zero, it does the same to lenp, but this time starting from
the offset, rather than from the start of the string. Handles magic and
type coercion.

	void	sv_pos_u2b(SV* sv, I32* offsetp, I32* lenp)','name' => 'sv_pos_u2b'},'HeSVKEY_set' => {'text' => 'Sets the key to a given C<SV*>, taking care to set the appropriate flags to
indicate the presence of an C<SV*> key, and returns the same
C<SV*>.

	SV*	HeSVKEY_set(HE* he, SV* sv)','name' => 'HeSVKEY_set'},'POPl' => {'text' => 'Pops a long off the stack.

	long	POPl','name' => 'POPl'},'SPAGAIN' => {'text' => 'Refetch the stack pointer.  Used after a callback.  See L<perlcall>.

		SPAGAIN;','name' => 'SPAGAIN'},'SvIOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains an integer.  Checks
the B<private> setting.  Use C<SvIOK>.

	U32	SvIOKp(SV* sv)','name' => 'SvIOKp'},'get_cv' => {'text' => 'Uses C<strlen> to get the length of C<name>, then calls C<get_cvn_flags>.

NOTE: the perl_ form of this function is deprecated.

	CV*	get_cv(const char* name, I32 flags)','name' => 'get_cv'},'XST_mUNDEF' => {'text' => 'Place C<&PL_sv_undef> into the specified position C<pos> on the
stack.

	void	XST_mUNDEF(int pos)','name' => 'XST_mUNDEF'},'SvUNLOCK' => {'text' => 'Releases a mutual exclusion lock on sv if a suitable module
has been loaded.

	void	SvUNLOCK(SV* sv)','name' => 'SvUNLOCK'},'mg_set' => {'text' => 'Do magic after a value is assigned to the SV.  See C<sv_magic>.

	int	mg_set(SV* sv)','name' => 'mg_set'},'sv_mortalcopy' => {'text' => 'Creates a new SV which is a copy of the original SV (using C<sv_setsv>).
The new SV is marked as mortal. It will be destroyed "soon", either by an
explicit call to FREETMPS, or by an implicit call at places such as
statement boundaries.  See also C<sv_newmortal> and C<sv_2mortal>.

	SV*	sv_mortalcopy(SV* oldsv)','name' => 'sv_mortalcopy'},'sv_catpvn_nomg' => {'text' => 'Like C<sv_catpvn> but doesn\'t process magic.

	void	sv_catpvn_nomg(SV* sv, const char* ptr, STRLEN len)','name' => 'sv_catpvn_nomg'},'newSVpvs_flags' => {'text' => 'Like C<newSVpvn_flags>, but takes a literal string instead of a string/length
pair.

	SV*	newSVpvs_flags(const char* s, U32 flags)','name' => 'newSVpvs_flags'},'G_NOARGS' => {'text' => 'Indicates that no arguments are being sent to a callback.  See
L<perlcall>.','name' => 'G_NOARGS'},'savepvn' => {'text' => 'Perl\'s version of what C<strndup()> would be if it existed. Returns a
pointer to a newly allocated string which is a duplicate of the first
C<len> bytes from C<pv>, plus a trailing NUL byte. The memory allocated for
the new string can be freed with the C<Safefree()> function.

	char*	savepvn(const char* pv, I32 len)','name' => 'savepvn'},'av_exists' => {'text' => 'Returns true if the element indexed by C<key> has been initialized.

This relies on the fact that uninitialized array elements are set to
C<&PL_sv_undef>.

	bool	av_exists(AV* ar, I32 key)','name' => 'av_exists'},'SvCUR' => {'text' => 'Returns the length of the string which is in the SV.  See C<SvLEN>.

	STRLEN	SvCUR(SV* sv)','name' => 'SvCUR'},'sv_bless' => {'text' => 'Blesses an SV into a specified package.  The SV must be an RV.  The package
must be designated by its stash (see C<gv_stashpv()>).  The reference count
of the SV is unaffected.

	SV*	sv_bless(SV* sv, HV* stash)','name' => 'sv_bless'},'sv_isa' => {'text' => 'Returns a boolean indicating whether the SV is blessed into the specified
class.  This does not check for subtypes; use C<sv_derived_from> to verify
an inheritance relationship.

	int	sv_isa(SV* sv, const char* name)','name' => 'sv_isa'},'sv_catpvf' => {'text' => 'Processes its arguments like C<sprintf> and appends the formatted
output to an SV.  If the appended data contains "wide" characters
(including, but not limited to, SVs with a UTF-8 PV formatted with %s,
and characters >255 formatted with %c), the original SV might get
upgraded to UTF-8.  Handles \'get\' magic, but not \'set\' magic.  See
C<sv_catpvf_mg>. If the original SV was UTF-8, the pattern should be
valid UTF-8; if the original SV was bytes, the pattern should be too.

	void	sv_catpvf(SV* sv, const char* pat, ...)','name' => 'sv_catpvf'},'XSRETURN_PV' => {'text' => 'Return a copy of a string from an XSUB immediately.  Uses C<XST_mPV>.

	void	XSRETURN_PV(char* str)','name' => 'XSRETURN_PV'},'utf8_to_uvuni' => {'text' => 'Returns the Unicode code point of the first character in the string C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

This function should only be used when returned UV is considered
an index into the Unicode semantic tables (e.g. swashes).

If C<s> does not point to a well-formed UTF-8 character, zero is
returned and retlen is set, if possible, to -1.

	UV	utf8_to_uvuni(U8 *s, STRLEN *retlen)','name' => 'utf8_to_uvuni'},'sv_2io' => {'text' => 'Using various gambits, try to get an IO from an SV: the IO slot if its a
GV; or the recursive result if we\'re an RV; or the IO slot of the symbol
named after the PV if we\'re a string.

	IO*	sv_2io(SV* sv)','name' => 'sv_2io'},'SvMAGIC_set' => {'text' => 'Set the value of the MAGIC pointer in sv to val.  See C<SvIV_set>.

	void	SvMAGIC_set(SV* sv, MAGIC* val)','name' => 'SvMAGIC_set'},'newSVhek' => {'text' => 'Creates a new SV from the hash key structure.  It will generate scalars that
point to the shared string table where possible. Returns a new (undefined)
SV if the hek is NULL.

	SV*	newSVhek(const HEK *hek)','name' => 'newSVhek'},'isALPHA' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ASCII alphabetic
character.

	bool	isALPHA(char ch)','name' => 'isALPHA'},'Nullhv' => {'text' => 'Null HV pointer.','name' => 'Nullhv'},'av_fill' => {'text' => 'Set the highest index in the array to the given number, equivalent to
Perl\'s C<$#array = $fill;>.

The number of elements in the an array will be C<fill + 1> after
av_fill() returns.  If the array was previously shorter then the
additional elements appended are set to C<PL_sv_undef>.  If the array
was longer, then the excess elements are freed.  C<av_fill(av, -1)> is
the same as C<av_clear(av)>.

	void	av_fill(AV* ar, I32 fill)','name' => 'av_fill'},'SvREFCNT_inc' => {'text' => 'Increments the reference count of the given SV.

All of the following SvREFCNT_inc* macros are optimized versions of
SvREFCNT_inc, and can be replaced with SvREFCNT_inc.

	SV*	SvREFCNT_inc(SV* sv)','name' => 'SvREFCNT_inc'},'SvTYPE' => {'text' => 'Returns the type of the SV.  See C<svtype>.

	svtype	SvTYPE(SV* sv)','name' => 'SvTYPE'},'SvIOK_only' => {'text' => 'Tells an SV that it is an integer and disables all other OK bits.

	void	SvIOK_only(SV* sv)','name' => 'SvIOK_only'},'MoveD' => {'text' => 'Like C<Move> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	MoveD(void* src, void* dest, int nitems, type)','name' => 'MoveD'},'SvROK_off' => {'text' => 'Unsets the RV status of an SV.

	void	SvROK_off(SV* sv)','name' => 'SvROK_off'},'Renew' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function.

	void	Renew(void* ptr, int nitems, type)','name' => 'Renew'},'grok_bin' => {'text' => 'converts a string representing a binary number to numeric form.

On entry I<start> and I<*len> give the string to scan, I<*flags> gives
conversion flags, and I<result> should be NULL or a pointer to an NV.
The scan stops at the end of the string, or the first invalid character.
Unless C<PERL_SCAN_SILENT_ILLDIGIT> is set in I<*flags>, encountering an
invalid character will also trigger a warning.
On return I<*len> is set to the length of the scanned string,
and I<*flags> gives output flags.

If the value is <= C<UV_MAX> it is returned as a UV, the output flags are clear,
and nothing is written to I<*result>. If the value is > UV_MAX C<grok_bin>
returns UV_MAX, sets C<PERL_SCAN_GREATER_THAN_UV_MAX> in the output flags,
and writes the value to I<*result> (or the value is discarded if I<result>
is NULL).

The binary number may optionally be prefixed with "0b" or "b" unless
C<PERL_SCAN_DISALLOW_PREFIX> is set in I<*flags> on entry. If
C<PERL_SCAN_ALLOW_UNDERSCORES> is set in I<*flags> then the binary
number may use \'_\' characters to separate digits.

	UV	grok_bin(char* start, STRLEN* len, I32* flags, NV *result)','name' => 'grok_bin'},'perl_free' => {'text' => 'Releases a Perl interpreter.  See L<perlembed>.

	void	perl_free(PerlInterpreter* interp)','name' => 'perl_free'},'mg_find' => {'text' => 'Finds the magic pointer for type matching the SV.  See C<sv_magic>.

	MAGIC*	mg_find(SV* sv, int type)','name' => 'mg_find'},'SvNOK_on' => {'text' => 'Tells an SV that it is a double.

	void	SvNOK_on(SV* sv)','name' => 'SvNOK_on'},'XPUSHmortal' => {'text' => 'Push a new mortal SV onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHs>, C<PUSHmortal> and C<PUSHs>.

	void	XPUSHmortal()','name' => 'XPUSHmortal'},'newSVpvn_share' => {'text' => 'Creates a new SV with its SvPVX_const pointing to a shared string in the string
table. If the string does not already exist in the table, it is created
first.  Turns on READONLY and FAKE. If the C<hash> parameter is non-zero, that
value is used; otherwise the hash is computed. The string\'s hash can be later
be retrieved from the SV with the C<SvSHARED_HASH()> macro. The idea here is
that as the string table is used for shared hash keys these strings will have
SvPVX_const == HeKEY and hash lookup will avoid string compare.

	SV*	newSVpvn_share(const char* s, I32 len, U32 hash)','name' => 'newSVpvn_share'},'sv_setpvf_mg' => {'text' => 'Like C<sv_setpvf>, but also handles \'set\' magic.

	void	sv_setpvf_mg(SV *sv, const char* pat, ...)','name' => 'sv_setpvf_mg'},'SvPOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a character string.
Checks the B<private> setting.  Use C<SvPOK>.

	U32	SvPOKp(SV* sv)','name' => 'SvPOKp'},'sv_catpvn' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.  The
C<len> indicates number of bytes to copy.  If the SV has the UTF-8
status set, then the bytes appended should be valid UTF-8.
Handles \'get\' magic, but not \'set\' magic.  See C<sv_catpvn_mg>.

	void	sv_catpvn(SV* sv, const char* ptr, STRLEN len)','name' => 'sv_catpvn'},'sv_setref_pv' => {'text' => 'Copies a pointer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  If the C<pv> argument is NULL then C<PL_sv_undef> will be placed
into the SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

Do not use with other Perl types such as HV, AV, SV, CV, because those
objects will become corrupted by the pointer copy process.

Note that C<sv_setref_pvn> copies the string while this copies the pointer.

	SV*	sv_setref_pv(SV* rv, const char* classname, void* pv)','name' => 'sv_setref_pv'},'fbm_compile' => {'text' => 'Analyses the string in order to make fast searches on it using fbm_instr()
-- the Boyer-Moore algorithm.

	void	fbm_compile(SV* sv, U32 flags)','name' => 'fbm_compile'},'sv_utf8_downgrade' => {'text' => 'Attempts to convert the PV of an SV from characters to bytes.
If the PV contains a character beyond byte, this conversion will fail;
in this case, either returns false or, if C<fail_ok> is not
true, croaks.

This is not as a general purpose Unicode to byte encoding interface:
use the Encode extension for that.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	sv_utf8_downgrade(SV *sv, bool fail_ok)','name' => 'sv_utf8_downgrade'},'SvNIOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a number, integer or
double.  Checks the B<private> setting.  Use C<SvNIOK>.

	U32	SvNIOKp(SV* sv)','name' => 'SvNIOKp'},'utf8_hop' => {'text' => 'Return the UTF-8 pointer C<s> displaced by C<off> characters, either
forward or backward.

WARNING: do not use the following unless you *know* C<off> is within
the UTF-8 data pointed to by C<s> *and* that on entry C<s> is aligned
on the first byte of character or just after the last byte of a character.

	U8*	utf8_hop(U8 *s, I32 off)','name' => 'utf8_hop'},'sv_len_utf8' => {'text' => 'Returns the number of characters in the string in an SV, counting wide
UTF-8 bytes as a single character. Handles magic and type coercion.

	STRLEN	sv_len_utf8(SV* sv)','name' => 'sv_len_utf8'},'sv_setref_pvn' => {'text' => 'Copies a string into a new SV, optionally blessing the SV.  The length of the
string must be specified with C<n>.  The C<rv> argument will be upgraded to
an RV.  That RV will be modified to point to the new SV.  The C<classname>
argument indicates the package for the blessing.  Set C<classname> to
C<NULL> to avoid the blessing.  The new SV will have a reference count
of 1, and the RV will be returned.

Note that C<sv_setref_pv> copies the pointer while this copies the string.

	SV*	sv_setref_pvn(SV* rv, const char* classname, char* pv, STRLEN n)','name' => 'sv_setref_pvn'},'SVt_PVMG' => {'text' => 'Type flag for blessed scalars.  See C<svtype>.','name' => 'SVt_PVMG'},'PUSHp' => {'text' => 'Push a string onto the stack.  The stack must have room for this element.
The C<len> indicates the length of the string.  Handles \'set\' magic.  Uses
C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to declare it.  Do not
call multiple C<TARG>-oriented macros to return lists from XSUB\'s - see
C<mPUSHp> instead.  See also C<XPUSHp> and C<mXPUSHp>.

	void	PUSHp(char* str, STRLEN len)','name' => 'PUSHp'},'SvREFCNT_inc_simple_void' => {'text' => 'Same as SvREFCNT_inc_simple, but can only be used if you don\'t need the
return value.  The macro doesn\'t need to return a meaningful value.

	void	SvREFCNT_inc_simple_void(SV* sv)','name' => 'SvREFCNT_inc_simple_void'},'hv_clear_placeholders' => {'text' => 'Clears any placeholders from a hash.  If a restricted hash has any of its keys
marked as readonly and the key is subsequently deleted, the key is not actually
deleted but is marked by assigning it a value of &PL_sv_placeholder.  This tags
it so it will be ignored by future operations such as iterating over the hash,
but will still allow the hash to have a value reassigned to the key at some
future point.  This function clears any such placeholder keys from the hash.
See Hash::Util::lock_keys() for an example of its use.

	void	hv_clear_placeholders(HV* hb)','name' => 'hv_clear_placeholders'},'mXPUSHi' => {'text' => 'Push an integer onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHi>, C<mPUSHi> and C<PUSHi>.

	void	mXPUSHi(IV iv)','name' => 'mXPUSHi'},'dAX' => {'text' => 'Sets up the C<ax> variable.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dAX;','name' => 'dAX'},'PL_sv_undef' => {'text' => 'This is the C<undef> SV.  Always refer to this as C<&PL_sv_undef>.

	SV	PL_sv_undef','name' => 'PL_sv_undef'},'SvRV_set' => {'text' => 'Set the value of the RV pointer in sv to val.  See C<SvIV_set>.

	void	SvRV_set(SV* sv, SV* val)','name' => 'SvRV_set'},'hv_iterkeysv' => {'text' => 'Returns the key as an C<SV*> from the current position of the hash
iterator.  The return value will always be a mortal copy of the key.  Also
see C<hv_iterinit>.

	SV*	hv_iterkeysv(HE* entry)','name' => 'hv_iterkeysv'},'grok_number' => {'text' => 'Recognise (or not) a number.  The type of the number is returned
(0 if unrecognised), otherwise it is a bit-ORed combination of
IS_NUMBER_IN_UV, IS_NUMBER_GREATER_THAN_UV_MAX, IS_NUMBER_NOT_INT,
IS_NUMBER_NEG, IS_NUMBER_INFINITY, IS_NUMBER_NAN (defined in perl.h).

If the value of the number can fit an in UV, it is returned in the *valuep
IS_NUMBER_IN_UV will be set to indicate that *valuep is valid, IS_NUMBER_IN_UV
will never be set unless *valuep is valid, but *valuep may have been assigned
to during processing even though IS_NUMBER_IN_UV is not set on return.
If valuep is NULL, IS_NUMBER_IN_UV will be set for the same cases as when
valuep is non-NULL, but no actual assignment (or SEGV) will occur.

IS_NUMBER_NOT_INT will be set with IS_NUMBER_IN_UV if trailing decimals were
seen (in which case *valuep gives the true value truncated to an integer), and
IS_NUMBER_NEG if the number is negative (in which case *valuep holds the
absolute value).  IS_NUMBER_IN_UV is not set if e notation was used or the
number is larger than a UV.

	int	grok_number(const char *pv, STRLEN len, UV *valuep)','name' => 'grok_number'},'SvIVx' => {'text' => 'Coerces the given SV to an integer and returns it. Guarantees to evaluate
C<sv> only once. Only use this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvIV>.

	IV	SvIVx(SV* sv)','name' => 'SvIVx'},'grok_numeric_radix' => {'text' => 'Scan and skip for a numeric decimal separator (radix).

	bool	grok_numeric_radix(const char **sp, const char *send)','name' => 'grok_numeric_radix'},'XST_mNO' => {'text' => 'Place C<&PL_sv_no> into the specified position C<pos> on the
stack.

	void	XST_mNO(int pos)','name' => 'XST_mNO'},'mPUSHp' => {'text' => 'Push a string onto the stack.  The stack must have room for this element.
The C<len> indicates the length of the string.  Does not use C<TARG>.
See also C<PUSHp>, C<mXPUSHp> and C<XPUSHp>.

	void	mPUSHp(char* str, STRLEN len)','name' => 'mPUSHp'},'av_delete' => {'text' => 'Deletes the element indexed by C<key> from the array.  Returns the
deleted element. If C<flags> equals C<G_DISCARD>, the element is freed
and null is returned.

	SV*	av_delete(AV* ar, I32 key, I32 flags)','name' => 'av_delete'},'utf8_distance' => {'text' => 'Returns the number of UTF-8 characters between the UTF-8 pointers C<a>
and C<b>.

WARNING: use only if you *know* that the pointers point inside the
same UTF-8 buffer.

	IV	utf8_distance(U8 *a, U8 *b)','name' => 'utf8_distance'},'SvPV_nomg' => {'text' => 'Like C<SvPV> but doesn\'t process magic.

	char*	SvPV_nomg(SV* sv, STRLEN len)','name' => 'SvPV_nomg'},'savepvs' => {'text' => 'Like C<savepvn>, but takes a literal string instead of a string/length pair.

	char*	savepvs(const char* s)','name' => 'savepvs'},'SvSTASH_set' => {'text' => 'Set the value of the STASH pointer in sv to val.  See C<SvIV_set>.

	void	SvSTASH_set(SV* sv, HV* val)','name' => 'SvSTASH_set'},'sv_collxfrm' => {'text' => 'Add Collate Transform magic to an SV if it doesn\'t already have it.

Any scalar variable may carry PERL_MAGIC_collxfrm magic that contains the
scalar data of the variable, but transformed to such a format that a normal
memory comparison can be used to compare the data according to the locale
settings.

	char*	sv_collxfrm(SV* sv, STRLEN* nxp)','name' => 'sv_collxfrm'},'ZeroD' => {'text' => 'Like C<Zero> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	ZeroD(void* dest, int nitems, type)','name' => 'ZeroD'},'SvUV_nomg' => {'text' => 'Like C<SvUV> but doesn\'t process magic.

	UV	SvUV_nomg(SV* sv)','name' => 'SvUV_nomg'},'SP' => {'text' => 'Stack pointer.  This is usually handled by C<xsubpp>.  See C<dSP> and
C<SPAGAIN>.','name' => 'SP'},'sv_catpvn_mg' => {'text' => 'Like C<sv_catpvn>, but also handles \'set\' magic.

	void	sv_catpvn_mg(SV *sv, const char *ptr, STRLEN len)','name' => 'sv_catpvn_mg'},'POPpx' => {'text' => 'Pops a string off the stack.

	char*	POPpx','name' => 'POPpx'},'SvSTASH' => {'text' => 'Returns the stash of the SV.

	HV*	SvSTASH(SV* sv)','name' => 'SvSTASH'},'gv_stashpvs' => {'text' => 'Like C<gv_stashpvn>, but takes a literal string instead of a string/length pair.

	HV*	gv_stashpvs(const char* name, I32 create)','name' => 'gv_stashpvs'},'Zero' => {'text' => 'The XSUB-writer\'s interface to the C C<memzero> function.  The C<dest> is the
destination, C<nitems> is the number of items, and C<type> is the type.

	void	Zero(void* dest, int nitems, type)','name' => 'Zero'},'PL_modglobal' => {'text' => 'C<PL_modglobal> is a general purpose, interpreter global HV for use by
extensions that need to keep information on a per-interpreter basis.
In a pinch, it can also be used as a symbol table for extensions
to share data among each other.  It is a good idea to use keys
prefixed by the package name of the extension that owns the data.

	HV*	PL_modglobal','name' => 'PL_modglobal'},'sv_setpvs' => {'text' => 'Like C<sv_setpvn>, but takes a literal string instead of a string/length pair.

	void	sv_setpvs(SV* sv, const char* s)','name' => 'sv_setpvs'},'XSRETURN_UNDEF' => {'text' => 'Return C<&PL_sv_undef> from an XSUB immediately.  Uses C<XST_mUNDEF>.

		XSRETURN_UNDEF;','name' => 'XSRETURN_UNDEF'},'sv_iv' => {'text' => 'A private implementation of the C<SvIVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	IV	sv_iv(SV* sv)','name' => 'sv_iv'},'pv_escape' => {'text' => 'Escapes at most the first "count" chars of pv and puts the results into
dsv such that the size of the escaped string will not exceed "max" chars
and will not contain any incomplete escape sequences.

If flags contains PERL_PV_ESCAPE_QUOTE then any double quotes in the string
will also be escaped.

Normally the SV will be cleared before the escaped string is prepared,
but when PERL_PV_ESCAPE_NOCLEAR is set this will not occur.

If PERL_PV_ESCAPE_UNI is set then the input string is treated as Unicode,
if PERL_PV_ESCAPE_UNI_DETECT is set then the input string is scanned
using C<is_utf8_string()> to determine if it is Unicode.

If PERL_PV_ESCAPE_ALL is set then all input chars will be output
using C<\\x01F1> style escapes, otherwise only chars above 255 will be
escaped using this style, other non printable chars will use octal or
common escaped patterns like C<\\n>. If PERL_PV_ESCAPE_NOBACKSLASH
then all chars below 255 will be treated as printable and 
will be output as literals.

If PERL_PV_ESCAPE_FIRSTCHAR is set then only the first char of the
string will be escaped, regardles of max. If the string is utf8 and 
the chars value is >255 then it will be returned as a plain hex 
sequence. Thus the output will either be a single char, 
an octal escape sequence, a special escape like C<\\n> or a 3 or 
more digit hex value. 

Returns a pointer to the escaped text as held by dsv.

	char*	pv_escape(SV *dsv, char const * const str, const STRLEN count, const STRLEN max, STRLEN * const escaped, const U32 flags)','name' => 'pv_escape'},'HeSVKEY_force' => {'text' => 'Returns the key as an C<SV*>.  Will create and return a temporary mortal
C<SV*> if the hash entry contains only a C<char*> key.

	SV*	HeSVKEY_force(HE* he)','name' => 'HeSVKEY_force'},'newRV_inc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original SV is
incremented.

	SV*	newRV_inc(SV* sv)','name' => 'newRV_inc'},'SVt_PVCV' => {'text' => 'Type flag for code refs.  See C<svtype>.','name' => 'SVt_PVCV'},'sv_setpviv_mg' => {'text' => 'Like C<sv_setpviv>, but also handles \'set\' magic.

	void	sv_setpviv_mg(SV *sv, IV iv)','name' => 'sv_setpviv_mg'},'SvUVx' => {'text' => 'Coerces the given SV to an unsigned integer and returns it. Guarantees to
C<sv> only once. Only use this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvUV>.

	UV	SvUVx(SV* sv)','name' => 'SvUVx'},'SvROK_on' => {'text' => 'Tells an SV that it is an RV.

	void	SvROK_on(SV* sv)','name' => 'SvROK_on'},'sv_2bool' => {'text' => 'This function is only called on magical items, and is only used by
sv_true() or its macro equivalent.

	bool	sv_2bool(SV* sv)','name' => 'sv_2bool'},'G_VOID' => {'text' => 'Used to indicate void context.  See C<GIMME_V> and L<perlcall>.','name' => 'G_VOID'},'dORIGMARK' => {'text' => 'Saves the original stack mark for the XSUB.  See C<ORIGMARK>.

		dORIGMARK;','name' => 'dORIGMARK'},'sv_newmortal' => {'text' => 'Creates a new null SV which is mortal.  The reference count of the SV is
set to 1. It will be destroyed "soon", either by an explicit call to
FREETMPS, or by an implicit call at places such as statement boundaries.
See also C<sv_mortalcopy> and C<sv_2mortal>.

	SV*	sv_newmortal()','name' => 'sv_newmortal'},'sv_clear' => {'text' => 'Clear an SV: call any destructors, free up any memory used by the body,
and free the body itself. The SV\'s head is I<not> freed, although
its type is set to all 1\'s so that it won\'t inadvertently be assumed
to be live during global destruction etc.
This function should only be called when REFCNT is zero. Most of the time
you\'ll want to call C<sv_free()> (or its macro wrapper C<SvREFCNT_dec>)
instead.

	void	sv_clear(SV* sv)','name' => 'sv_clear'},'SvOOK' => {'text' => 'Returns a U32 indicating whether the SvIVX is a valid offset value for
the SvPVX.  This hack is used internally to speed up removal of characters
from the beginning of a SvPV.  When SvOOK is true, then the start of the
allocated string buffer is really (SvPVX - SvIVX).

	U32	SvOOK(SV* sv)','name' => 'SvOOK'},'SvPV_set' => {'text' => 'Set the value of the PV pointer in sv to val.  See C<SvIV_set>.

	void	SvPV_set(SV* sv, char* val)','name' => 'SvPV_set'},'XSRETURN_NV' => {'text' => 'Return a double from an XSUB immediately.  Uses C<XST_mNV>.

	void	XSRETURN_NV(NV nv)','name' => 'XSRETURN_NV'},'svtype' => {'text' => 'An enum of flags for Perl types.  These are found in the file B<sv.h>
in the C<svtype> enum.  Test these flags with the C<SvTYPE> macro.','name' => 'svtype'},'load_module' => {'text' => 'Loads the module whose name is pointed to by the string part of name.
Note that the actual module name, not its filename, should be given.
Eg, "Foo::Bar" instead of "Foo/Bar.pm".  flags can be any of
PERL_LOADMOD_DENY, PERL_LOADMOD_NOIMPORT, or PERL_LOADMOD_IMPORT_OPS
(or 0 for no flags). ver, if specified, provides version semantics
similar to C<use Foo::Bar VERSION>.  The optional trailing SV*
arguments can be used to specify arguments to the module\'s import()
method, similar to C<use Foo::Bar VERSION LIST>.

	void	load_module(U32 flags, SV* name, SV* ver, ...)','name' => 'load_module'},'get_hv' => {'text' => 'Returns the HV of the specified Perl hash.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	HV*	get_hv(const char* name, I32 create)','name' => 'get_hv'},'hv_clear' => {'text' => 'Clears a hash, making it empty.

	void	hv_clear(HV* tb)','name' => 'hv_clear'},'PoisonNew' => {'text' => 'PoisonWith(0xAB) for catching access to allocated but uninitialized memory.

	void	PoisonNew(void* dest, int nitems, type)','name' => 'PoisonNew'},'XSRETURN_YES' => {'text' => 'Return C<&PL_sv_yes> from an XSUB immediately.  Uses C<XST_mYES>.

		XSRETURN_YES;','name' => 'XSRETURN_YES'},'sv_nv' => {'text' => 'A private implementation of the C<SvNVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	NV	sv_nv(SV* sv)','name' => 'sv_nv'},'Poison' => {'text' => 'PoisonWith(0xEF) for catching access to freed memory.

	void	Poison(void* dest, int nitems, type)','name' => 'Poison'},'Renewc' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function, with
cast.

	void	Renewc(void* ptr, int nitems, type, cast)','name' => 'Renewc'},'sv_catpvf_mg' => {'text' => 'Like C<sv_catpvf>, but also handles \'set\' magic.

	void	sv_catpvf_mg(SV *sv, const char* pat, ...)','name' => 'sv_catpvf_mg'},'PUSHu' => {'text' => 'Push an unsigned integer onto the stack.  The stack must have room for this
element.  Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG>
should be called to declare it.  Do not call multiple C<TARG>-oriented
macros to return lists from XSUB\'s - see C<mPUSHu> instead.  See also
C<XPUSHu> and C<mXPUSHu>.

	void	PUSHu(UV uv)','name' => 'PUSHu'},'get_sv' => {'text' => 'Returns the SV of the specified Perl scalar.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	SV*	get_sv(const char* name, I32 create)','name' => 'get_sv'},'SvPOK_off' => {'text' => 'Unsets the PV status of an SV.

	void	SvPOK_off(SV* sv)','name' => 'SvPOK_off'},'newSVsv' => {'text' => 'Creates a new SV which is an exact duplicate of the original SV.
(Uses C<sv_setsv>).

	SV*	newSVsv(SV* old)','name' => 'newSVsv'},'hv_magic' => {'text' => 'Adds magic to a hash.  See C<sv_magic>.

	void	hv_magic(HV* hv, GV* gv, int how)','name' => 'hv_magic'},'sv_setpv_mg' => {'text' => 'Like C<sv_setpv>, but also handles \'set\' magic.

	void	sv_setpv_mg(SV *sv, const char *ptr)','name' => 'sv_setpv_mg'},'sv_2mortal' => {'text' => 'Marks an existing SV as mortal.  The SV will be destroyed "soon", either
by an explicit call to FREETMPS, or by an implicit call at places such as
statement boundaries.  SvTEMP() is turned on which means that the SV\'s
string buffer can be "stolen" if this SV is copied. See also C<sv_newmortal>
and C<sv_mortalcopy>.

	SV*	sv_2mortal(SV* sv)','name' => 'sv_2mortal'},'XCPT_TRY_END' => {'text' => 'Ends a try block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_TRY_END'},'av_undef' => {'text' => 'Undefines the array.  Frees the memory used by the array itself.

	void	av_undef(AV* ar)','name' => 'av_undef'},'HeKEY' => {'text' => 'Returns the actual pointer stored in the key slot of the hash entry. The
pointer may be either C<char*> or C<SV*>, depending on the value of
C<HeKLEN()>.  Can be assigned to.  The C<HePV()> or C<HeSVKEY()> macros are
usually preferable for finding the value of a key.

	void*	HeKEY(HE* he)','name' => 'HeKEY'},'pack_cat' => {'text' => 'The engine implementing pack() Perl function. Note: parameters next_in_list and
flags are not used. This call should not be used; use packlist instead.

	void	pack_cat(SV *cat, char *pat, char *patend, SV **beglist, SV **endlist, SV ***next_in_list, U32 flags)','name' => 'pack_cat'},'sv_cmp' => {'text' => 'Compares the strings in two SVs.  Returns -1, 0, or 1 indicating whether the
string in C<sv1> is less than, equal to, or greater than the string in
C<sv2>. Is UTF-8 and \'use bytes\' aware, handles get magic, and will
coerce its args to strings if necessary.  See also C<sv_cmp_locale>.

	I32	sv_cmp(SV* sv1, SV* sv2)','name' => 'sv_cmp'},'SvEND' => {'text' => 'Returns a pointer to the last character in the string which is in the SV.
See C<SvCUR>.  Access the character as *(SvEND(sv)).

	char*	SvEND(SV* sv)','name' => 'SvEND'},'mg_free' => {'text' => 'Free any magic storage used by the SV.  See C<sv_magic>.

	int	mg_free(SV* sv)','name' => 'mg_free'},'GIMME_V' => {'text' => 'The XSUB-writer\'s equivalent to Perl\'s C<wantarray>.  Returns C<G_VOID>,
C<G_SCALAR> or C<G_ARRAY> for void, scalar or list context,
respectively.

	U32	GIMME_V','name' => 'GIMME_V'},'sv_force_normal_flags' => {'text' => 'Undo various types of fakery on an SV: if the PV is a shared string, make
a private copy; if we\'re a ref, stop refing; if we\'re a glob, downgrade to
an xpvmg. The C<flags> parameter gets passed to  C<sv_unref_flags()>
when unrefing. C<sv_force_normal> calls this function with flags set to 0.

	void	sv_force_normal_flags(SV *sv, U32 flags)','name' => 'sv_force_normal_flags'},'sv_setsv_flags' => {'text' => 'Copies the contents of the source SV C<ssv> into the destination SV
C<dsv>.  The source SV may be destroyed if it is mortal, so don\'t use this
function if the source SV needs to be reused. Does not handle \'set\' magic.
Loosely speaking, it performs a copy-by-value, obliterating any previous
content of the destination.
If the C<flags> parameter has the C<SV_GMAGIC> bit set, will C<mg_get> on
C<ssv> if appropriate, else not. If the C<flags> parameter has the
C<NOSTEAL> bit set then the buffers of temps will not be stolen. <sv_setsv>
and C<sv_setsv_nomg> are implemented in terms of this function.

You probably want to use one of the assortment of wrappers, such as
C<SvSetSV>, C<SvSetSV_nosteal>, C<SvSetMagicSV> and
C<SvSetMagicSV_nosteal>.

This is the primary function for copying scalars, and most other
copy-ish functions and macros use this underneath.

	void	sv_setsv_flags(SV* dsv, SV* ssv, I32 flags)','name' => 'sv_setsv_flags'},'is_utf8_char' => {'text' => 'Tests if some arbitrary number of bytes begins in a valid UTF-8
character.  Note that an INVARIANT (i.e. ASCII) character is a valid
UTF-8 character.  The actual number of bytes in the UTF-8 character
will be returned if it is valid, otherwise 0.

	STRLEN	is_utf8_char(U8 *p)','name' => 'is_utf8_char'},'Copy' => {'text' => 'The XSUB-writer\'s interface to the C C<memcpy> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and C<type> is
the type.  May fail on overlapping copies.  See also C<Move>.

	void	Copy(void* src, void* dest, int nitems, type)','name' => 'Copy'},'sv_taint' => {'text' => 'Taint an SV. Use C<SvTAINTED_on> instead.
	void	sv_taint(SV* sv)','name' => 'sv_taint'},'SvNOK_off' => {'text' => 'Unsets the NV status of an SV.

	void	SvNOK_off(SV* sv)','name' => 'SvNOK_off'},'sv_utf8_upgrade' => {'text' => 'Converts the PV of an SV to its UTF-8-encoded form.
Forces the SV to string form if it is not already.
Always sets the SvUTF8 flag to avoid future validity checks even
if all the bytes have hibit clear.

This is not as a general purpose byte encoding to Unicode interface:
use the Encode extension for that.

	STRLEN	sv_utf8_upgrade(SV *sv)','name' => 'sv_utf8_upgrade'},'SvIOK_notUV' => {'text' => 'Returns a boolean indicating whether the SV contains a signed integer.

	bool	SvIOK_notUV(SV* sv)','name' => 'SvIOK_notUV'},'dXSARGS' => {'text' => 'Sets up stack and mark pointers for an XSUB, calling dSP and dMARK.
Sets up the C<ax> and C<items> variables by calling C<dAX> and C<dITEMS>.
This is usually handled automatically by C<xsubpp>.

		dXSARGS;','name' => 'dXSARGS'},'savesharedpv' => {'text' => 'A version of C<savepv()> which allocates the duplicate string in memory
which is shared between threads.

	char*	savesharedpv(const char* pv)','name' => 'savesharedpv'},'isSPACE' => {'text' => 'Returns a boolean indicating whether the C C<char> is whitespace.

	bool	isSPACE(char ch)','name' => 'isSPACE'},'Safefree' => {'text' => 'The XSUB-writer\'s interface to the C C<free> function.

	void	Safefree(void* ptr)','name' => 'Safefree'},'gv_stashpvn' => {'text' => 'Returns a pointer to the stash for a specified package.  The C<namelen>
parameter indicates the length of the C<name>, in bytes.  C<flags> is passed
to C<gv_fetchpvn_flags()>, so if set to C<GV_ADD> then the package will be
created if it does not already exist.  If the package does not exist and
C<flags> is 0 (or any other setting that does not create packages) then NULL
is returned.


	HV*	gv_stashpvn(const char* name, U32 namelen, I32 flags)','name' => 'gv_stashpvn'},'mPUSHu' => {'text' => 'Push an unsigned integer onto the stack.  The stack must have room for this
element.  Does not use C<TARG>.  See also C<PUSHu>, C<mXPUSHu> and C<XPUSHu>.

	void	mPUSHu(UV uv)','name' => 'mPUSHu'},'newSV_type' => {'text' => 'Creates a new SV, of the type specified.  The reference count for the new SV
is set to 1.

	SV*	newSV_type(svtype type)','name' => 'newSV_type'},'sv_setsv_nomg' => {'text' => 'Like C<sv_setsv> but doesn\'t process magic.

	void	sv_setsv_nomg(SV* dsv, SV* ssv)','name' => 'sv_setsv_nomg'},'SvREFCNT_inc_void_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the return
value, and you know that I<sv> is not NULL.  The macro doesn\'t need
to return a meaningful value, or check for NULLness, so it\'s smaller
and faster.

	void	SvREFCNT_inc_void_NN(SV* sv)','name' => 'SvREFCNT_inc_void_NN'},'Perl_signbit' => {'text' => 'Return a non-zero integer if the sign bit on an NV is set, and 0 if
it is not.  

If Configure detects this system has a signbit() that will work with
our NVs, then we just use it via the #define in perl.h.  Otherwise,
fall back on this implementation.  As a first pass, this gets everything
right except -0.0.  Alas, catching -0.0 is the main use for this function,
so this is not too helpful yet.  Still, at least we have the scaffolding
in place to support other systems, should that prove useful.


Configure notes:  This function is called \'Perl_signbit\' instead of a
plain \'signbit\' because it is easy to imagine a system having a signbit()
function or macro that doesn\'t happen to work with our particular choice
of NVs.  We shouldn\'t just re-#define signbit as Perl_signbit and expect
the standard system headers to be happy.  Also, this is a no-context
function (no pTHX_) because Perl_signbit() is usually re-#defined in
perl.h as a simple macro call to the system\'s signbit().
Users should just always call Perl_signbit().

NOTE: this function is experimental and may change or be
removed without notice.

	int	Perl_signbit(NV f)','name' => 'Perl_signbit'},'av_create_and_push' => {'text' => 'Push an SV onto the end of the array, creating the array if necessary.
A small internal helper function to remove a commonly duplicated idiom.

NOTE: this function is experimental and may change or be
removed without notice.

	void	av_create_and_push(AV **const avp, SV *const val)','name' => 'av_create_and_push'},'PUSH_MULTICALL' => {'text' => 'Opening bracket for a lightweight callback.
See L<perlcall/Lightweight Callbacks>.

		PUSH_MULTICALL;','name' => 'PUSH_MULTICALL'},'XPUSHp' => {'text' => 'Push a string onto the stack, extending the stack if necessary.  The C<len>
indicates the length of the string.  Handles \'set\' magic.  Uses C<TARG>, so
C<dTARGET> or C<dXSTARG> should be called to declare it.  Do not call
multiple C<TARG>-oriented macros to return lists from XSUB\'s - see
C<mXPUSHp> instead.  See also C<PUSHp> and C<mPUSHp>.

	void	XPUSHp(char* str, STRLEN len)','name' => 'XPUSHp'},'sv_utf8_encode' => {'text' => 'Converts the PV of an SV to UTF-8, but then turns the C<SvUTF8>
flag off so that it looks like octets again.

	void	sv_utf8_encode(SV *sv)','name' => 'sv_utf8_encode'},'SvUTF8_on' => {'text' => 'Turn on the UTF-8 status of an SV (the data is not changed, just the flag).
Do not use frivolously.

	void	SvUTF8_on(SV *sv)','name' => 'SvUTF8_on'},'sv_setpvn_mg' => {'text' => 'Like C<sv_setpvn>, but also handles \'set\' magic.

	void	sv_setpvn_mg(SV *sv, const char *ptr, STRLEN len)','name' => 'sv_setpvn_mg'},'toLOWER' => {'text' => 'Converts the specified character to lowercase.

	char	toLOWER(char ch)','name' => 'toLOWER'},'POPp' => {'text' => 'Pops a string off the stack. Deprecated. New code should use POPpx.

	char*	POPp','name' => 'POPp'},'SvIV_nomg' => {'text' => 'Like C<SvIV> but doesn\'t process magic.

	IV	SvIV_nomg(SV* sv)','name' => 'SvIV_nomg'},'RETVAL' => {'text' => 'Variable which is setup by C<xsubpp> to hold the return value for an 
XSUB. This is always the proper type for the XSUB. See 
L<perlxs/"The RETVAL Variable">.

	(whatever)	RETVAL','name' => 'RETVAL'},'HeSVKEY' => {'text' => 'Returns the key as an C<SV*>, or C<NULL> if the hash entry does not
contain an C<SV*> key.

	SV*	HeSVKEY(HE* he)','name' => 'HeSVKEY'},'sv_pvbyten' => {'text' => 'A private implementation of the C<SvPVbyte> macro for compilers
which can\'t cope with complex macro expressions. Always use the macro
instead.

	char*	sv_pvbyten(SV *sv, STRLEN *len)','name' => 'sv_pvbyten'},'Nullav' => {'text' => 'Null AV pointer.','name' => 'Nullav'},'sv_copypv' => {'text' => 'Copies a stringified representation of the source SV into the
destination SV.  Automatically performs any necessary mg_get and
coercion of numeric values into strings.  Guaranteed to preserve
UTF8 flag even from overloaded objects.  Similar in nature to
sv_2pv[_flags] but operates directly on an SV instead of just the
string.  Mostly uses sv_2pv_flags to do its work, except when that
would lose the UTF-8\'ness of the PV.

	void	sv_copypv(SV* dsv, SV* ssv)','name' => 'sv_copypv'},'sv_pv' => {'text' => 'Use the C<SvPV_nolen> macro instead

	char*	sv_pv(SV *sv)','name' => 'sv_pv'},'pv_pretty' => {'text' => 'Converts a string into something presentable, handling escaping via
pv_escape() and supporting quoting and elipses. 

If the PERL_PV_PRETTY_QUOTE flag is set then the result will be 
double quoted with any double quotes in the string escaped. Otherwise
if the PERL_PV_PRETTY_LTGT flag is set then the result be wrapped in
angle brackets. 
           
If the PERL_PV_PRETTY_ELIPSES flag is set and not all characters in
string were output then an elipses C<...> will be appended to the 
string. Note that this happens AFTER it has been quoted.
           
If start_color is non-null then it will be inserted after the opening
quote (if there is one) but before the escaped text. If end_color
is non-null then it will be inserted after the escaped text but before
any quotes or elipses.

Returns a pointer to the prettified text as held by dsv.
           
	char*	pv_pretty(SV *dsv, char const * const str, const STRLEN count, const STRLEN max, char const * const start_color, char const * const end_color, const U32 flags)','name' => 'pv_pretty'},'sv_setnv_mg' => {'text' => 'Like C<sv_setnv>, but also handles \'set\' magic.

	void	sv_setnv_mg(SV *sv, NV num)','name' => 'sv_setnv_mg'},'hv_iternextsv' => {'text' => 'Performs an C<hv_iternext>, C<hv_iterkey>, and C<hv_iterval> in one
operation.

	SV*	hv_iternextsv(HV* hv, char** key, I32* retlen)','name' => 'hv_iternextsv'},'utf8_to_bytes' => {'text' => 'Converts a string C<s> of length C<len> from UTF-8 into byte encoding.
Unlike C<bytes_to_utf8>, this over-writes the original string, and
updates len to contain the new length.
Returns zero on failure, setting C<len> to -1.

If you need a copy of the string, see C<bytes_from_utf8>.

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	utf8_to_bytes(U8 *s, STRLEN *len)','name' => 'utf8_to_bytes'},'sv_pvbyten_force' => {'text' => 'The backend for the C<SvPVbytex_force> macro. Always use the macro instead.

	char*	sv_pvbyten_force(SV* sv, STRLEN* lp)','name' => 'sv_pvbyten_force'},'uvuni_to_utf8_flags' => {'text' => 'Adds the UTF-8 representation of the Unicode codepoint C<uv> to the end
of the string C<d>; C<d> should be have at least C<UTF8_MAXBYTES+1> free
bytes available. The return value is the pointer to the byte after the
end of the new character. In other words,

    d = uvuni_to_utf8_flags(d, uv, flags);

or, in most cases,

    d = uvuni_to_utf8(d, uv);

(which is equivalent to)

    d = uvuni_to_utf8_flags(d, uv, 0);

is the recommended Unicode-aware way of saying

    *(d++) = uv;

	U8*	uvuni_to_utf8_flags(U8 *d, UV uv, UV flags)','name' => 'uvuni_to_utf8_flags'},'XST_mIV' => {'text' => 'Place an integer into the specified position C<pos> on the stack.  The
value is stored in a new mortal SV.

	void	XST_mIV(int pos, IV iv)','name' => 'XST_mIV'},'mPUSHs' => {'text' => 'Push an SV onto the stack and mortalizes the SV.  The stack must have room
for this element.  Does not use C<TARG>.  See also C<PUSHs> and C<mXPUSHs>.

	void	mPUSHs(SV* sv)','name' => 'mPUSHs'},'G_DISCARD' => {'text' => 'Indicates that arguments returned from a callback should be discarded.  See
L<perlcall>.','name' => 'G_DISCARD'},'GvSV' => {'text' => 'Return the SV from the GV.

	SV*	GvSV(GV* gv)','name' => 'GvSV'},'XST_mNV' => {'text' => 'Place a double into the specified position C<pos> on the stack.  The value
is stored in a new mortal SV.

	void	XST_mNV(int pos, NV nv)','name' => 'XST_mNV'},'UNDERBAR' => {'text' => 'The SV* corresponding to the $_ variable. Works even if there
is a lexical $_ in scope. (Lexical $_ is available in perl 5.9.2 and later)','name' => 'UNDERBAR'},'pad_sv' => {'text' => 'Get the value at offset po in the current pad.
Use macro PAD_SV instead of calling this function directly.

	SV*	pad_sv(PADOFFSET po)','name' => 'pad_sv'},'POPi' => {'text' => 'Pops an integer off the stack.

	IV	POPi','name' => 'POPi'},'SvPVutf8_force' => {'text' => 'Like C<SvPV_force>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8_force(SV* sv, STRLEN len)','name' => 'SvPVutf8_force'},'sv_2pvutf8_nolen' => {'text' => 'Return a pointer to the UTF-8-encoded representation of the SV.
May cause the SV to be upgraded to UTF-8 as a side-effect.

Usually accessed via the C<SvPVutf8_nolen> macro.

	char*	sv_2pvutf8_nolen(SV* sv)','name' => 'sv_2pvutf8_nolen'},'SVt_NV' => {'text' => 'Double type flag for scalars.  See C<svtype>.','name' => 'SVt_NV'},'av_store' => {'text' => 'Stores an SV in an array.  The array index is specified as C<key>.  The
return value will be NULL if the operation failed or if the value did not
need to be actually stored within the array (as in the case of tied
arrays). Otherwise it can be dereferenced to get the original C<SV*>.  Note
that the caller is responsible for suitably incrementing the reference
count of C<val> before the call, and decrementing it if the function
returned NULL.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays.

	SV**	av_store(AV* ar, I32 key, SV* val)','name' => 'av_store'},'SvPVbytex' => {'text' => 'Like C<SvPV>, but converts sv to byte representation first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVbyte>
otherwise.

	char*	SvPVbytex(SV* sv, STRLEN len)','name' => 'SvPVbytex'},'PUSHMARK' => {'text' => 'Opening bracket for arguments on a callback.  See C<PUTBACK> and
L<perlcall>.

	void	PUSHMARK(SP)','name' => 'PUSHMARK'},'ST' => {'text' => 'Used to access elements on the XSUB\'s stack.

	SV*	ST(int ix)','name' => 'ST'},'call_pv' => {'text' => 'Performs a callback to the specified Perl sub.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_pv(const char* sub_name, I32 flags)','name' => 'call_pv'},'av_fetch' => {'text' => 'Returns the SV at the specified index in the array.  The C<key> is the
index.  If C<lval> is set then the fetch will be part of a store.  Check
that the return value is non-null before dereferencing it to a C<SV*>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays. 

	SV**	av_fetch(AV* ar, I32 key, I32 lval)','name' => 'av_fetch'},'gv_fetchmeth_autoload' => {'text' => 'Same as gv_fetchmeth(), but looks for autoloaded subroutines too.
Returns a glob for the subroutine.

For an autoloaded subroutine without a GV, will create a GV even
if C<level < 0>.  For an autoloaded subroutine without a stub, GvCV()
of the result may be zero.

	GV*	gv_fetchmeth_autoload(HV* stash, const char* name, STRLEN len, I32 level)','name' => 'gv_fetchmeth_autoload'},'SvNOK_only' => {'text' => 'Tells an SV that it is a double and disables all other OK bits.

	void	SvNOK_only(SV* sv)','name' => 'SvNOK_only'},'hv_iterval' => {'text' => 'Returns the value from the current position of the hash iterator.  See
C<hv_iterkey>.

	SV*	hv_iterval(HV* tb, HE* entry)','name' => 'hv_iterval'},'sv_reftype' => {'text' => 'Returns a string describing what the SV is a reference to.

	char*	sv_reftype(SV* sv, int ob)','name' => 'sv_reftype'},'sv_pos_b2u' => {'text' => 'Converts the value pointed to by offsetp from a count of bytes from the
start of the string, to a count of the equivalent number of UTF-8 chars.
Handles magic and type coercion.

	void	sv_pos_b2u(SV* sv, I32* offsetp)','name' => 'sv_pos_b2u'},'SvREFCNT_inc_simple_void_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the return
value, and you know that I<sv> is not NULL.  The macro doesn\'t need
to return a meaningful value, or check for NULLness, so it\'s smaller
and faster.

	void	SvREFCNT_inc_simple_void_NN(SV* sv)','name' => 'SvREFCNT_inc_simple_void_NN'},'av_len' => {'text' => 'Returns the highest index in the array.  The number of elements in the
array is C<av_len(av) + 1>.  Returns -1 if the array is empty.

	I32	av_len(AV* ar)','name' => 'av_len'},'SVt_IV' => {'text' => 'Integer type flag for scalars.  See C<svtype>.','name' => 'SVt_IV'},'SvIsCOW' => {'text' => 'Returns a boolean indicating whether the SV is Copy-On-Write. (either shared
hash key scalars, or full Copy On Write scalars if 5.9.0 is configured for
COW)

	bool	SvIsCOW(SV* sv)','name' => 'SvIsCOW'},'sv_unmagic' => {'text' => 'Removes all magic of type C<type> from an SV.

	int	sv_unmagic(SV* sv, int type)','name' => 'sv_unmagic'},'SvTAINT' => {'text' => 'Taints an SV if tainting is enabled.

	void	SvTAINT(SV* sv)','name' => 'SvTAINT'},'sv_catsv' => {'text' => 'Concatenates the string from SV C<ssv> onto the end of the string in
SV C<dsv>.  Modifies C<dsv> but not C<ssv>.  Handles \'get\' magic, but
not \'set\' magic.  See C<sv_catsv_mg>.

	void	sv_catsv(SV* dsv, SV* ssv)','name' => 'sv_catsv'},'SvPOK_on' => {'text' => 'Tells an SV that it is a string.

	void	SvPOK_on(SV* sv)','name' => 'SvPOK_on'},'ax' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the stack base offset,
used by the C<ST>, C<XSprePUSH> and C<XSRETURN> macros.  The C<dMARK> macro
must be called prior to setup the C<MARK> variable.

	I32	ax','name' => 'ax'},'mg_clear' => {'text' => 'Clear something magical that the SV represents.  See C<sv_magic>.

	int	mg_clear(SV* sv)','name' => 'mg_clear'},'my_sprintf' => {'text' => 'The C library C<sprintf>, wrapped if necessary, to ensure that it will return
the length of the string written to the buffer. Only rare pre-ANSI systems
need the wrapper function - usually this is a direct call to C<sprintf>.

	int	my_sprintf(char *buffer, const char *pat, ...)','name' => 'my_sprintf'},'to_utf8_fold' => {'text' => 'Convert the UTF-8 encoded character at p to its foldcase version and
store that in UTF-8 in ustrp and its length in bytes in lenp.  Note
that the ustrp needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
foldcase version may be longer than the original character (up to
three characters).

The first character of the foldcased version is returned
(but note, as explained above, that there may be more.)

	UV	to_utf8_fold(U8 *p, U8* ustrp, STRLEN *lenp)','name' => 'to_utf8_fold'},'to_utf8_upper' => {'text' => 'Convert the UTF-8 encoded character at p to its uppercase version and
store that in UTF-8 in ustrp and its length in bytes in lenp.  Note
that the ustrp needs to be at least UTF8_MAXBYTES_CASE+1 bytes since
the uppercase version may be longer than the original character.

The first character of the uppercased version is returned
(but note, as explained above, that there may be more.)

	UV	to_utf8_upper(U8 *p, U8* ustrp, STRLEN *lenp)','name' => 'to_utf8_upper'},'gv_stashpv' => {'text' => 'Returns a pointer to the stash for a specified package.  Uses C<strlen> to
determine the length of C<name>, then calls C<gv_stashpvn()>.

	HV*	gv_stashpv(const char* name, I32 flags)','name' => 'gv_stashpv'},'SvPVutf8x_force' => {'text' => 'Like C<SvPV_force>, but converts sv to utf8 first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVutf8_force>
otherwise.

	char*	SvPVutf8x_force(SV* sv, STRLEN len)','name' => 'SvPVutf8x_force'},'sv_vcatpvf_mg' => {'text' => 'Like C<sv_vcatpvf>, but also handles \'set\' magic.

Usually used via its frontend C<sv_catpvf_mg>.

	void	sv_vcatpvf_mg(SV* sv, const char* pat, va_list* args)','name' => 'sv_vcatpvf_mg'},'PUSHi' => {'text' => 'Push an integer onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to 
return lists from XSUB\'s - see C<mPUSHi> instead.  See also C<XPUSHi> and
C<mXPUSHi>.

	void	PUSHi(IV iv)','name' => 'PUSHi'},'mXPUSHu' => {'text' => 'Push an unsigned integer onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHu>, C<mPUSHu> and C<PUSHu>.

	void	mXPUSHu(UV uv)','name' => 'mXPUSHu'},'hv_exists_ent' => {'text' => 'Returns a boolean indicating whether the specified hash key exists. C<hash>
can be a valid precomputed hash value, or 0 to ask for it to be
computed.

	bool	hv_exists_ent(HV* tb, SV* key, U32 hash)','name' => 'hv_exists_ent'},'SvLEN_set' => {'text' => 'Set the actual length of the string which is in the SV.  See C<SvIV_set>.

	void	SvLEN_set(SV* sv, STRLEN len)','name' => 'SvLEN_set'},'to_utf8_lower' => {'text' => 'Convert the UTF-8 encoded character at p to its lowercase version and
store that in UTF-8 in ustrp and its length in bytes in lenp.  Note
that the ustrp needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
lowercase version may be longer than the original character.

The first character of the lowercased version is returned
(but note, as explained above, that there may be more.)

	UV	to_utf8_lower(U8 *p, U8* ustrp, STRLEN *lenp)','name' => 'to_utf8_lower'},'SvNIOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a number, integer or
double.

	U32	SvNIOK(SV* sv)','name' => 'SvNIOK'},'unpack_str' => {'text' => 'The engine implementing unpack() Perl function. Note: parameters strbeg, new_s
and ocnt are not used. This call should not be used, use unpackstring instead.

	I32	unpack_str(char *pat, char *patend, char *s, char *strbeg, char *strend, char **new_s, I32 ocnt, U32 flags)','name' => 'unpack_str'},'newSVpvf' => {'text' => 'Creates a new SV and initializes it with the string formatted like
C<sprintf>.

	SV*	newSVpvf(const char* pat, ...)','name' => 'newSVpvf'},'Newxc' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function, with
cast.  See also C<Newx>.

	void	Newxc(void* ptr, int nitems, type, cast)','name' => 'Newxc'},'sv_newref' => {'text' => 'Increment an SV\'s reference count. Use the C<SvREFCNT_inc()> wrapper
instead.

	SV*	sv_newref(SV* sv)','name' => 'sv_newref'},'perl_destruct' => {'text' => 'Shuts down a Perl interpreter.  See L<perlembed>.

	int	perl_destruct(PerlInterpreter* interp)','name' => 'perl_destruct'},'XSRETURN_IV' => {'text' => 'Return an integer from an XSUB immediately.  Uses C<XST_mIV>.

	void	XSRETURN_IV(IV iv)','name' => 'XSRETURN_IV'},'SvIVX' => {'text' => 'Returns the raw value in the SV\'s IV slot, without checks or conversions.
Only use when you are sure SvIOK is true. See also C<SvIV()>.

	IV	SvIVX(SV* sv)','name' => 'SvIVX'},'sv_uni_display' => {'text' => 'Build to the scalar dsv a displayable version of the scalar sv,
the displayable version being at most pvlim bytes long
(if longer, the rest is truncated and "..." will be appended).

The flags argument is as in pv_uni_display().

The pointer to the PV of the dsv is returned.

	char*	sv_uni_display(SV *dsv, SV *ssv, STRLEN pvlim, UV flags)','name' => 'sv_uni_display'},'newSVpvs' => {'text' => 'Like C<newSVpvn>, but takes a literal string instead of a string/length pair.

	SV*	newSVpvs(const char* s)','name' => 'newSVpvs'},'sv_vsetpvf' => {'text' => 'Works like C<sv_vcatpvf> but copies the text into the SV instead of
appending it.  Does not handle \'set\' magic.  See C<sv_vsetpvf_mg>.

Usually used via its frontend C<sv_setpvf>.

	void	sv_vsetpvf(SV* sv, const char* pat, va_list* args)','name' => 'sv_vsetpvf'},'SvREFCNT_dec' => {'text' => 'Decrements the reference count of the given SV.

	void	SvREFCNT_dec(SV* sv)','name' => 'SvREFCNT_dec'},'XCPT_CATCH' => {'text' => 'Introduces a catch block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_CATCH'},'XST_mYES' => {'text' => 'Place C<&PL_sv_yes> into the specified position C<pos> on the
stack.

	void	XST_mYES(int pos)','name' => 'XST_mYES'},'SvIOK_off' => {'text' => 'Unsets the IV status of an SV.

	void	SvIOK_off(SV* sv)','name' => 'SvIOK_off'},'sv_setsv' => {'text' => 'Copies the contents of the source SV C<ssv> into the destination SV
C<dsv>.  The source SV may be destroyed if it is mortal, so don\'t use this
function if the source SV needs to be reused. Does not handle \'set\' magic.
Loosely speaking, it performs a copy-by-value, obliterating any previous
content of the destination.

You probably want to use one of the assortment of wrappers, such as
C<SvSetSV>, C<SvSetSV_nosteal>, C<SvSetMagicSV> and
C<SvSetMagicSV_nosteal>.

	void	sv_setsv(SV* dsv, SV* ssv)','name' => 'sv_setsv'},'POPs' => {'text' => 'Pops an SV off the stack.

	SV*	POPs','name' => 'POPs'},'packlist' => {'text' => 'The engine implementing pack() Perl function.

	void	packlist(SV *cat, char *pat, char *patend, SV **beglist, SV **endlist)','name' => 'packlist'},'SvNV' => {'text' => 'Coerce the given SV to a double and return it. See C<SvNVx> for a version
which guarantees to evaluate sv only once.

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

	GV*	gv_fetchmethod_autoload(HV* stash, const char* name, I32 autoload)','name' => 'gv_fetchmethod_autoload'},'SvUTF8' => {'text' => 'Returns a U32 value indicating whether the SV contains UTF-8 encoded data.
Call this after SvPV() in case any call to string overloading updates the
internal flag.

	U32	SvUTF8(SV* sv)','name' => 'SvUTF8'},'SvTAINTED' => {'text' => 'Checks to see if an SV is tainted. Returns TRUE if it is, FALSE if
not.

	bool	SvTAINTED(SV* sv)','name' => 'SvTAINTED'},'sv_eq' => {'text' => 'Returns a boolean indicating whether the strings in the two SVs are
identical. Is UTF-8 and \'use bytes\' aware, handles get magic, and will
coerce its args to strings if necessary.

	I32	sv_eq(SV* sv1, SV* sv2)','name' => 'sv_eq'},'ix' => {'text' => 'Variable which is setup by C<xsubpp> to indicate which of an 
XSUB\'s aliases was used to invoke it.  See L<perlxs/"The ALIAS: Keyword">.

	I32	ix','name' => 'ix'},'cv_undef' => {'text' => 'Clear out all the active components of a CV. This can happen either
by an explicit C<undef &foo>, or by the reference count going to zero.
In the former case, we keep the CvOUTSIDE pointer, so that any anonymous
children can still follow the full lexical scope chain.

	void	cv_undef(CV* cv)','name' => 'cv_undef'},'StructCopy' => {'text' => 'This is an architecture-independent macro to copy one structure to another.

	void	StructCopy(type src, type dest, type)','name' => 'StructCopy'},'XSRETURN_UV' => {'text' => 'Return an integer from an XSUB immediately.  Uses C<XST_mUV>.

	void	XSRETURN_UV(IV uv)','name' => 'XSRETURN_UV'},'SvREFCNT_inc_simple' => {'text' => 'Same as SvREFCNT_inc, but can only be used with expressions without side
effects.  Since we don\'t have to store a temporary value, it\'s faster.

	SV*	SvREFCNT_inc_simple(SV* sv)','name' => 'SvREFCNT_inc_simple'},'get_cvn_flags' => {'text' => 'Returns the CV of the specified Perl subroutine.  C<flags> are passed to
C<gv_fetchpvn_flags>. If C<GV_ADD> is set and the Perl subroutine does not
exist then it will be declared (which has the same effect as saying
C<sub name;>).  If C<GV_ADD> is not set and the subroutine does not exist
then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	CV*	get_cvn_flags(const char* name, STRLEN len, I32 flags)','name' => 'get_cvn_flags'},'items' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the number of 
items on the stack.  See L<perlxs/"Variable-length Parameter Lists">.

	I32	items','name' => 'items'},'XST_mPV' => {'text' => 'Place a copy of a string into the specified position C<pos> on the stack. 
The value is stored in a new mortal SV.

	void	XST_mPV(int pos, char* str)','name' => 'XST_mPV'},'dXSI32' => {'text' => 'Sets up the C<ix> variable for an XSUB which has aliases.  This is usually
handled automatically by C<xsubpp>.

		dXSI32;','name' => 'dXSI32'},'SvPVx' => {'text' => 'A version of C<SvPV> which guarantees to evaluate C<sv> only once.
Only use this if C<sv> is an expression with side effects, otherwise use the
more efficient C<SvPVX>.

	char*	SvPVx(SV* sv, STRLEN len)','name' => 'SvPVx'},'dXCPT' => {'text' => 'Set up necessary local variables for exception handling.
See L<perlguts/"Exception Handling">.

		dXCPT;','name' => 'dXCPT'},'sv_tainted' => {'text' => 'Test an SV for taintedness. Use C<SvTAINTED> instead.
	bool	sv_tainted(SV* sv)','name' => 'sv_tainted'},'sv_grow' => {'text' => 'Expands the character buffer in the SV.  If necessary, uses C<sv_unref> and
upgrades the SV to C<SVt_PV>.  Returns a pointer to the character buffer.
Use the C<SvGROW> wrapper instead.

	char*	sv_grow(SV* sv, STRLEN newlen)','name' => 'sv_grow'},'cv_const_sv' => {'text' => 'If C<cv> is a constant sub eligible for inlining. returns the constant
value returned by the sub.  Otherwise, returns NULL.

Constant subs can be created with C<newCONSTSUB> or as described in
L<perlsub/"Constant Functions">.

	SV*	cv_const_sv(CV* cv)','name' => 'cv_const_sv'},'newSVnv' => {'text' => 'Creates a new SV and copies a floating point value into it.
The reference count for the SV is set to 1.

	SV*	newSVnv(NV n)','name' => 'newSVnv'},'XPUSHs' => {'text' => 'Push an SV onto the stack, extending the stack if necessary.  Does not
handle \'set\' magic.  Does not use C<TARG>.  See also C<XPUSHmortal>,
C<PUSHs> and C<PUSHmortal>.

	void	XPUSHs(SV* sv)','name' => 'XPUSHs'},'HeVAL' => {'text' => 'Returns the value slot (type C<SV*>) stored in the hash entry.

	SV*	HeVAL(HE* he)','name' => 'HeVAL'},'HePV' => {'text' => 'Returns the key slot of the hash entry as a C<char*> value, doing any
necessary dereferencing of possibly C<SV*> keys.  The length of the string
is placed in C<len> (this is a macro, so do I<not> use C<&len>).  If you do
not care about what the length of the key is, you may use the global
variable C<PL_na>, though this is rather less efficient than using a local
variable.  Remember though, that hash keys in perl are free to contain
embedded nulls, so using C<strlen()> or similar is not a good way to find
the length of hash keys. This is very similar to the C<SvPV()> macro
described elsewhere in this document. See also C<HeUTF8>.

If you are using C<HePV> to get values to pass to C<newSVpvn()> to create a
new SV, you should consider using C<newSVhek(HeKEY_hek(he))> as it is more
efficient.

	char*	HePV(HE* he, STRLEN len)','name' => 'HePV'},'SvGETMAGIC' => {'text' => 'Invokes C<mg_get> on an SV if it has \'get\' magic.  This macro evaluates its
argument more than once.

	void	SvGETMAGIC(SV* sv)','name' => 'SvGETMAGIC'},'pv_uni_display' => {'text' => 'Build to the scalar dsv a displayable version of the string spv,
length len, the displayable version being at most pvlim bytes long
(if longer, the rest is truncated and "..." will be appended).

The flags argument can have UNI_DISPLAY_ISPRINT set to display
isPRINT()able characters as themselves, UNI_DISPLAY_BACKSLASH
to display the \\\\[nrfta\\\\] as the backslashed versions (like \'\\n\')
(UNI_DISPLAY_BACKSLASH is preferred over UNI_DISPLAY_ISPRINT for \\\\).
UNI_DISPLAY_QQ (and its alias UNI_DISPLAY_REGEX) have both
UNI_DISPLAY_BACKSLASH and UNI_DISPLAY_ISPRINT turned on.

The pointer to the PV of the dsv is returned.

	char*	pv_uni_display(SV *dsv, U8 *spv, STRLEN len, STRLEN pvlim, UV flags)','name' => 'pv_uni_display'},'sv_inc' => {'text' => 'Auto-increment of the value in the SV, doing string to numeric conversion
if necessary. Handles \'get\' magic.

	void	sv_inc(SV* sv)','name' => 'sv_inc'},'sv_usepvn' => {'text' => 'Tells an SV to use C<ptr> to find its string value. Implemented by
calling C<sv_usepvn_flags> with C<flags> of 0, hence does not handle \'set\'
magic. See C<sv_usepvn_flags>.

	void	sv_usepvn(SV* sv, char* ptr, STRLEN len)','name' => 'sv_usepvn'},'SvPVbytex_force' => {'text' => 'Like C<SvPV_force>, but converts sv to byte representation first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVbyte_force>
otherwise.

	char*	SvPVbytex_force(SV* sv, STRLEN len)','name' => 'SvPVbytex_force'},'SvREFCNT' => {'text' => 'Returns the value of the object\'s reference count.

	U32	SvREFCNT(SV* sv)','name' => 'SvREFCNT'},'warn' => {'text' => 'This is the XSUB-writer\'s interface to Perl\'s C<warn> function.  Call this
function the same way you call the C C<printf> function.  See C<croak>.

	void	warn(const char* pat, ...)','name' => 'warn'},'hv_delete' => {'text' => 'Deletes a key/value pair in the hash.  The value SV is removed from the
hash and returned to the caller.  The C<klen> is the length of the key.
The C<flags> value will normally be zero; if set to G_DISCARD then NULL
will be returned.

	SV*	hv_delete(HV* tb, const char* key, I32 klen, I32 flags)','name' => 'hv_delete'},'POP_MULTICALL' => {'text' => 'Closing bracket for a lightweight callback.
See L<perlcall/Lightweight Callbacks>.

		POP_MULTICALL;','name' => 'POP_MULTICALL'},'sv_cat_decode' => {'text' => 'The encoding is assumed to be an Encode object, the PV of the ssv is
assumed to be octets in that encoding and decoding the input starts
from the position which (PV + *offset) pointed to.  The dsv will be
concatenated the decoded UTF-8 string from ssv.  Decoding will terminate
when the string tstr appears in decoding output or the input ends on
the PV of the ssv. The value which the offset points will be modified
to the last input position on the ssv.

Returns TRUE if the terminator was found, else returns FALSE.

	bool	sv_cat_decode(SV* dsv, SV *encoding, SV *ssv, int *offset, char* tstr, int tlen)','name' => 'sv_cat_decode'},'SvIV_set' => {'text' => 'Set the value of the IV pointer in sv to val.  It is possible to perform
the same function of this macro with an lvalue assignment to C<SvIVX>.
With future Perls, however, it will be more efficient to use 
C<SvIV_set> instead of the lvalue assignment to C<SvIVX>.

	void	SvIV_set(SV* sv, IV val)','name' => 'SvIV_set'},'sv_setiv' => {'text' => 'Copies an integer into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setiv_mg>.

	void	sv_setiv(SV* sv, IV num)','name' => 'sv_setiv'},'sv_report_used' => {'text' => 'Dump the contents of all SVs not yet freed. (Debugging aid).

	void	sv_report_used()','name' => 'sv_report_used'},'EXTEND' => {'text' => 'Used to extend the argument stack for an XSUB\'s return values. Once
used, guarantees that there is room for at least C<nitems> to be pushed
onto the stack.

	void	EXTEND(SP, int nitems)','name' => 'EXTEND'},'SvNVX' => {'text' => 'Returns the raw value in the SV\'s NV slot, without checks or conversions.
Only use when you are sure SvNOK is true. See also C<SvNV()>.

	NV	SvNVX(SV* sv)','name' => 'SvNVX'},'newSVuv' => {'text' => 'Creates a new SV and copies an unsigned integer into it.
The reference count for the SV is set to 1.

	SV*	newSVuv(UV u)','name' => 'newSVuv'},'gv_fetchmeth' => {'text' => 'Returns the glob with the given C<name> and a defined subroutine or
C<NULL>.  The glob lives in the given C<stash>, or in the stashes
accessible via @ISA and UNIVERSAL::.

The argument C<level> should be either 0 or -1.  If C<level==0>, as a
side-effect creates a glob with the given C<name> in the given C<stash>
which in the case of success contains an alias for the subroutine, and sets
up caching info for this glob.  Similarly for all the searched stashes.

This function grants C<"SUPER"> token as a postfix of the stash name. The
GV returned from C<gv_fetchmeth> may be a method cache entry, which is not
visible to Perl code.  So when calling C<call_sv>, you should not use
the GV directly; instead, you should use the method\'s CV, which can be
obtained from the GV with the C<GvCV> macro.

	GV*	gv_fetchmeth(HV* stash, const char* name, STRLEN len, I32 level)','name' => 'gv_fetchmeth'},'HeHASH' => {'text' => 'Returns the computed hash stored in the hash entry.

	U32	HeHASH(HE* he)','name' => 'HeHASH'},'SvIOK' => {'text' => 'Returns a U32 value indicating whether the SV contains an integer.

	U32	SvIOK(SV* sv)','name' => 'SvIOK'},'SvPV_force' => {'text' => 'Like C<SvPV> but will force the SV into containing just a string
(C<SvPOK_only>).  You want force if you are going to update the C<SvPVX>
directly.

	char*	SvPV_force(SV* sv, STRLEN len)','name' => 'SvPV_force'},'HeUTF8' => {'text' => 'Returns whether the C<char *> value returned by C<HePV> is encoded in UTF-8,
doing any necessary dereferencing of possibly C<SV*> keys.  The value returned
will be 0 or non-0, not necessarily 1 (or even a value with any low bits set),
so B<do not> blindly assign this to a C<bool> variable, as C<bool> may be a
typedef for C<char>.

	char*	HeUTF8(HE* he, STRLEN len)','name' => 'HeUTF8'},'SvLEN' => {'text' => 'Returns the size of the string buffer in the SV, not including any part
attributable to C<SvOOK>.  See C<SvCUR>.

	STRLEN	SvLEN(SV* sv)','name' => 'SvLEN'},'SvPOK_only_UTF8' => {'text' => 'Tells an SV that it is a string and disables all other OK bits,
and leaves the UTF-8 status as it was.

	void	SvPOK_only_UTF8(SV* sv)','name' => 'SvPOK_only_UTF8'},'mg_get' => {'text' => 'Do magic after a value is retrieved from the SV.  See C<sv_magic>.

	int	mg_get(SV* sv)','name' => 'mg_get'},'SvTRUE' => {'text' => 'Returns a boolean indicating whether Perl would evaluate the SV as true or
false, defined or undefined.  Does not handle \'get\' magic.

	bool	SvTRUE(SV* sv)','name' => 'SvTRUE'},'grok_hex' => {'text' => 'converts a string representing a hex number to numeric form.

On entry I<start> and I<*len> give the string to scan, I<*flags> gives
conversion flags, and I<result> should be NULL or a pointer to an NV.
The scan stops at the end of the string, or the first invalid character.
Unless C<PERL_SCAN_SILENT_ILLDIGIT> is set in I<*flags>, encountering an
invalid character will also trigger a warning.
On return I<*len> is set to the length of the scanned string,
and I<*flags> gives output flags.

If the value is <= UV_MAX it is returned as a UV, the output flags are clear,
and nothing is written to I<*result>. If the value is > UV_MAX C<grok_hex>
returns UV_MAX, sets C<PERL_SCAN_GREATER_THAN_UV_MAX> in the output flags,
and writes the value to I<*result> (or the value is discarded if I<result>
is NULL).

The hex number may optionally be prefixed with "0x" or "x" unless
C<PERL_SCAN_DISALLOW_PREFIX> is set in I<*flags> on entry. If
C<PERL_SCAN_ALLOW_UNDERSCORES> is set in I<*flags> then the hex
number may use \'_\' characters to separate digits.

	UV	grok_hex(char* start, STRLEN* len, I32* flags, NV *result)','name' => 'grok_hex'},'hv_iternext_flags' => {'text' => 'Returns entries from a hash iterator.  See C<hv_iterinit> and C<hv_iternext>.
The C<flags> value will normally be zero; if HV_ITERNEXT_WANTPLACEHOLDERS is
set the placeholders keys (for restricted hashes) will be returned in addition
to normal keys. By default placeholders are automatically skipped over.
Currently a placeholder is implemented with a value that is
C<&Perl_sv_placeholder>. Note that the implementation of placeholders and
restricted hashes may change, and the implementation currently is
insufficiently abstracted for any change to be tidy.

NOTE: this function is experimental and may change or be
removed without notice.

	HE*	hv_iternext_flags(HV* tb, I32 flags)','name' => 'hv_iternext_flags'},'is_utf8_string_loclen' => {'text' => 'Like is_utf8_string() but stores the location of the failure (in the
case of "utf8ness failure") or the location s+len (in the case of
"utf8ness success") in the C<ep>, and the number of UTF-8
encoded characters in the C<el>.

See also is_utf8_string_loc() and is_utf8_string().

	bool	is_utf8_string_loclen(const U8 *s, STRLEN len, const U8 **ep, STRLEN *el)','name' => 'is_utf8_string_loclen'},'call_method' => {'text' => 'Performs a callback to the specified Perl method.  The blessed object must
be on the stack.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_method(const char* methname, I32 flags)','name' => 'call_method'},'SvLOCK' => {'text' => 'Arranges for a mutual exclusion lock to be obtained on sv if a suitable module
has been loaded.

	void	SvLOCK(SV* sv)','name' => 'SvLOCK'},'sv_vsetpvfn' => {'text' => 'Works like C<sv_vcatpvfn> but copies the text into the SV instead of
appending it.

Usually used via one of its frontends C<sv_vsetpvf> and C<sv_vsetpvf_mg>.

	void	sv_vsetpvfn(SV* sv, const char* pat, STRLEN patlen, va_list* args, SV** svargs, I32 svmax, bool *maybe_tainted)','name' => 'sv_vsetpvfn'},'perl_parse' => {'text' => 'Tells a Perl interpreter to parse a Perl script.  See L<perlembed>.

	int	perl_parse(PerlInterpreter* interp, XSINIT_t xsinit, int argc, char** argv, char** env)','name' => 'perl_parse'},'to_utf8_case' => {'text' => 'The "p" contains the pointer to the UTF-8 string encoding
the character that is being converted.

The "ustrp" is a pointer to the character buffer to put the
conversion result to.  The "lenp" is a pointer to the length
of the result.

The "swashp" is a pointer to the swash to use.

Both the special and normal mappings are stored lib/unicore/To/Foo.pl,
and loaded by SWASHNEW, using lib/utf8_heavy.pl.  The special (usually,
but not always, a multicharacter mapping), is tried first.

The "special" is a string like "utf8::ToSpecLower", which means the
hash %utf8::ToSpecLower.  The access to the hash is through
Perl_to_utf8_case().

The "normal" is a string like "ToLower" which means the swash
%utf8::ToLower.

	UV	to_utf8_case(U8 *p, U8* ustrp, STRLEN *lenp, SV **swashp, char *normal, char *special)','name' => 'to_utf8_case'},'av_clear' => {'text' => 'Clears an array, making it empty.  Does not free the memory used by the
array itself.

	void	av_clear(AV* ar)','name' => 'av_clear'},'sv_force_normal' => {'text' => 'Undo various types of fakery on an SV: if the PV is a shared string, make
a private copy; if we\'re a ref, stop refing; if we\'re a glob, downgrade to
an xpvmg. See also C<sv_force_normal_flags>.

	void	sv_force_normal(SV *sv)','name' => 'sv_force_normal'},'av_unshift' => {'text' => 'Unshift the given number of C<undef> values onto the beginning of the
array.  The array will grow automatically to accommodate the addition.  You
must then use C<av_store> to assign values to these new elements.

	void	av_unshift(AV* ar, I32 num)','name' => 'av_unshift'},'SvREFCNT_inc_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you know I<sv>
is not NULL.  Since we don\'t have to check the NULLness, it\'s faster
and smaller.

	SV*	SvREFCNT_inc_NN(SV* sv)','name' => 'SvREFCNT_inc_NN'},'POPpbytex' => {'text' => 'Pops a string off the stack which must consist of bytes i.e. characters < 256.

	char*	POPpbytex','name' => 'POPpbytex'},'SvUVX' => {'text' => 'Returns the raw value in the SV\'s UV slot, without checks or conversions.
Only use when you are sure SvIOK is true. See also C<SvUV()>.

	UV	SvUVX(SV* sv)','name' => 'SvUVX'},'SvSetMagicSV' => {'text' => 'Like C<SvSetSV>, but does any set magic required afterwards.

	void	SvSetMagicSV(SV* dsb, SV* ssv)','name' => 'SvSetMagicSV'},'sv_utf8_decode' => {'text' => 'If the PV of the SV is an octet sequence in UTF-8
and contains a multiple-byte character, the C<SvUTF8> flag is turned on
so that it looks like a character. If the PV contains only single-byte
characters, the C<SvUTF8> flag stays being off.
Scans PV for validity and returns false if the PV is invalid UTF-8.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	sv_utf8_decode(SV *sv)','name' => 'sv_utf8_decode'},'hv_stores' => {'text' => 'Like C<hv_store>, but takes a literal string instead of a string/length pair
and omits the hash parameter.

	SV**	hv_stores(HV* tb, const char* key, NULLOK SV* val)','name' => 'hv_stores'},'eval_sv' => {'text' => 'Tells Perl to C<eval> the string in the SV.

NOTE: the perl_ form of this function is deprecated.

	I32	eval_sv(SV* sv, I32 flags)','name' => 'eval_sv'},'FREETMPS' => {'text' => 'Closing bracket for temporaries on a callback.  See C<SAVETMPS> and
L<perlcall>.

		FREETMPS;','name' => 'FREETMPS'},'Move' => {'text' => 'The XSUB-writer\'s interface to the C C<memmove> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and C<type> is
the type.  Can do overlapping moves.  See also C<Copy>.

	void	Move(void* src, void* dest, int nitems, type)','name' => 'Move'},'sv_catpvn_flags' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.  The
C<len> indicates number of bytes to copy.  If the SV has the UTF-8
status set, then the bytes appended should be valid UTF-8.
If C<flags> has C<SV_GMAGIC> bit set, will C<mg_get> on C<dsv> if
appropriate, else not. C<sv_catpvn> and C<sv_catpvn_nomg> are implemented
in terms of this function.

	void	sv_catpvn_flags(SV* sv, const char* ptr, STRLEN len, I32 flags)','name' => 'sv_catpvn_flags'},'sv_pvn_force' => {'text' => 'Get a sensible string out of the SV somehow.
A private implementation of the C<SvPV_force> macro for compilers which
can\'t cope with complex macro expressions. Always use the macro instead.

	char*	sv_pvn_force(SV* sv, STRLEN* lp)','name' => 'sv_pvn_force'},'GIMME' => {'text' => 'A backward-compatible version of C<GIMME_V> which can only return
C<G_SCALAR> or C<G_ARRAY>; in a void context, it returns C<G_SCALAR>.
Deprecated.  Use C<GIMME_V> instead.

	U32	GIMME','name' => 'GIMME'},'sv_2iv_flags' => {'text' => 'Return the integer value of an SV, doing any necessary string
conversion.  If flags includes SV_GMAGIC, does an mg_get() first.
Normally used via the C<SvIV(sv)> and C<SvIVx(sv)> macros.

	IV	sv_2iv_flags(SV* sv, I32 flags)','name' => 'sv_2iv_flags'},'newXS' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.  I<filename> needs to be
static storage, as it is used directly as CvFILE(), without a copy being made.','name' => 'newXS'},'isALNUM' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ASCII alphanumeric
character (including underscore) or digit.

	bool	isALNUM(char ch)','name' => 'isALNUM'},'XCPT_RETHROW' => {'text' => 'Rethrows a previously caught exception.  See L<perlguts/"Exception Handling">.

		XCPT_RETHROW;','name' => 'XCPT_RETHROW'},'my_snprintf' => {'text' => 'The C library C<snprintf> functionality, if available and
standards-compliant (uses C<vsnprintf>, actually).  However, if the
C<vsnprintf> is not available, will unfortunately use the unsafe
C<vsprintf> which can overrun the buffer (there is an overrun check,
but that may be too late).  Consider using C<sv_vcatpvf> instead, or
getting C<vsnprintf>.

	int	my_snprintf(char *buffer, const Size_t len, const char *format, ...)','name' => 'my_snprintf'},'SvIOK_UV' => {'text' => 'Returns a boolean indicating whether the SV contains an unsigned integer.

	bool	SvIOK_UV(SV* sv)','name' => 'SvIOK_UV'},'PUSHmortal' => {'text' => 'Push a new mortal SV onto the stack.  The stack must have room for this
element.  Does not use C<TARG>.  See also C<PUSHs>, C<XPUSHmortal> and C<XPUSHs>.

	void	PUSHmortal()','name' => 'PUSHmortal'},'perl_alloc' => {'text' => 'Allocates a new Perl interpreter.  See L<perlembed>.

	PerlInterpreter*	perl_alloc()','name' => 'perl_alloc'},'perl_construct' => {'text' => 'Initializes a new Perl interpreter.  See L<perlembed>.

	void	perl_construct(PerlInterpreter* interp)','name' => 'perl_construct'},'SvUOK' => {'text' => 'Returns a boolean indicating whether the SV contains an unsigned integer.

	bool	SvUOK(SV* sv)','name' => 'SvUOK'},'sv_dec' => {'text' => 'Auto-decrement of the value in the SV, doing string to numeric conversion
if necessary. Handles \'get\' magic.

	void	sv_dec(SV* sv)','name' => 'sv_dec'},'strLE' => {'text' => 'Test two strings to see if the first, C<s1>, is less than or equal to the
second, C<s2>.  Returns true or false.

	bool	strLE(char* s1, char* s2)','name' => 'strLE'},'pv_display' => {'text' => 'Similar to

  pv_escape(dsv,pv,cur,pvlim,PERL_PV_ESCAPE_QUOTE);

except that an additional "\\0" will be appended to the string when
len > cur and pv[cur] is "\\0".

Note that the final string may be up to 7 chars longer than pvlim.

	char*	pv_display(SV *dsv, char *pv, STRLEN cur, STRLEN len, STRLEN pvlim)','name' => 'pv_display'},'newSVpvn_flags' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  Note that if C<len> is zero, Perl will create a zero length
string.  You are responsible for ensuring that the source string is at least
C<len> bytes long.  If the C<s> argument is NULL the new SV will be undefined.
Currently the only flag bits accepted are C<SVf_UTF8> and C<SVs_TEMP>.
If C<SVs_TEMP> is set, then C<sv2mortal()> is called on the result before
returning. If C<SVf_UTF8> is set, then it will be set on the new SV.
C<newSVpvn_utf8()> is a convenience wrapper for this function, defined as

    #define newSVpvn_utf8(s, len, u)			\\
	newSVpvn_flags((s), (len), (u) ? SVf_UTF8 : 0)

	SV*	newSVpvn_flags(const char* s, STRLEN len, U32 flags)','name' => 'newSVpvn_flags'},'sv_2pvbyte_nolen' => {'text' => 'Return a pointer to the byte-encoded representation of the SV.
May cause the SV to be downgraded from UTF-8 as a side-effect.

Usually accessed via the C<SvPVbyte_nolen> macro.

	char*	sv_2pvbyte_nolen(SV* sv)','name' => 'sv_2pvbyte_nolen'},'SvOK' => {'text' => 'Returns a U32 value indicating whether the value is an SV. It also tells
whether the value is defined or not.

	U32	SvOK(SV* sv)','name' => 'SvOK'},'sv_setref_nv' => {'text' => 'Copies a double into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_nv(SV* rv, const char* classname, NV nv)','name' => 'sv_setref_nv'},'uvchr_to_utf8' => {'text' => 'Adds the UTF-8 representation of the Native codepoint C<uv> to the end
of the string C<d>; C<d> should be have at least C<UTF8_MAXBYTES+1> free
bytes available. The return value is the pointer to the byte after the
end of the new character. In other words,

    d = uvchr_to_utf8(d, uv);

is the recommended wide native character-aware way of saying

    *(d++) = uv;

	U8*	uvchr_to_utf8(U8 *d, UV uv)','name' => 'uvchr_to_utf8'},'isDIGIT' => {'text' => 'Returns a boolean indicating whether the C C<char> is an ASCII
digit.

	bool	isDIGIT(char ch)','name' => 'isDIGIT'},'eval_pv' => {'text' => 'Tells Perl to C<eval> the given string and return an SV* result.

NOTE: the perl_ form of this function is deprecated.

	SV*	eval_pv(const char* p, I32 croak_on_error)','name' => 'eval_pv'},'sv_usepvn_flags' => {'text' => 'Tells an SV to use C<ptr> to find its string value.  Normally the
string is stored inside the SV but sv_usepvn allows the SV to use an
outside string.  The C<ptr> should point to memory that was allocated
by C<malloc>.  The string length, C<len>, must be supplied.  By default
this function will realloc (i.e. move) the memory pointed to by C<ptr>,
so that pointer should not be freed or used by the programmer after
giving it to sv_usepvn, and neither should any pointers from "behind"
that pointer (e.g. ptr + 1) be used.

If C<flags> & SV_SMAGIC is true, will call SvSETMAGIC. If C<flags> &
SV_HAS_TRAILING_NUL is true, then C<ptr[len]> must be NUL, and the realloc
will be skipped. (i.e. the buffer is actually at least 1 byte longer than
C<len>, and already meets the requirements for storing in C<SvPVX>)

	void	sv_usepvn_flags(SV* sv, char* ptr, STRLEN len, U32 flags)','name' => 'sv_usepvn_flags'},'hv_assert' => {'text' => 'Check that a hash is in an internally consistent state.

	void	hv_assert(HV* tb)','name' => 'hv_assert'},'my_vsnprintf' => {'text' => 'The C library C<vsnprintf> if available and standards-compliant.
However, if if the C<vsnprintf> is not available, will unfortunately
use the unsafe C<vsprintf> which can overrun the buffer (there is an
overrun check, but that may be too late).  Consider using
C<sv_vcatpvf> instead, or getting C<vsnprintf>.

	int	my_vsnprintf(char *buffer, const Size_t len, const char *format, va_list ap)','name' => 'my_vsnprintf'},'sv_free' => {'text' => 'Decrement an SV\'s reference count, and if it drops to zero, call
C<sv_clear> to invoke destructors and free up any memory used by
the body; finally, deallocate the SV\'s head itself.
Normally called via a wrapper macro C<SvREFCNT_dec>.

	void	sv_free(SV* sv)','name' => 'sv_free'},'SvPVbyte_force' => {'text' => 'Like C<SvPV_force>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte_force(SV* sv, STRLEN len)','name' => 'SvPVbyte_force'},'newCONSTSUB' => {'text' => 'Creates a constant sub equivalent to Perl C<sub FOO () { 123 }> which is
eligible for inlining at compile-time.

	CV*	newCONSTSUB(HV* stash, char* name, SV* sv)','name' => 'newCONSTSUB'},'SvSHARE' => {'text' => 'Arranges for sv to be shared between threads if a suitable module
has been loaded.

	void	SvSHARE(SV* sv)','name' => 'SvSHARE'},'av_pop' => {'text' => 'Pops an SV off the end of the array.  Returns C<&PL_sv_undef> if the array
is empty.

	SV*	av_pop(AV* ar)','name' => 'av_pop'},'croak' => {'text' => 'This is the XSUB-writer\'s interface to Perl\'s C<die> function.
Normally call this function the same way you call the C C<printf>
function.  Calling C<croak> returns control directly to Perl,
sidestepping the normal C order of execution. See C<warn>.

If you want to throw an exception object, assign the object to
C<$@> and then pass C<NULL> to croak():

   errsv = get_sv("@", TRUE);
   sv_setsv(errsv, exception_object);
   croak(NULL);

	void	croak(const char* pat, ...)','name' => 'croak'},'sortsv' => {'text' => 'Sort an array. Here is an example:

    sortsv(AvARRAY(av), av_len(av)+1, Perl_sv_cmp_locale);

See lib/sort.pm for details about controlling the sorting algorithm.

	void	sortsv(SV** array, size_t num_elts, SVCOMPARE_t cmp)','name' => 'sortsv'},'THIS' => {'text' => 'Variable which is setup by C<xsubpp> to designate the object in a C++ 
XSUB.  This is always the proper type for the C++ object.  See C<CLASS> and 
L<perlxs/"Using XS With C++">.

	(whatever)	THIS','name' => 'THIS'},'XSRETURN' => {'text' => 'Return from XSUB, indicating number of items on the stack.  This is usually
handled by C<xsubpp>.

	void	XSRETURN(int nitems)','name' => 'XSRETURN'},'scan_bin' => {'text' => 'For backwards compatibility. Use C<grok_bin> instead.

	NV	scan_bin(char* start, STRLEN len, STRLEN* retlen)','name' => 'scan_bin'},'Nullcv' => {'text' => 'Null CV pointer.','name' => 'Nullcv'},'sv_2pv_nolen' => {'text' => 'Like C<sv_2pv()>, but doesn\'t return the length too. You should usually
use the macro wrapper C<SvPV_nolen(sv)> instead.
	char*	sv_2pv_nolen(SV* sv)','name' => 'sv_2pv_nolen'},'get_av' => {'text' => 'Returns the AV of the specified Perl array.  If C<create> is set and the
Perl variable does not exist then it will be created.  If C<create> is not
set and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	AV*	get_av(const char* name, I32 create)','name' => 'get_av'},'MULTICALL' => {'text' => 'Make a lightweight callback. See L<perlcall/Lightweight Callbacks>.

		MULTICALL;','name' => 'MULTICALL'},'SvPVbyte' => {'text' => 'Like C<SvPV>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte(SV* sv, STRLEN len)','name' => 'SvPVbyte'},'PoisonFree' => {'text' => 'PoisonWith(0xEF) for catching access to freed memory.

	void	PoisonFree(void* dest, int nitems, type)','name' => 'PoisonFree'},'toUPPER' => {'text' => 'Converts the specified character to uppercase.

	char	toUPPER(char ch)','name' => 'toUPPER'},'is_utf8_string_loc' => {'text' => 'Like is_utf8_string() but stores the location of the failure (in the
case of "utf8ness failure") or the location s+len (in the case of
"utf8ness success") in the C<ep>.

See also is_utf8_string_loclen() and is_utf8_string().

	bool	is_utf8_string_loc(U8 *s, STRLEN len, U8 **p)','name' => 'is_utf8_string_loc'},'SAVETMPS' => {'text' => 'Opening bracket for temporaries on a callback.  See C<FREETMPS> and
L<perlcall>.

		SAVETMPS;','name' => 'SAVETMPS'},'AvFILL' => {'text' => 'Same as C<av_len()>.  Deprecated, use C<av_len()> instead.

	int	AvFILL(AV* av)','name' => 'AvFILL'},'sv_gets' => {'text' => 'Get a line from the filehandle and store it into the SV, optionally
appending to the currently-stored string.

	char*	sv_gets(SV* sv, PerlIO* fp, I32 append)','name' => 'sv_gets'},'ORIGMARK' => {'text' => 'The original stack mark for the XSUB.  See C<dORIGMARK>.','name' => 'ORIGMARK'},'SvPVutf8x' => {'text' => 'Like C<SvPV>, but converts sv to utf8 first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVutf8>
otherwise.

	char*	SvPVutf8x(SV* sv, STRLEN len)','name' => 'SvPVutf8x'},'sv_2cv' => {'text' => 'Using various gambits, try to get a CV from an SV; in addition, try if
possible to set C<*st> and C<*gvp> to the stash and GV associated with it.
The flags in C<lref> are passed to sv_fetchsv.

	CV*	sv_2cv(SV* sv, HV** st, GV** gvp, I32 lref)','name' => 'sv_2cv'},'SvPV_force_nomg' => {'text' => 'Like C<SvPV> but will force the SV into containing just a string
(C<SvPOK_only>).  You want force if you are going to update the C<SvPVX>
directly. Doesn\'t process magic.

	char*	SvPV_force_nomg(SV* sv, STRLEN len)','name' => 'SvPV_force_nomg'},'SvSetSV_nosteal' => {'text' => 'Calls a non-destructive version of C<sv_setsv> if dsv is not the same as
ssv. May evaluate arguments more than once.

	void	SvSetSV_nosteal(SV* dsv, SV* ssv)','name' => 'SvSetSV_nosteal'},'SvPOK_only' => {'text' => 'Tells an SV that it is a string and disables all other OK bits.
Will also turn off the UTF-8 status.

	void	SvPOK_only(SV* sv)','name' => 'SvPOK_only'},'dUNDERBAR' => {'text' => 'Sets up the C<padoff_du> variable for an XSUB that wishes to use
C<UNDERBAR>.

		dUNDERBAR;','name' => 'dUNDERBAR'},'sv_usepvn_mg' => {'text' => 'Like C<sv_usepvn>, but also handles \'set\' magic.

	void	sv_usepvn_mg(SV *sv, char *ptr, STRLEN len)','name' => 'sv_usepvn_mg'},'XCPT_TRY_START' => {'text' => 'Starts a try block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_TRY_START'},'sv_pvbyte' => {'text' => 'Use C<SvPVbyte_nolen> instead.

	char*	sv_pvbyte(SV *sv)','name' => 'sv_pvbyte'},'sv_uv' => {'text' => 'A private implementation of the C<SvUVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	UV	sv_uv(SV* sv)','name' => 'sv_uv'},'hv_fetch' => {'text' => 'Returns the SV which corresponds to the specified key in the hash.  The
C<klen> is the length of the key.  If C<lval> is set then the fetch will be
part of a store.  Check that the return value is non-null before
dereferencing it to an C<SV*>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	SV**	hv_fetch(HV* tb, const char* key, I32 klen, I32 lval)','name' => 'hv_fetch'},'sv_unref_flags' => {'text' => 'Unsets the RV status of the SV, and decrements the reference count of
whatever was being referenced by the RV.  This can almost be thought of
as a reversal of C<newSVrv>.  The C<cflags> argument can contain
C<SV_IMMEDIATE_UNREF> to force the reference count to be decremented
(otherwise the decrementing is conditional on the reference count being
different from one or the reference being a readonly SV).
See C<SvROK_off>.

	void	sv_unref_flags(SV* sv, U32 flags)','name' => 'sv_unref_flags'},'hv_scalar' => {'text' => 'Evaluates the hash in scalar context and returns the result. Handles magic when the hash is tied.

	SV*	hv_scalar(HV* hv)','name' => 'hv_scalar'},'SvRV' => {'text' => 'Dereferences an RV to return the SV.

	SV*	SvRV(SV* sv)','name' => 'SvRV'},'Nullch' => {'text' => 'Null character pointer.','name' => 'Nullch'},'mg_copy' => {'text' => 'Copies the magic from one SV to another.  See C<sv_magic>.

	int	mg_copy(SV* sv, SV* nsv, const char* key, I32 klen)','name' => 'mg_copy'},'MARK' => {'text' => 'Stack marker variable for the XSUB.  See C<dMARK>.','name' => 'MARK'},'grok_oct' => {'text' => 'converts a string representing an octal number to numeric form.

On entry I<start> and I<*len> give the string to scan, I<*flags> gives
conversion flags, and I<result> should be NULL or a pointer to an NV.
The scan stops at the end of the string, or the first invalid character.
Unless C<PERL_SCAN_SILENT_ILLDIGIT> is set in I<*flags>, encountering an
invalid character will also trigger a warning.
On return I<*len> is set to the length of the scanned string,
and I<*flags> gives output flags.

If the value is <= UV_MAX it is returned as a UV, the output flags are clear,
and nothing is written to I<*result>. If the value is > UV_MAX C<grok_oct>
returns UV_MAX, sets C<PERL_SCAN_GREATER_THAN_UV_MAX> in the output flags,
and writes the value to I<*result> (or the value is discarded if I<result>
is NULL).

If C<PERL_SCAN_ALLOW_UNDERSCORES> is set in I<*flags> then the octal
number may use \'_\' characters to separate digits.

	UV	grok_oct(char* start, STRLEN* len_p, I32* flags, NV *result)','name' => 'grok_oct'},'sv_rvweaken' => {'text' => 'Weaken a reference: set the C<SvWEAKREF> flag on this RV; give the
referred-to SV C<PERL_MAGIC_backref> magic if it hasn\'t already; and
push a back-reference to this RV onto the array of backreferences
associated with that magic.

	SV*	sv_rvweaken(SV *sv)','name' => 'sv_rvweaken'},'scan_hex' => {'text' => 'For backwards compatibility. Use C<grok_hex> instead.

	NV	scan_hex(char* start, STRLEN len, STRLEN* retlen)','name' => 'scan_hex'},'newSVpvn' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  Note that if C<len> is zero, Perl will create a zero length
string.  You are responsible for ensuring that the source string is at least
C<len> bytes long.  If the C<s> argument is NULL the new SV will be undefined.

	SV*	newSVpvn(const char* s, STRLEN len)','name' => 'newSVpvn'},'sv_magicext' => {'text' => 'Adds magic to an SV, upgrading it if necessary. Applies the
supplied vtable and returns a pointer to the magic added.

Note that C<sv_magicext> will allow things that C<sv_magic> will not.
In particular, you can add magic to SvREADONLY SVs, and add more than
one instance of the same \'how\'.

If C<namlen> is greater than zero then a C<savepvn> I<copy> of C<name> is
stored, if C<namlen> is zero then C<name> is stored as-is and - as another
special case - if C<(name && namlen == HEf_SVKEY)> then C<name> is assumed
to contain an C<SV*> and is stored as-is with its REFCNT incremented.

(This is now used as a subroutine by C<sv_magic>.)

	MAGIC *	sv_magicext(SV* sv, SV* obj, int how, MGVTBL *vtbl, const char* name, I32 namlen)','name' => 'sv_magicext'},'av_push' => {'text' => 'Pushes an SV onto the end of the array.  The array will grow automatically
to accommodate the addition.

	void	av_push(AV* ar, SV* val)','name' => 'av_push'},'unpackstring' => {'text' => 'The engine implementing unpack() Perl function. C<unpackstring> puts the
extracted list items on the stack and returns the number of elements.
Issue C<PUTBACK> before and C<SPAGAIN> after the call to this function.

	I32	unpackstring(char *pat, char *patend, char *s, char *strend, U32 flags)','name' => 'unpackstring'},'POPn' => {'text' => 'Pops a double off the stack.

	NV	POPn','name' => 'POPn'},'XSRETURN_NO' => {'text' => 'Return C<&PL_sv_no> from an XSUB immediately.  Uses C<XST_mNO>.

		XSRETURN_NO;','name' => 'XSRETURN_NO'},'av_extend' => {'text' => 'Pre-extend an array.  The C<key> is the index to which the array should be
extended.

	void	av_extend(AV* ar, I32 key)','name' => 'av_extend'},'newRV_noinc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original
SV is B<not> incremented.

	SV*	newRV_noinc(SV* sv)','name' => 'newRV_noinc'},'hv_iternext' => {'text' => 'Returns entries from a hash iterator.  See C<hv_iterinit>.

You may call C<hv_delete> or C<hv_delete_ent> on the hash entry that the
iterator currently points to, without losing your place or invalidating your
iterator.  Note that in this case the current entry is deleted from the hash
with your iterator holding the last reference to it.  Your iterator is flagged
to free the entry on the next call to C<hv_iternext>, so you must not discard
your iterator immediately else the entry will leak - call C<hv_iternext> to
trigger the resource deallocation.

	HE*	hv_iternext(HV* tb)','name' => 'hv_iternext'},'hv_iterinit' => {'text' => 'Prepares a starting point to traverse a hash table.  Returns the number of
keys in the hash (i.e. the same as C<HvKEYS(tb)>).  The return value is
currently only meaningful for hashes without tie magic.

NOTE: Before version 5.004_65, C<hv_iterinit> used to return the number of
hash buckets that happen to be in use.  If you still need that esoteric
value, you can get it through the macro C<HvFILL(tb)>.


	I32	hv_iterinit(HV* tb)','name' => 'hv_iterinit'}};};

  my $self = bless({
    'index' => $VAR1,
    perl_version => '5.008009',
  } => $class);
  return $self;
}

1;
