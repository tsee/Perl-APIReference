package Perl::APIReference::V5_018_000;
use strict;
use warnings;
use parent 'Perl::APIReference';

sub new {
  my $class = shift;
  my $VAR1;

do{$VAR1 = {'newBINOP' => {'text' => 'Constructs, checks, and returns an op of any binary type.  I<type>
is the opcode.  I<flags> gives the eight bits of C<op_flags>, except
that C<OPf_KIDS> will be set automatically, and, shifted up eight bits,
the eight bits of C<op_private>, except that the bit with value 1 or
2 is automatically set as required.  I<first> and I<last> supply up to
two ops to be the direct children of the binary op; they are consumed
by this function and become part of the constructed op tree.

	OP *	newBINOP(I32 type, I32 flags, OP *first,
		         OP *last)','name' => 'newBINOP'},'strGE' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than or equal to
the second, C<s2>.  Returns true or false.

	bool	strGE(char* s1, char* s2)','name' => 'strGE'},'SvPV' => {'text' => 'Returns a pointer to the string in the SV, or a stringified form of
the SV if the SV does not contain a string.  The SV may cache the
stringified version becoming C<SvPOK>.  Handles \'get\' magic.  See also
C<SvPVx> for a version which guarantees to evaluate sv only once.

Note that there is no guarantee that the return value of C<SvPV()> is
equal to C<SvPVX(sv)>, or that C<SvPVX(sv)> contains valid data, or that
successive calls to C<SvPV(sv)) will return the same pointer value each
time. This is due to the way that things like overloading and
Copy-On-Write are handled.  In these cases, the return value may point to
a temporary buffer or similar.  If you absolutely need the SvPVX field to
be valid (for example, if you intend to write to it), then see
L</SvPV_force>.

	char*	SvPV(SV* sv, STRLEN len)','name' => 'SvPV'},'sv_vsetpvf_mg' => {'text' => 'Like C<sv_vsetpvf>, but also handles \'set\' magic.

Usually used via its frontend C<sv_setpvf_mg>.

	void	sv_vsetpvf_mg(SV *const sv,
		              const char *const pat,
		              va_list *const args)','name' => 'sv_vsetpvf_mg'},'SvPVutf8' => {'text' => 'Like C<SvPV>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8(SV* sv, STRLEN len)','name' => 'SvPVutf8'},'sortsv_flags' => {'text' => 'Sort an array, with various options.

	void	sortsv_flags(SV** array, size_t num_elts,
		             SVCOMPARE_t cmp, U32 flags)','name' => 'sortsv_flags'},'vwarn' => {'text' => 'This is an XS interface to Perl\'s C<warn> function.

C<pat> and C<args> are a sprintf-style format pattern and encapsulated
argument list.  These are used to generate a string message.  If the
message does not end with a newline, then it will be extended with
some indication of the current location in the code, as described for
L</mess_sv>.

The error message or object will by default be written to standard error,
but this is subject to modification by a C<$SIG{__WARN__}> handler.

Unlike with L</vcroak>, C<pat> is not permitted to be null.

	void	vwarn(const char *pat, va_list *args)','name' => 'vwarn'},'scan_oct' => {'text' => 'For backwards compatibility. Use C<grok_oct> instead.

	NV	scan_oct(const char* start, STRLEN len,
		         STRLEN* retlen)','name' => 'scan_oct'},'my_strlcat' => {'text' => '','name' => 'my_strlcat'},'av_arylen_p' => {'text' => '','name' => 'av_arylen_p'},'gv_add_by_type' => {'text' => '','name' => 'gv_add_by_type'},'newGVOP' => {'text' => 'Constructs, checks, and returns an op of any type that involves an
embedded reference to a GV.  I<type> is the opcode.  I<flags> gives the
eight bits of C<op_flags>.  I<gv> identifies the GV that the op should
reference; calling this function does not transfer ownership of any
reference to it.

	OP *	newGVOP(I32 type, I32 flags, GV *gv)','name' => 'newGVOP'},'XopDISABLE' => {'text' => 'Temporarily disable a member of the XOP, by clearing the appropriate flag.

	void	XopDISABLE(XOP *xop, which)','name' => 'XopDISABLE'},'hv_rand_set' => {'text' => '','name' => 'hv_rand_set'},'find_runcv' => {'text' => 'Locate the CV corresponding to the currently executing sub or eval.
If db_seqp is non_null, skip CVs that are in the DB package and populate
*db_seqp with the cop sequence number at the point that the DB:: code was
entered. (allows debuggers to eval in the scope of the breakpoint rather
than in the scope of the debugger itself).

	CV*	find_runcv(U32 *db_seqp)','name' => 'find_runcv'},'utf8n_to_uvuni' => {'text' => 'Bottom level UTF-8 decode routine.
Returns the code point value of the first character in the string C<s>,
which is assumed to be in UTF-8 (or UTF-EBCDIC) encoding, and no longer than
C<curlen> bytes; C<*retlen> (if C<retlen> isn\'t NULL) will be set to
the length, in bytes, of that character.

The value of C<flags> determines the behavior when C<s> does not point to a
well-formed UTF-8 character.  If C<flags> is 0, when a malformation is found,
zero is returned and C<*retlen> is set so that (S<C<s> + C<*retlen>>) is the
next possible position in C<s> that could begin a non-malformed character.
Also, if UTF-8 warnings haven\'t been lexically disabled, a warning is raised.

Various ALLOW flags can be set in C<flags> to allow (and not warn on)
individual types of malformations, such as the sequence being overlong (that
is, when there is a shorter sequence that can express the same code point;
overlong sequences are expressly forbidden in the UTF-8 standard due to
potential security issues).  Another malformation example is the first byte of
a character not being a legal first byte.  See F<utf8.h> for the list of such
flags.  For allowed 0 length strings, this function returns 0; for allowed
overlong sequences, the computed code point is returned; for all other allowed
malformations, the Unicode REPLACEMENT CHARACTER is returned, as these have no
determinable reasonable value.

The UTF8_CHECK_ONLY flag overrides the behavior when a non-allowed (by other
flags) malformation is found.  If this flag is set, the routine assumes that
the caller will raise a warning, and this function will silently just set
C<retlen> to C<-1> (cast to C<STRLEN>) and return zero.

Note that this API requires disambiguation between successful decoding a NUL
character, and an error return (unless the UTF8_CHECK_ONLY flag is set), as
in both cases, 0 is returned.  To disambiguate, upon a zero return, see if the
first byte of C<s> is 0 as well.  If so, the input was a NUL; if not, the input
had an error.

Certain code points are considered problematic.  These are Unicode surrogates,
Unicode non-characters, and code points above the Unicode maximum of 0x10FFFF.
By default these are considered regular code points, but certain situations
warrant special handling for them.  If C<flags> contains
UTF8_DISALLOW_ILLEGAL_INTERCHANGE, all three classes are treated as
malformations and handled as such.  The flags UTF8_DISALLOW_SURROGATE,
UTF8_DISALLOW_NONCHAR, and UTF8_DISALLOW_SUPER (meaning above the legal Unicode
maximum) can be set to disallow these categories individually.

The flags UTF8_WARN_ILLEGAL_INTERCHANGE, UTF8_WARN_SURROGATE,
UTF8_WARN_NONCHAR, and UTF8_WARN_SUPER will cause warning messages to be raised
for their respective categories, but otherwise the code points are considered
valid (not malformations).  To get a category to both be treated as a
malformation and raise a warning, specify both the WARN and DISALLOW flags.
(But note that warnings are not raised if lexically disabled nor if
UTF8_CHECK_ONLY is also specified.)

Very large code points (above 0x7FFF_FFFF) are considered more problematic than
the others that are above the Unicode legal maximum.  There are several
reasons: they requre at least 32 bits to represent them on ASCII platforms, are
not representable at all on EBCDIC platforms, and the original UTF-8
specification never went above this number (the current 0x10FFFF limit was
imposed later).  (The smaller ones, those that fit into 32 bits, are
representable by a UV on ASCII platforms, but not by an IV, which means that
the number of operations that can be performed on them is quite restricted.)
The UTF-8 encoding on ASCII platforms for these large code points begins with a
byte containing 0xFE or 0xFF.  The UTF8_DISALLOW_FE_FF flag will cause them to
be treated as malformations, while allowing smaller above-Unicode code points.
(Of course UTF8_DISALLOW_SUPER will treat all above-Unicode code points,
including these, as malformations.) Similarly, UTF8_WARN_FE_FF acts just like
the other WARN flags, but applies just to these code points.

All other code points corresponding to Unicode characters, including private
use and those yet to be assigned, are never considered malformed and never
warn.

Most code should use L</utf8_to_uvchr_buf>() rather than call this directly.

	UV	utf8n_to_uvuni(const U8 *s, STRLEN curlen,
		               STRLEN *retlen, U32 flags)','name' => 'utf8n_to_uvuni'},'newSVpvn_utf8' => {'text' => 'Creates a new SV and copies a string into it.  If utf8 is true, calls
C<SvUTF8_on> on the new SV.  Implemented as a wrapper around C<newSVpvn_flags>.

	SV*	newSVpvn_utf8(NULLOK const char* s, STRLEN len,
		              U32 utf8)','name' => 'newSVpvn_utf8'},'dMARK' => {'text' => 'Declare a stack marker variable, C<mark>, for the XSUB.  See C<MARK> and
C<dORIGMARK>.

		dMARK;','name' => 'dMARK'},'whichsig_pv' => {'text' => '','name' => 'whichsig_pv'},'gv_fetchmeth_sv_autoload' => {'text' => 'Exactly like L</gv_fetchmeth_pvn_autoload>, but takes the name string in the form
of an SV instead of a string/length pair.

	GV*	gv_fetchmeth_sv_autoload(HV* stash, SV* namesv,
		                         I32 level, U32 flags)','name' => 'gv_fetchmeth_sv_autoload'},'pregcomp' => {'text' => '','name' => 'pregcomp'},'my_cxt_index' => {'text' => '','name' => 'my_cxt_index'},'lex_discard_to' => {'text' => 'Discards the first part of the L</PL_parser-E<gt>linestr> buffer,
up to I<ptr>.  The remaining content of the buffer will be moved, and
all pointers into the buffer updated appropriately.  I<ptr> must not
be later in the buffer than the position of L</PL_parser-E<gt>bufptr>:
it is not permitted to discard text that has yet to be lexed.

Normally it is not necessarily to do this directly, because it suffices to
use the implicit discarding behaviour of L</lex_next_chunk> and things
based on it.  However, if a token stretches across multiple lines,
and the lexing code has kept multiple lines of text in the buffer for
that purpose, then after completion of the token it would be wise to
explicitly discard the now-unneeded earlier lines, to avoid future
multi-line tokens growing the buffer without bound.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_discard_to(char *ptr)','name' => 'lex_discard_to'},'markstack_grow' => {'text' => '','name' => 'markstack_grow'},'cv_get_call_checker' => {'text' => 'Retrieves the function that will be used to fix up a call to I<cv>.
Specifically, the function is applied to an C<entersub> op tree for a
subroutine call, not marked with C<&>, where the callee can be identified
at compile time as I<cv>.

The C-level function pointer is returned in I<*ckfun_p>, and an SV
argument for it is returned in I<*ckobj_p>.  The function is intended
to be called in this manner:

    entersubop = (*ckfun_p)(aTHX_ entersubop, namegv, (*ckobj_p));

In this call, I<entersubop> is a pointer to the C<entersub> op,
which may be replaced by the check function, and I<namegv> is a GV
supplying the name that should be used by the check function to refer
to the callee of the C<entersub> op if it needs to emit any diagnostics.
It is permitted to apply the check function in non-standard situations,
such as to a call to a different subroutine or to a method call.

By default, the function is
L<Perl_ck_entersub_args_proto_or_list|/ck_entersub_args_proto_or_list>,
and the SV parameter is I<cv> itself.  This implements standard
prototype processing.  It can be changed, for a particular subroutine,
by L</cv_set_call_checker>.

	void	cv_get_call_checker(CV *cv,
		                    Perl_call_checker *ckfun_p,
		                    SV **ckobj_p)','name' => 'cv_get_call_checker'},'mXPUSHp' => {'text' => 'Push a string onto the stack, extending the stack if necessary.  The C<len>
indicates the length of the string.  Does not use C<TARG>.  See also C<XPUSHp>,
C<mPUSHp> and C<PUSHp>.

	void	mXPUSHp(char* str, STRLEN len)','name' => 'mXPUSHp'},'lex_stuff_sv' => {'text' => 'Insert characters into the lexer buffer (L</PL_parser-E<gt>linestr>),
immediately after the current lexing point (L</PL_parser-E<gt>bufptr>),
reallocating the buffer if necessary.  This means that lexing code that
runs later will see the characters as if they had appeared in the input.
It is not recommended to do this as part of normal parsing, and most
uses of this facility run the risk of the inserted characters being
interpreted in an unintended manner.

The string to be inserted is the string value of I<sv>.  The characters
are recoded for the lexer buffer, according to how the buffer is currently
being interpreted (L</lex_bufutf8>).  If a string to be inserted is
not already a Perl scalar, the L</lex_stuff_pvn> function avoids the
need to construct a scalar.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_stuff_sv(SV *sv, U32 flags)','name' => 'lex_stuff_sv'},'ibcmp_utf8' => {'text' => 'This is a synonym for (! foldEQ_utf8())

	I32	ibcmp_utf8(const char *s1, char **pe1, UV l1,
		           bool u1, const char *s2, char **pe2,
		           UV l2, bool u2)','name' => 'ibcmp_utf8'},'CvSTASH' => {'text' => 'Returns the stash of the CV. A stash is the symbol table hash, containing
the package-scoped variables in the package where the subroutine was defined.
For more information, see L<perlguts>.

This also has a special use with XS AUTOLOAD subs.
See L<perlguts/Autoloading with XSUBs>.

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

	void	sv_replace(SV *const sv, SV *const nsv)','name' => 'sv_replace'},'utf8n_to_uvchr' => {'text' => 'Returns the native character value of the first character in the string
C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

C<length> and C<flags> are the same as L</utf8n_to_uvuni>().

	UV	utf8n_to_uvchr(const U8 *s, STRLEN curlen,
		               STRLEN *retlen, U32 flags)','name' => 'utf8n_to_uvchr'},'G_ARRAY' => {'text' => 'Used to indicate list context.  See C<GIMME_V>, C<GIMME> and
L<perlcall>.','name' => 'G_ARRAY'},'sv_2iv' => {'text' => '','name' => 'sv_2iv'},'ck_warner_d' => {'text' => '','name' => 'ck_warner_d'},'XS_VERSION_BOOTCHECK' => {'text' => 'Macro to verify that a PM module\'s $VERSION variable matches the XS
module\'s C<XS_VERSION> variable.  This is usually handled automatically by
C<xsubpp>.  See L<perlxs/"The VERSIONCHECK: Keyword">.

		XS_VERSION_BOOTCHECK;','name' => 'XS_VERSION_BOOTCHECK'},'pad_compname_type' => {'text' => 'Looks up the type of the lexical variable at position I<po> in the
currently-compiling pad.  If the variable is typed, the stash of the
class to which it is typed is returned.  If not, C<NULL> is returned.

	HV *	pad_compname_type(PADOFFSET po)','name' => 'pad_compname_type'},'mXPUSHn' => {'text' => 'Push a double onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHn>, C<mPUSHn> and C<PUSHn>.

	void	mXPUSHn(NV nv)','name' => 'mXPUSHn'},'SvSETMAGIC' => {'text' => 'Invokes C<mg_set> on an SV if it has \'set\' magic.  This is necessary
after modifying a scalar, in case it is a magical variable like C<$|>
or a tied variable (it calls C<STORE>).  This macro evaluates its
argument more than once.

	void	SvSETMAGIC(SV* sv)','name' => 'SvSETMAGIC'},'G_EVAL' => {'text' => 'Used to force a Perl C<eval> wrapper around a callback.  See
L<perlcall>.','name' => 'G_EVAL'},'sv_catsv_mg' => {'text' => 'Like C<sv_catsv>, but also handles \'set\' magic.

	void	sv_catsv_mg(SV *dsv, SV *ssv)','name' => 'sv_catsv_mg'},'call_argv' => {'text' => 'Performs a callback to the specified named and package-scoped Perl subroutine 
with C<argv> (a NULL-terminated array of strings) as arguments. See L<perlcall>.

Approximate Perl equivalent: C<&{"$sub_name"}(@$argv)>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_argv(const char* sub_name, I32 flags,
		          char** argv)','name' => 'call_argv'},'save_freeop' => {'text' => '','name' => 'save_freeop'},'SvPV_nolen' => {'text' => 'Like C<SvPV> but doesn\'t set a length variable.

	char*	SvPV_nolen(SV* sv)','name' => 'SvPV_nolen'},'alloccopstash' => {'text' => 'Available only under threaded builds, this function allocates an entry in
C<PL_stashpad> for the stash passed to it.

NOTE: this function is experimental and may change or be
removed without notice.

	PADOFFSET alloccopstash(HV *hv)','name' => 'alloccopstash'},'perl_clone' => {'text' => 'Create and return a new interpreter by cloning the current one.

perl_clone takes these flags as parameters:

CLONEf_COPY_STACKS - is used to, well, copy the stacks also,
without it we only clone the data and zero the stacks,
with it we copy the stacks and the new perl interpreter is
ready to run at the exact same point as the previous one.
The pseudo-fork code uses COPY_STACKS while the
threads->create doesn\'t.

CLONEf_KEEP_PTR_TABLE -
perl_clone keeps a ptr_table with the pointer of the old
variable as a key and the new variable as a value,
this allows it to check if something has been cloned and not
clone it again but rather just use the value and increase the
refcount.  If KEEP_PTR_TABLE is not set then perl_clone will kill
the ptr_table using the function
C<ptr_table_free(PL_ptr_table); PL_ptr_table = NULL;>,
reason to keep it around is if you want to dup some of your own
variable who are outside the graph perl scans, example of this
code is in threads.xs create.

CLONEf_CLONE_HOST -
This is a win32 thing, it is ignored on unix, it tells perls
win32host code (which is c++) to clone itself, this is needed on
win32 if you want to run two threads at the same time,
if you just want to do some stuff in a separate perl interpreter
and then throw it away and return to the original one,
you don\'t need to do anything.

	PerlInterpreter* perl_clone(
	                     PerlInterpreter *proto_perl,
	                     UV flags
	                 )','name' => 'perl_clone'},'save_alloc' => {'text' => '','name' => 'save_alloc'},'SvSetSV' => {'text' => 'Calls C<sv_setsv> if dsv is not the same as ssv.  May evaluate arguments
more than once.

	void	SvSetSV(SV* dsb, SV* ssv)','name' => 'SvSetSV'},'rninstr' => {'text' => '','name' => 'rninstr'},'pad_findmy_pvn' => {'text' => 'Given the name of a lexical variable, find its position in the
currently-compiling pad.
I<namepv>/I<namelen> specify the variable\'s name, including leading sigil.
I<flags> is reserved and must be zero.
If it is not in the current pad but appears in the pad of any lexically
enclosing scope, then a pseudo-entry for it is added in the current pad.
Returns the offset in the current pad,
or C<NOT_IN_PAD> if no such lexical is in scope.

	PADOFFSET pad_findmy_pvn(const char *namepv,
	                         STRLEN namelen, U32 flags)','name' => 'pad_findmy_pvn'},'hv_fetchs' => {'text' => 'Like C<hv_fetch>, but takes a literal string instead of a string/length pair.

	SV**	hv_fetchs(HV* tb, const char* key, I32 lval)','name' => 'hv_fetchs'},'strnNE' => {'text' => 'Test two strings to see if they are different.  The C<len> parameter
indicates the number of bytes to compare.  Returns true or false. (A
wrapper for C<strncmp>).

	bool	strnNE(char* s1, char* s2, STRLEN len)','name' => 'strnNE'},'cophh_store_pv' => {'text' => 'Like L</cophh_store_pvn>, but takes a nul-terminated string instead of
a string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_store_pv(const COPHH *cophh,
		               const char *key, U32 hash,
		               SV *value, U32 flags)','name' => 'cophh_store_pv'},'savepv' => {'text' => 'Perl\'s version of C<strdup()>. Returns a pointer to a newly allocated
string which is a duplicate of C<pv>. The size of the string is
determined by C<strlen()>. The memory allocated for the new string can
be freed with the C<Safefree()> function.

	char*	savepv(const char* pv)','name' => 'savepv'},'save_iv' => {'text' => '','name' => 'save_iv'},'HvNAME' => {'text' => 'Returns the package name of a stash, or NULL if C<stash> isn\'t a stash.
See C<SvSTASH>, C<CvSTASH>.

	char*	HvNAME(HV* stash)','name' => 'HvNAME'},'sv_recode_to_utf8' => {'text' => 'The encoding is assumed to be an Encode object, on entry the PV
of the sv is assumed to be octets in that encoding, and the sv
will be converted into Unicode (and UTF-8).

If the sv already is UTF-8 (or if it is not POK), or if the encoding
is not a reference, nothing is done to the sv.  If the encoding is not
an C<Encode::XS> Encoding object, bad things will happen.
(See F<lib/encoding.pm> and L<Encode>.)

The PV of the sv is returned.

	char*	sv_recode_to_utf8(SV* sv, SV *encoding)','name' => 'sv_recode_to_utf8'},'save_hptr' => {'text' => '','name' => 'save_hptr'},'runops_debug' => {'text' => '','name' => 'runops_debug'},'do_gvgv_dump' => {'text' => '','name' => 'do_gvgv_dump'},'PERL_SYS_INIT' => {'text' => 'Provides system-specific tune up of the C runtime environment necessary to
run Perl interpreters. This should be called only once, before creating
any Perl interpreters.

	void	PERL_SYS_INIT(int *argc, char*** argv)','name' => 'PERL_SYS_INIT'},'vstringify' => {'text' => 'In order to maintain maximum compatibility with earlier versions
of Perl, this function will return either the floating point
notation or the multiple dotted notation, depending on whether
the original version contained 1 or more dots, respectively.

The SV returned has a refcount of 1.

	SV*	vstringify(SV *vs)','name' => 'vstringify'},'sv_catsv_flags' => {'text' => 'Concatenates the string from SV C<ssv> onto the end of the string in SV
C<dsv>.  If C<ssv> is null, does nothing; otherwise modifies only C<dsv>.
If C<flags> include C<SV_GMAGIC> bit set, will call C<mg_get> on both SVs if
appropriate.  If C<flags> include C<SV_SMAGIC>, C<mg_set> will be called on
the modified SV afterward, if appropriate.  C<sv_catsv>, C<sv_catsv_nomg>,
and C<sv_catsv_mg> are implemented in terms of this function.

	void	sv_catsv_flags(SV *const dsv, SV *const ssv,
		               const I32 flags)','name' => 'sv_catsv_flags'},'str_to_version' => {'text' => '','name' => 'str_to_version'},'sv_derived_from' => {'text' => 'Exactly like L</sv_derived_from_pv>, but doesn\'t take a C<flags> parameter.

	bool	sv_derived_from(SV* sv, const char *const name)','name' => 'sv_derived_from'},'SvIOK_on' => {'text' => 'Tells an SV that it is an integer.

	void	SvIOK_on(SV* sv)','name' => 'SvIOK_on'},'sv_cmp_locale' => {'text' => 'Compares the strings in two SVs in a locale-aware manner.  Is UTF-8 and
\'use bytes\' aware, handles get magic, and will coerce its args to strings
if necessary.  See also C<sv_cmp>.

	I32	sv_cmp_locale(SV *const sv1, SV *const sv2)','name' => 'sv_cmp_locale'},'sv_catpvs' => {'text' => 'Like C<sv_catpvn>, but takes a literal string instead of a string/length pair.

	void	sv_catpvs(SV* sv, const char* s)','name' => 'sv_catpvs'},'set_numeric_standard' => {'text' => '','name' => 'set_numeric_standard'},'dSP' => {'text' => 'Declares a local copy of perl\'s stack pointer for the XSUB, available via
the C<SP> macro.  See C<SP>.

		dSP;','name' => 'dSP'},'Nullsv' => {'text' => 'Null SV pointer. (No longer available when C<PERL_CORE> is defined.)','name' => 'Nullsv'},'scan_vstring' => {'text' => '','name' => 'scan_vstring'},'ptr_table_new' => {'text' => '','name' => 'ptr_table_new'},'do_op_dump' => {'text' => '','name' => 'do_op_dump'},'foldEQ' => {'text' => 'Returns true if the leading len bytes of the strings s1 and s2 are the same
case-insensitively; false otherwise.  Uppercase and lowercase ASCII range bytes
match themselves and their opposite case counterparts.  Non-cased and non-ASCII
range bytes match only themselves.

	I32	foldEQ(const char* a, const char* b, I32 len)','name' => 'foldEQ'},'PerlIO_get_base' => {'text' => '','name' => 'PerlIO_get_base'},'SvPVX' => {'text' => 'Returns a pointer to the physical string in the SV.  The SV must contain a
string. Prior to 5.9.3 it is not safe to execute this macro unless the SV\'s
type >= SVt_PV.

This is also used to store the name of an autoloaded subroutine in an XS
AUTOLOAD routine.  See L<perlguts/Autoloading with XSUBs>.

	char*	SvPVX(SV* sv)','name' => 'SvPVX'},'av_top_index' => {'text' => 'Returns the highest index in the array.  The number of elements in the
array is C<av_top_index(av) + 1>.  Returns -1 if the array is empty.

The Perl equivalent for this is C<$#myarray>.

(A slightly shorter form is C<av_tindex>.)

	I32	av_top_index(AV *av)','name' => 'av_top_index'},'XPUSHi' => {'text' => 'Push an integer onto the stack, extending the stack if necessary.  Handles
\'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to
declare it.  Do not call multiple C<TARG>-oriented macros to return lists
from XSUB\'s - see C<mXPUSHi> instead.  See also C<PUSHi> and C<mPUSHi>.

	void	XPUSHi(IV iv)','name' => 'XPUSHi'},'debop' => {'text' => '','name' => 'debop'},'ref' => {'text' => '','name' => 'ref'},'sv_does_sv' => {'text' => 'Returns a boolean indicating whether the SV performs a specific, named role.
The SV can be a Perl object or the name of a Perl class.

	bool	sv_does_sv(SV* sv, SV* namesv, U32 flags)','name' => 'sv_does_sv'},'SvOOK_offset' => {'text' => 'Reads into I<len> the offset from SvPVX back to the true start of the
allocated buffer, which will be non-zero if C<sv_chop> has been used to
efficiently remove characters from start of the buffer.  Implemented as a
macro, which takes the address of I<len>, which must be of type C<STRLEN>.
Evaluates I<sv> more than once.  Sets I<len> to 0 if C<SvOOK(sv)> is false.

	void	SvOOK_offset(NN SV*sv, STRLEN len)','name' => 'SvOOK_offset'},'save_list' => {'text' => '','name' => 'save_list'},'SvTAINTED_on' => {'text' => 'Marks an SV as tainted if tainting is enabled.

	void	SvTAINTED_on(SV* sv)','name' => 'SvTAINTED_on'},'newGIVENOP' => {'text' => 'Constructs, checks, and returns an op tree expressing a C<given> block.
I<cond> supplies the expression that will be locally assigned to a lexical
variable, and I<block> supplies the body of the C<given> construct; they
are consumed by this function and become part of the constructed op tree.
I<defsv_off> is the pad offset of the scalar lexical variable that will
be affected.  If it is 0, the global $_ will be used.

	OP *	newGIVENOP(OP *cond, OP *block,
		           PADOFFSET defsv_off)','name' => 'newGIVENOP'},'sv_nolocking' => {'text' => 'Dummy routine which "locks" an SV when there is no locking module present.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

"Superseded" by sv_nosharing().

	void	sv_nolocking(SV *sv)','name' => 'sv_nolocking'},'parse_listexpr' => {'text' => 'Parse a Perl list expression.  This may contain operators of precedence
down to the comma operator.  The expression must be followed (and thus
terminated) either by a low-precedence logic operator such as C<or> or by
something that would normally terminate an expression such as semicolon.
If I<flags> includes C<PARSE_OPTIONAL> then the expression is optional,
otherwise it is mandatory.  It is up to the caller to ensure that the
dynamic parser state (L</PL_parser> et al) is correctly set to reflect
the source of the code to be parsed and the lexical context for the
expression.

The op tree representing the expression is returned.  If an optional
expression is absent, a null pointer is returned, otherwise the pointer
will be non-null.

If an error occurs in parsing or compilation, in most cases a valid op
tree is returned anyway.  The error is reflected in the parser state,
normally resulting in a single exception at the top level of parsing
which covers all the compilation errors that occurred.  Some compilation
errors, however, will throw an exception immediately.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_listexpr(U32 flags)','name' => 'parse_listexpr'},'ibcmp' => {'text' => 'This is a synonym for (! foldEQ())

	I32	ibcmp(const char* a, const char* b, I32 len)','name' => 'ibcmp'},'isWORDCHAR' => {'text' => 'Returns a boolean indicating whether the specified character is a character
that is a word character, analogous to what C<m/\\w/> and C<m/[[:word:]]/> match
in a regular expression.  A word character is an alphabetic character, a
decimal digit, a connecting punctuation character (such as an underscore), or
a "mark" character that attaches to one of those (like some sort of accent).
C<isALNUM()> is a synonym provided for backward compatibility, even though a
word character includes more than the standard C language meaning of
alphanumeric.
See the L<top of this section|/Character classes> for an explanation of variants
C<isWORDCHAR_A>, C<isWORDCHAR_L1>, C<isWORDCHAR_uni>, C<isWORDCHAR_utf8>,
C<isWORDCHAR_LC>, C<isWORDCHAR_LC_uvchr>, and C<isWORDCHAR_LC_utf8>.

	bool	isWORDCHAR(char ch)','name' => 'isWORDCHAR'},'strLT' => {'text' => 'Test two strings to see if the first, C<s1>, is less than the second,
C<s2>.  Returns true or false.

	bool	strLT(char* s1, char* s2)','name' => 'strLT'},'save_pushptr' => {'text' => '','name' => 'save_pushptr'},'save_clearsv' => {'text' => '','name' => 'save_clearsv'},'av_shift' => {'text' => 'Shifts an SV off the beginning of the
array.  Returns C<&PL_sv_undef> if the 
array is empty.

Perl equivalent: C<shift(@myarray);>

	SV*	av_shift(AV *av)','name' => 'av_shift'},'sv_setpvf_nocontext' => {'text' => '','name' => 'sv_setpvf_nocontext'},'HvENAMEUTF8' => {'text' => 'Returns true if the effective name is in UTF8 encoding.

	unsigned char HvENAMEUTF8(HV *stash)','name' => 'HvENAMEUTF8'},'sv_nounlocking' => {'text' => 'Dummy routine which "unlocks" an SV when there is no locking module present.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

"Superseded" by sv_nosharing().

	void	sv_nounlocking(SV *sv)','name' => 'sv_nounlocking'},'perl_clone_using' => {'text' => '','name' => 'perl_clone_using'},'PerlIO_context_layers' => {'text' => '','name' => 'PerlIO_context_layers'},'lex_unstuff' => {'text' => 'Discards text about to be lexed, from L</PL_parser-E<gt>bufptr> up to
I<ptr>.  Text following I<ptr> will be moved, and the buffer shortened.
This hides the discarded text from any lexing code that runs later,
as if the text had never appeared.

This is not the normal way to consume lexed text.  For that, use
L</lex_read_to>.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_unstuff(char *ptr)','name' => 'lex_unstuff'},'newSVpvf_nocontext' => {'text' => '','name' => 'newSVpvf_nocontext'},'SvUV_set' => {'text' => 'Set the value of the UV pointer in sv to val.  See C<SvIV_set>.

	void	SvUV_set(SV* sv, UV val)','name' => 'SvUV_set'},'rvpv_dup' => {'text' => '','name' => 'rvpv_dup'},'filter_read' => {'text' => '','name' => 'filter_read'},'ckwarn' => {'text' => '','name' => 'ckwarn'},'warner' => {'text' => '','name' => 'warner'},'savesharedsvpv' => {'text' => 'A version of C<savesharedpv()> which allocates the duplicate string in
memory which is shared between threads.

	char*	savesharedsvpv(SV *sv)','name' => 'savesharedsvpv'},'CopyD' => {'text' => 'Like C<Copy> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	CopyD(void* src, void* dest, int nitems, type)','name' => 'CopyD'},'sv_setiv_mg' => {'text' => 'Like C<sv_setiv>, but also handles \'set\' magic.

	void	sv_setiv_mg(SV *const sv, const IV i)','name' => 'sv_setiv_mg'},'sv_does_pvn' => {'text' => 'Like L</sv_does_sv>, but takes a string/length pair instead of an SV.

	bool	sv_does_pvn(SV* sv, const char *const name,
		            const STRLEN len, U32 flags)','name' => 'sv_does_pvn'},'newFOROP' => {'text' => 'Constructs, checks, and returns an op tree expressing a C<foreach>
loop (iteration through a list of values).  This is a heavyweight loop,
with structure that allows exiting the loop by C<last> and suchlike.

I<sv> optionally supplies the variable that will be aliased to each
item in turn; if null, it defaults to C<$_> (either lexical or global).
I<expr> supplies the list of values to iterate over.  I<block> supplies
the main body of the loop, and I<cont> optionally supplies a C<continue>
block that operates as a second half of the body.  All of these optree
inputs are consumed by this function and become part of the constructed
op tree.

I<flags> gives the eight bits of C<op_flags> for the C<leaveloop>
op and, shifted up eight bits, the eight bits of C<op_private> for
the C<leaveloop> op, except that (in both cases) some bits will be set
automatically.

	OP *	newFOROP(I32 flags, OP *sv, OP *expr, OP *block,
		         OP *cont)','name' => 'newFOROP'},'HvENAME' => {'text' => 'Returns the effective name of a stash, or NULL if there is none. The
effective name represents a location in the symbol table where this stash
resides. It is updated automatically when packages are aliased or deleted.
A stash that is no longer in the symbol table has no effective name. This
name is preferable to C<HvNAME> for use in MRO linearisations and isa
caches.

	char*	HvENAME(HV* stash)','name' => 'HvENAME'},'save_generic_svref' => {'text' => '','name' => 'save_generic_svref'},'savesharedpvn' => {'text' => 'A version of C<savepvn()> which allocates the duplicate string in memory
which is shared between threads. (With the specific difference that a NULL
pointer is not acceptable)

	char*	savesharedpvn(const char *const pv,
		              const STRLEN len)','name' => 'savesharedpvn'},'utf8_to_uvchr_buf' => {'text' => 'Returns the native code point of the first character in the string C<s> which
is assumed to be in UTF-8 encoding; C<send> points to 1 beyond the end of C<s>.
C<*retlen> will be set to the length, in bytes, of that character.

If C<s> does not point to a well-formed UTF-8 character and UTF8 warnings are
enabled, zero is returned and C<*retlen> is set (if C<retlen> isn\'t
NULL) to -1.  If those warnings are off, the computed value, if well-defined
(or the Unicode REPLACEMENT CHARACTER if not), is silently returned, and
C<*retlen> is set (if C<retlen> isn\'t NULL) so that (S<C<s> + C<*retlen>>) is
the next possible position in C<s> that could begin a non-malformed character.
See L</utf8n_to_uvuni> for details on when the REPLACEMENT CHARACTER is
returned.

	UV	utf8_to_uvchr_buf(const U8 *s, const U8 *send,
		                  STRLEN *retlen)','name' => 'utf8_to_uvchr_buf'},'SvCUR_set' => {'text' => 'Set the current length of the string which is in the SV.  See C<SvCUR>
and C<SvIV_set>.

	void	SvCUR_set(SV* sv, STRLEN len)','name' => 'SvCUR_set'},'SVt_NULL' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_NULL'},'sv_2pv' => {'text' => '','name' => 'sv_2pv'},'SvNOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a double.

	U32	SvNOK(SV* sv)','name' => 'SvNOK'},'mPUSHn' => {'text' => 'Push a double onto the stack.  The stack must have room for this element.
Does not use C<TARG>.  See also C<PUSHn>, C<mXPUSHn> and C<XPUSHn>.

	void	mPUSHn(NV nv)','name' => 'mPUSHn'},'pad_setsv' => {'text' => 'Set the value at offset I<po> in the current (compiling or executing) pad.
Use the macro PAD_SETSV() rather than calling this function directly.

	void	pad_setsv(PADOFFSET po, SV *sv)','name' => 'pad_setsv'},'sv_reset' => {'text' => 'Underlying implementation for the C<reset> Perl function.
Note that the perl-level function is vaguely deprecated.

	void	sv_reset(const char* s, HV *const stash)','name' => 'sv_reset'},'cophh_delete_pv' => {'text' => 'Like L</cophh_delete_pvn>, but takes a nul-terminated string instead of
a string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_delete_pv(const COPHH *cophh,
		                const char *key, U32 hash,
		                U32 flags)','name' => 'cophh_delete_pv'},'sv_2pv_flags' => {'text' => 'Returns a pointer to the string value of an SV, and sets *lp to its length.
If flags includes SV_GMAGIC, does an mg_get() first.  Coerces sv to a
string if necessary.  Normally invoked via the C<SvPV_flags> macro.
C<sv_2pv()> and C<sv_2pv_nomg> usually end up here too.

	char*	sv_2pv_flags(SV *const sv, STRLEN *const lp,
		             const I32 flags)','name' => 'sv_2pv_flags'},'push_scope' => {'text' => '','name' => 'push_scope'},'SvNVx' => {'text' => 'Coerces the given SV to a double and returns it.
Guarantees to evaluate C<sv> only once.  Only use
this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvNV>.

	NV	SvNVx(SV* sv)','name' => 'SvNVx'},'setdefout' => {'text' => 'Sets PL_defoutgv, the default file handle for output, to the passed in
typeglob. As PL_defoutgv "owns" a reference on its typeglob, the reference
count of the passed in typeglob is increased by one, and the reference count
of the typeglob that PL_defoutgv points to is decreased by one.

	void	setdefout(GV* gv)','name' => 'setdefout'},'form_nocontext' => {'text' => '','name' => 'form_nocontext'},'hv_store' => {'text' => 'Stores an SV in a hash.  The hash key is specified as C<key> and the
absolute value of C<klen> is the length of the key.  If C<klen> is
negative the key is assumed to be in UTF-8-encoded Unicode.  The
C<hash> parameter is the precomputed hash value; if it is zero then
Perl will compute it.

The return value will be
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

	SV**	hv_store(HV *hv, const char *key, I32 klen,
		         SV *val, U32 hash)','name' => 'hv_store'},'sys_intern_dup' => {'text' => '','name' => 'sys_intern_dup'},'do_binmode' => {'text' => '','name' => 'do_binmode'},'get_op_names' => {'text' => '','name' => 'get_op_names'},'cop_hints_fetch_sv' => {'text' => 'Like L</cop_hints_fetch_pvn>, but takes a Perl scalar instead of a
string/length pair.

	SV *	cop_hints_fetch_sv(const COP *cop, SV *key,
		                   U32 hash, U32 flags)','name' => 'cop_hints_fetch_sv'},'ck_entersub_args_proto_or_list' => {'text' => 'Performs the fixup of the arguments part of an C<entersub> op tree either
based on a subroutine prototype or using default list-context processing.
This is the standard treatment used on a subroutine call, not marked
with C<&>, where the callee can be identified at compile time.

I<protosv> supplies the subroutine prototype to be applied to the call,
or indicates that there is no prototype.  It may be a normal scalar,
in which case if it is defined then the string value will be used
as a prototype, and if it is undefined then there is no prototype.
Alternatively, for convenience, it may be a subroutine object (a C<CV*>
that has been cast to C<SV*>), of which the prototype will be used if it
has one.  The prototype (or lack thereof) supplied, in whichever form,
does not need to match the actual callee referenced by the op tree.

If the argument ops disagree with the prototype, for example by having
an unacceptable number of arguments, a valid op tree is returned anyway.
The error is reflected in the parser state, normally resulting in a single
exception at the top level of parsing which covers all the compilation
errors that occurred.  In the error message, the callee is referred to
by the name defined by the I<namegv> parameter.

	OP *	ck_entersub_args_proto_or_list(OP *entersubop,
		                               GV *namegv,
		                               SV *protosv)','name' => 'ck_entersub_args_proto_or_list'},'op_null' => {'text' => '','name' => 'op_null'},'hv_fetch_ent' => {'text' => 'Returns the hash entry which corresponds to the specified key in the hash.
C<hash> must be a valid precomputed hash number for the given C<key>, or 0
if you want the function to compute it.  IF C<lval> is set then the fetch
will be part of a store.  Make sure the return value is non-null before
accessing it.  The return value when C<hv> is a tied hash is a pointer to a
static location, so be sure to make a copy of the structure if you need to
store it somewhere.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	HE*	hv_fetch_ent(HV *hv, SV *keysv, I32 lval,
		             U32 hash)','name' => 'hv_fetch_ent'},'gv_fetchpvn_flags' => {'text' => '','name' => 'gv_fetchpvn_flags'},'ENTER' => {'text' => 'Opening bracket on a callback.  See C<LEAVE> and L<perlcall>.

		ENTER;','name' => 'ENTER'},'PL_sv_no' => {'text' => 'This is the C<false> SV.  See C<PL_sv_yes>.  Always refer to this as
C<&PL_sv_no>.

	SV	PL_sv_no','name' => 'PL_sv_no'},'Newx' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.

In 5.9.3, Newx() and friends replace the older New() API, and drops
the first parameter, I<x>, a debug aid which allowed callers to identify
themselves.  This aid has been superseded by a new build option,
PERL_MEM_LOG (see L<perlhacktips/PERL_MEM_LOG>).  The older API is still
there for use in XS modules supporting older perls.

	void	Newx(void* ptr, int nitems, type)','name' => 'Newx'},'newFORM' => {'text' => '','name' => 'newFORM'},'PUSHs' => {'text' => 'Push an SV onto the stack.  The stack must have room for this element.
Does not handle \'set\' magic.  Does not use C<TARG>.  See also C<PUSHmortal>,
C<XPUSHs> and C<XPUSHmortal>.

	void	PUSHs(SV* sv)','name' => 'PUSHs'},'sv_setuv' => {'text' => 'Copies an unsigned integer into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setuv_mg>.

	void	sv_setuv(SV *const sv, const UV num)','name' => 'sv_setuv'},'SvUPGRADE' => {'text' => 'Used to upgrade an SV to a more complex form.  Uses C<sv_upgrade> to
perform the upgrade if necessary.  See C<svtype>.

	void	SvUPGRADE(SV* sv, svtype type)','name' => 'SvUPGRADE'},'cv_clone' => {'text' => 'Clone a CV, making a lexical closure.  I<proto> supplies the prototype
of the function: its code, pad structure, and other attributes.
The prototype is combined with a capture of outer lexicals to which the
code refers, which are taken from the currently-executing instance of
the immediately surrounding code.

	CV *	cv_clone(CV *proto)','name' => 'cv_clone'},'do_aspawn' => {'text' => '','name' => 'do_aspawn'},'sv_pvn' => {'text' => 'A private implementation of the C<SvPV> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	char*	sv_pvn(SV *sv, STRLEN *lp)','name' => 'sv_pvn'},'do_openn' => {'text' => '','name' => 'do_openn'},'wrap_op_checker' => {'text' => 'Puts a C function into the chain of check functions for a specified op
type.  This is the preferred way to manipulate the L</PL_check> array.
I<opcode> specifies which type of op is to be affected.  I<new_checker>
is a pointer to the C function that is to be added to that opcode\'s
check chain, and I<old_checker_p> points to the storage location where a
pointer to the next function in the chain will be stored.  The value of
I<new_pointer> is written into the L</PL_check> array, while the value
previously stored there is written to I<*old_checker_p>.

L</PL_check> is global to an entire process, and a module wishing to
hook op checking may find itself invoked more than once per process,
typically in different threads.  To handle that situation, this function
is idempotent.  The location I<*old_checker_p> must initially (once
per process) contain a null pointer.  A C variable of static duration
(declared at file scope, typically also marked C<static> to give
it internal linkage) will be implicitly initialised appropriately,
if it does not have an explicit initialiser.  This function will only
actually modify the check chain if it finds I<*old_checker_p> to be null.
This function is also thread safe on the small scale.  It uses appropriate
locking to avoid race conditions in accessing L</PL_check>.

When this function is called, the function referenced by I<new_checker>
must be ready to be called, except for I<*old_checker_p> being unfilled.
In a threading situation, I<new_checker> may be called immediately,
even before this function has returned.  I<*old_checker_p> will always
be appropriately set before I<new_checker> is called.  If I<new_checker>
decides not to do anything special with an op that it is given (which
is the usual case for most uses of op check hooking), it must chain the
check function referenced by I<*old_checker_p>.

If you want to influence compilation of calls to a specific subroutine,
then use L</cv_set_call_checker> rather than hooking checking of all
C<entersub> ops.

	void	wrap_op_checker(Optype opcode,
		                Perl_check_t new_checker,
		                Perl_check_t *old_checker_p)','name' => 'wrap_op_checker'},'mro_get_from_name' => {'text' => '','name' => 'mro_get_from_name'},'sv_setref_iv' => {'text' => 'Copies an integer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_iv(SV *const rv,
		             const char *const classname,
		             const IV iv)','name' => 'sv_setref_iv'},'sv_chop' => {'text' => 'Efficient removal of characters from the beginning of the string buffer.
SvPOK(sv), or at least SvPOKp(sv), must be true and the C<ptr> must be a
pointer to somewhere inside the string buffer.  The C<ptr> becomes the first
character of the adjusted string.  Uses the "OOK hack".  On return, only
SvPOK(sv) and SvPOKp(sv) among the OK flags will be true.

Beware: after this function returns, C<ptr> and SvPVX_const(sv) may no longer
refer to the same chunk of data.

The unfortunate similarity of this function\'s name to that of Perl\'s C<chop>
operator is strictly coincidental.  This function works from the left;
C<chop> works from the right.

	void	sv_chop(SV *const sv, const char *const ptr)','name' => 'sv_chop'},'sv_backoff' => {'text' => 'Remove any string offset.  You should normally use the C<SvOOK_off> macro
wrapper instead.

	int	sv_backoff(SV *const sv)','name' => 'sv_backoff'},'reentrant_retry' => {'text' => '','name' => 'reentrant_retry'},'XPUSHu' => {'text' => 'Push an unsigned integer onto the stack, extending the stack if necessary.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to
return lists from XSUB\'s - see C<mXPUSHu> instead.  See also C<PUSHu> and
C<mPUSHu>.

	void	XPUSHu(UV uv)','name' => 'XPUSHu'},'sv_pvn_nomg' => {'text' => '','name' => 'sv_pvn_nomg'},'GvHV' => {'text' => 'Return the HV from the GV.

	HV*	GvHV(GV* gv)','name' => 'GvHV'},'stack_grow' => {'text' => '','name' => 'stack_grow'},'dump_mstats' => {'text' => '','name' => 'dump_mstats'},'newLOOPEX' => {'text' => 'Constructs, checks, and returns a loop-exiting op (such as C<goto>
or C<last>).  I<type> is the opcode.  I<label> supplies the parameter
determining the target of the op; it is consumed by this function and
becomes part of the constructed op tree.

	OP *	newLOOPEX(I32 type, OP *label)','name' => 'newLOOPEX'},'save_shared_pvref' => {'text' => '','name' => 'save_shared_pvref'},'PL_na' => {'text' => 'A convenience variable which is typically used with C<SvPV> when one
doesn\'t care about the length of the string.  It is usually more efficient
to either declare a local variable and use that instead or to use the
C<SvPV_nolen> macro.

	STRLEN	PL_na','name' => 'PL_na'},'newSViv' => {'text' => 'Creates a new SV and copies an integer into it.  The reference count for the
SV is set to 1.

	SV*	newSViv(const IV i)','name' => 'newSViv'},'gv_name_set' => {'text' => '','name' => 'gv_name_set'},'sv_untaint' => {'text' => 'Untaint an SV.  Use C<SvTAINTED_off> instead.

	void	sv_untaint(SV *const sv)','name' => 'sv_untaint'},'Newxz' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function.  The allocated
memory is zeroed with C<memzero>.  See also C<Newx>.

	void	Newxz(void* ptr, int nitems, type)','name' => 'Newxz'},'SVt_PVHV' => {'text' => 'Type flag for hashes.  See L</svtype>.','name' => 'SVt_PVHV'},'reentrant_init' => {'text' => '','name' => 'reentrant_init'},'save_pushptrptr' => {'text' => '','name' => 'save_pushptrptr'},'save_gp' => {'text' => '','name' => 'save_gp'},'parse_block' => {'text' => 'Parse a single complete Perl code block.  This consists of an opening
brace, a sequence of statements, and a closing brace.  The block
constitutes a lexical scope, so C<my> variables and various compile-time
effects can be contained within it.  It is up to the caller to ensure
that the dynamic parser state (L</PL_parser> et al) is correctly set to
reflect the source of the code to be parsed and the lexical context for
the statement.

The op tree representing the code block is returned.  This is always a
real op, never a null pointer.  It will normally be a C<lineseq> list,
including C<nextstate> or equivalent ops.  No ops to construct any kind
of runtime scope are included by virtue of it being a block.

If an error occurs in parsing or compilation, in most cases a valid op
tree (most likely null) is returned anyway.  The error is reflected in
the parser state, normally resulting in a single exception at the top
level of parsing which covers all the compilation errors that occurred.
Some compilation errors, however, will throw an exception immediately.

The I<flags> parameter is reserved for future use, and must always
be zero.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_block(U32 flags)','name' => 'parse_block'},'SvRX' => {'text' => 'Convenience macro to get the REGEXP from a SV. This is approximately
equivalent to the following snippet:

    if (SvMAGICAL(sv))
        mg_get(sv);
    if (SvROK(sv))
        sv = MUTABLE_SV(SvRV(sv));
    if (SvTYPE(sv) == SVt_REGEXP)
        return (REGEXP*) sv;

NULL will be returned if a REGEXP* is not found.

	REGEXP * SvRX(SV *sv)','name' => 'SvRX'},'newASSIGNOP' => {'text' => 'Constructs, checks, and returns an assignment op.  I<left> and I<right>
supply the parameters of the assignment; they are consumed by this
function and become part of the constructed op tree.

If I<optype> is C<OP_ANDASSIGN>, C<OP_ORASSIGN>, or C<OP_DORASSIGN>, then
a suitable conditional optree is constructed.  If I<optype> is the opcode
of a binary operator, such as C<OP_BIT_OR>, then an op is constructed that
performs the binary operation and assigns the result to the left argument.
Either way, if I<optype> is non-zero then I<flags> has no effect.

If I<optype> is zero, then a plain scalar or list assignment is
constructed.  Which type of assignment it is is automatically determined.
I<flags> gives the eight bits of C<op_flags>, except that C<OPf_KIDS>
will be set automatically, and, shifted up eight bits, the eight bits
of C<op_private>, except that the bit with value 1 or 2 is automatically
set as required.

	OP *	newASSIGNOP(I32 flags, OP *left, I32 optype,
		            OP *right)','name' => 'newASSIGNOP'},'SvSetMagicSV_nosteal' => {'text' => 'Like C<SvSetSV_nosteal>, but does any set magic required afterwards.

	void	SvSetMagicSV_nosteal(SV* dsv, SV* ssv)','name' => 'SvSetMagicSV_nosteal'},'hv_undef' => {'text' => 'Undefines the hash.  The XS equivalent of C<undef(%hash)>.

As well as freeing all the elements of the hash (like hv_clear()), this
also frees any auxiliary data and storage associated with the hash.

If any destructors are triggered as a result, the hv itself may
be freed.

See also L</hv_clear>.

	void	hv_undef(HV *hv)','name' => 'hv_undef'},'clone_params_del' => {'text' => '','name' => 'clone_params_del'},'sv_isobject' => {'text' => 'Returns a boolean indicating whether the SV is an RV pointing to a blessed
object.  If the SV is not an RV, or if the object is not blessed, then this
will return false.

	int	sv_isobject(SV* sv)','name' => 'sv_isobject'},'cop_hints_fetch_pvn' => {'text' => 'Look up the hint entry in the cop I<cop> with the key specified by
I<keypv> and I<keylen>.  If I<flags> has the C<COPHH_KEY_UTF8> bit set,
the key octets are interpreted as UTF-8, otherwise they are interpreted
as Latin-1.  I<hash> is a precomputed hash of the key string, or zero if
it has not been precomputed.  Returns a mortal scalar copy of the value
associated with the key, or C<&PL_sv_placeholder> if there is no value
associated with the key.

	SV *	cop_hints_fetch_pvn(const COP *cop,
		                    const char *keypv,
		                    STRLEN keylen, U32 hash,
		                    U32 flags)','name' => 'cop_hints_fetch_pvn'},'gv_efullname4' => {'text' => '','name' => 'gv_efullname4'},'SvIV' => {'text' => 'Coerces the given SV to an integer and returns it.  See C<SvIVx> for a
version which guarantees to evaluate sv only once.

	IV	SvIV(SV* sv)','name' => 'SvIV'},'isASCII' => {'text' => 'Returns a boolean indicating whether the specified character is one of the 128
characters in the ASCII character set, analogous to C<m/[[:ascii:]]/>.
On non-ASCII platforms, it returns TRUE iff this
character corresponds to an ASCII character.  Variants C<isASCII_A()> and
C<isASCII_L1()> are identical to C<isASCII()>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isASCII_uni>, C<isASCII_utf8>, C<isASCII_LC>, C<isASCII_LC_uvchr>, and
C<isASCII_LC_utf8>.  Note, however, that some platforms do not have the C
library routine C<isascii()>.  In these cases, the variants whose names contain
C<LC> are the same as the corresponding ones without.

	bool	isASCII(char ch)','name' => 'isASCII'},'PerlIO_eof' => {'text' => '','name' => 'PerlIO_eof'},'cop_hints_2hv' => {'text' => 'Generates and returns a standard Perl hash representing the full set of
hint entries in the cop I<cop>.  I<flags> is currently unused and must
be zero.

	HV *	cop_hints_2hv(const COP *cop, U32 flags)','name' => 'cop_hints_2hv'},'sv_collxfrm_flags' => {'text' => 'Add Collate Transform magic to an SV if it doesn\'t already have it.  If the
flags contain SV_GMAGIC, it handles get-magic.

Any scalar variable may carry PERL_MAGIC_collxfrm magic that contains the
scalar data of the variable, but transformed to such a format that a normal
memory comparison can be used to compare the data according to the locale
settings.

	char*	sv_collxfrm_flags(SV *const sv,
		                  STRLEN *const nxp,
		                  I32 const flags)','name' => 'sv_collxfrm_flags'},'sv_copypv_flags' => {'text' => 'Implementation of sv_copypv and sv_copypv_nomg.  Calls get magic iff flags
include SV_GMAGIC.

	void	sv_copypv_flags(SV *const dsv, SV *const ssv,
		                const I32 flags)','name' => 'sv_copypv_flags'},'sv_setref_uv' => {'text' => 'Copies an unsigned integer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_uv(SV *const rv,
		             const char *const classname,
		             const UV uv)','name' => 'sv_setref_uv'},'get_ppaddr' => {'text' => '','name' => 'get_ppaddr'},'ck_entersub_args_proto' => {'text' => 'Performs the fixup of the arguments part of an C<entersub> op tree
based on a subroutine prototype.  This makes various modifications to
the argument ops, from applying context up to inserting C<refgen> ops,
and checking the number and syntactic types of arguments, as directed by
the prototype.  This is the standard treatment used on a subroutine call,
not marked with C<&>, where the callee can be identified at compile time
and has a prototype.

I<protosv> supplies the subroutine prototype to be applied to the call.
It may be a normal defined scalar, of which the string value will be used.
Alternatively, for convenience, it may be a subroutine object (a C<CV*>
that has been cast to C<SV*>) which has a prototype.  The prototype
supplied, in whichever form, does not need to match the actual callee
referenced by the op tree.

If the argument ops disagree with the prototype, for example by having
an unacceptable number of arguments, a valid op tree is returned anyway.
The error is reflected in the parser state, normally resulting in a single
exception at the top level of parsing which covers all the compilation
errors that occurred.  In the error message, the callee is referred to
by the name defined by the I<namegv> parameter.

	OP *	ck_entersub_args_proto(OP *entersubop,
		                       GV *namegv, SV *protosv)','name' => 'ck_entersub_args_proto'},'getcwd_sv' => {'text' => 'Fill the sv with current working directory

	int	getcwd_sv(SV* sv)','name' => 'getcwd_sv'},'newSVpvs_share' => {'text' => 'Like C<newSVpvn_share>, but takes a literal string instead of a string/length
pair and omits the hash parameter.

	SV*	newSVpvs_share(const char* s)','name' => 'newSVpvs_share'},'newSVpv' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  If C<len> is zero, Perl will compute the length using
strlen().  For efficiency, consider using C<newSVpvn> instead.

	SV*	newSVpv(const char *const s, const STRLEN len)','name' => 'newSVpv'},'sv_2pvbyte' => {'text' => 'Return a pointer to the byte-encoded representation of the SV, and set *lp
to its length.  May cause the SV to be downgraded from UTF-8 as a
side-effect.

Usually accessed via the C<SvPVbyte> macro.

	char*	sv_2pvbyte(SV *sv, STRLEN *const lp)','name' => 'sv_2pvbyte'},'fbm_instr' => {'text' => 'Returns the location of the SV in the string delimited by C<big> and
C<bigend>.  It returns C<NULL> if the string can\'t be found.  The C<sv>
does not have to be fbm_compiled, but the search will not be as fast
then.

	char*	fbm_instr(unsigned char* big,
		          unsigned char* bigend, SV* littlestr,
		          U32 flags)','name' => 'fbm_instr'},'XPUSHn' => {'text' => 'Push a double onto the stack, extending the stack if necessary.  Handles
\'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to
declare it.  Do not call multiple C<TARG>-oriented macros to return lists
from XSUB\'s - see C<mXPUSHn> instead.  See also C<PUSHn> and C<mPUSHn>.

	void	XPUSHn(NV nv)','name' => 'XPUSHn'},'PL_opfreehook' => {'text' => 'When non-C<NULL>, the function pointed by this variable will be called each time an OP is freed with the corresponding OP as the argument.
This allows extensions to free any extra attribute they have locally attached to an OP.
It is also assured to first fire for the parent OP and then for its kids.

When you replace this variable, it is considered a good practice to store the possibly previously installed hook and that you recall it inside your own.

	Perl_ophook_t	PL_opfreehook','name' => 'PL_opfreehook'},'PadlistARRAY' => {'text' => 'The C array of a padlist, containing the pads.  Only subscript it with
numbers >= 1, as the 0th entry is not guaranteed to remain usable.

NOTE: this function is experimental and may change or be
removed without notice.

	PAD **	PadlistARRAY(PADLIST padlist)','name' => 'PadlistARRAY'},'dump_all' => {'text' => '','name' => 'dump_all'},'ninstr' => {'text' => '','name' => 'ninstr'},'sv_vcatpvf' => {'text' => 'Processes its arguments like C<vsprintf> and appends the formatted output
to an SV.  Does not handle \'set\' magic.  See C<sv_vcatpvf_mg>.

Usually used via its frontend C<sv_catpvf>.

	void	sv_vcatpvf(SV *const sv, const char *const pat,
		           va_list *const args)','name' => 'sv_vcatpvf'},'sv_pos_u2b' => {'text' => 'Converts the value pointed to by offsetp from a count of UTF-8 chars from
the start of the string, to a count of the equivalent number of bytes; if
lenp is non-zero, it does the same to lenp, but this time starting from
the offset, rather than from the start of the string.  Handles magic and
type coercion.

Use C<sv_pos_u2b_flags> in preference, which correctly handles strings longer
than 2Gb.

	void	sv_pos_u2b(SV *const sv, I32 *const offsetp,
		           I32 *const lenp)','name' => 'sv_pos_u2b'},'boolSV' => {'text' => 'Returns a true SV if C<b> is a true value, or a false SV if C<b> is 0.

See also C<PL_sv_yes> and C<PL_sv_no>.

	SV *	boolSV(bool b)','name' => 'boolSV'},'upg_version' => {'text' => 'In-place upgrade of the supplied SV to a version object.

    SV *sv = upg_version(SV *sv, bool qv);

Returns a pointer to the upgraded SV.  Set the boolean qv if you want
to force this SV to be interpreted as an "extended" version.

	SV*	upg_version(SV *ver, bool qv)','name' => 'upg_version'},'PERL_SYS_INIT3' => {'text' => 'Provides system-specific tune up of the C runtime environment necessary to
run Perl interpreters. This should be called only once, before creating
any Perl interpreters.

	void	PERL_SYS_INIT3(int *argc, char*** argv,
		               char*** env)','name' => 'PERL_SYS_INIT3'},'HeSVKEY_set' => {'text' => 'Sets the key to a given C<SV*>, taking care to set the appropriate flags to
indicate the presence of an C<SV*> key, and returns the same
C<SV*>.

	SV*	HeSVKEY_set(HE* he, SV* sv)','name' => 'HeSVKEY_set'},'sv_derived_from_sv' => {'text' => 'Exactly like L</sv_derived_from_pvn>, but takes the name string in the form
of an SV instead of a string/length pair.

	bool	sv_derived_from_sv(SV* sv, SV *namesv,
		                   U32 flags)','name' => 'sv_derived_from_sv'},'SPAGAIN' => {'text' => 'Refetch the stack pointer.  Used after a callback.  See L<perlcall>.

		SPAGAIN;','name' => 'SPAGAIN'},'newCVREF' => {'text' => '','name' => 'newCVREF'},'gv_init_sv' => {'text' => 'Same as gv_init_pvn(), but takes an SV * for the name instead of separate
char * and length parameters.  C<flags> is currently unused.

	void	gv_init_sv(GV* gv, HV* stash, SV* namesv,
		           U32 flags)','name' => 'gv_init_sv'},'my_bcopy' => {'text' => '','name' => 'my_bcopy'},'PL_parser-E<gt>bufptr' => {'text' => 'Points to the current position of lexing inside the lexer buffer.
Characters around this point may be freely examined, within
the range delimited by C<SvPVX(L</PL_parser-E<gt>linestr>)> and
L</PL_parser-E<gt>bufend>.  The octets of the buffer may be intended to be
interpreted as either UTF-8 or Latin-1, as indicated by L</lex_bufutf8>.

Lexing code (whether in the Perl core or not) moves this pointer past
the characters that it consumes.  It is also expected to perform some
bookkeeping whenever a newline character is consumed.  This movement
can be more conveniently performed by the function L</lex_read_to>,
which handles newlines appropriately.

Interpretation of the buffer\'s octets can be abstracted out by
using the slightly higher-level functions L</lex_peek_unichar> and
L</lex_read_unichar>.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_parser-E<gt>bufptr'},'G_NOARGS' => {'text' => 'Indicates that no arguments are being sent to a callback.  See
L<perlcall>.','name' => 'G_NOARGS'},'amagic_deref_call' => {'text' => '','name' => 'amagic_deref_call'},'lex_start' => {'text' => 'Creates and initialises a new lexer/parser state object, supplying
a context in which to lex and parse from a new source of Perl code.
A pointer to the new state object is placed in L</PL_parser>.  An entry
is made on the save stack so that upon unwinding the new state object
will be destroyed and the former value of L</PL_parser> will be restored.
Nothing else need be done to clean up the parsing context.

The code to be parsed comes from I<line> and I<rsfp>.  I<line>, if
non-null, provides a string (in SV form) containing code to be parsed.
A copy of the string is made, so subsequent modification of I<line>
does not affect parsing.  I<rsfp>, if non-null, provides an input stream
from which code will be read to be parsed.  If both are non-null, the
code in I<line> comes first and must consist of complete lines of input,
and I<rsfp> supplies the remainder of the source.

The I<flags> parameter is reserved for future use.  Currently it is only
used by perl internally, so extensions should always pass zero.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_start(SV *line, PerlIO *rsfp, U32 flags)','name' => 'lex_start'},'hv_riter_set' => {'text' => '','name' => 'hv_riter_set'},'gv_autoload_pvn' => {'text' => '','name' => 'gv_autoload_pvn'},'gv_autoload_pv' => {'text' => '','name' => 'gv_autoload_pv'},'dounwind' => {'text' => '','name' => 'dounwind'},'ptr_table_clear' => {'text' => '','name' => 'ptr_table_clear'},'uvchr_to_utf8_flags' => {'text' => '','name' => 'uvchr_to_utf8_flags'},'save_hash' => {'text' => '','name' => 'save_hash'},'sv_isa' => {'text' => 'Returns a boolean indicating whether the SV is blessed into the specified
class.  This does not check for subtypes; use C<sv_derived_from> to verify
an inheritance relationship.

	int	sv_isa(SV* sv, const char *const name)','name' => 'sv_isa'},'cophh_free' => {'text' => 'Discard the cop hints hash I<cophh>, freeing all resources associated
with it.

NOTE: this function is experimental and may change or be
removed without notice.

	void	cophh_free(COPHH *cophh)','name' => 'cophh_free'},'isXDIGIT' => {'text' => 'Returns a boolean indicating whether the specified character is a hexadecimal
digit.  In the ASCII range these are C<[0-9A-Fa-f]>.  Variants C<isXDIGIT_A()>
and C<isXDIGIT_L1()> are identical to C<isXDIGIT()>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isXDIGIT_uni>, C<isXDIGIT_utf8>, C<isXDIGIT_LC>, C<isXDIGIT_LC_uvchr>, and
C<isXDIGIT_LC_utf8>.

	bool	isXDIGIT(char ch)','name' => 'isXDIGIT'},'sv_catpvf' => {'text' => 'Processes its arguments like C<sprintf> and appends the formatted
output to an SV.  If the appended data contains "wide" characters
(including, but not limited to, SVs with a UTF-8 PV formatted with %s,
and characters >255 formatted with %c), the original SV might get
upgraded to UTF-8.  Handles \'get\' magic, but not \'set\' magic.  See
C<sv_catpvf_mg>.  If the original SV was UTF-8, the pattern should be
valid UTF-8; if the original SV was bytes, the pattern should be too.

	void	sv_catpvf(SV *const sv, const char *const pat,
		          ...)','name' => 'sv_catpvf'},'cop_fetch_label' => {'text' => 'Returns the label attached to a cop.
The flags pointer may be set to C<SVf_UTF8> or 0.

NOTE: this function is experimental and may change or be
removed without notice.

	const char * cop_fetch_label(COP *const cop,
	                             STRLEN *len, U32 *flags)','name' => 'cop_fetch_label'},'XSRETURN_PV' => {'text' => 'Return a copy of a string from an XSUB immediately.  Uses C<XST_mPV>.

	void	XSRETURN_PV(char* str)','name' => 'XSRETURN_PV'},'utf8_to_uvuni' => {'text' => 'DEPRECATED!

Returns the Unicode code point of the first character in the string C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

This function should only be used when the returned UV is considered
an index into the Unicode semantic tables (e.g. swashes).

Some, but not all, UTF-8 malformations are detected, and in fact, some
malformed input could cause reading beyond the end of the input buffer, which
is why this function is deprecated.  Use L</utf8_to_uvuni_buf> instead.

If C<s> points to one of the detected malformations, and UTF8 warnings are
enabled, zero is returned and C<*retlen> is set (if C<retlen> doesn\'t point to
NULL) to -1.  If those warnings are off, the computed value if well-defined (or
the Unicode REPLACEMENT CHARACTER, if not) is silently returned, and C<*retlen>
is set (if C<retlen> isn\'t NULL) so that (S<C<s> + C<*retlen>>) is the
next possible position in C<s> that could begin a non-malformed character.
See L</utf8n_to_uvuni> for details on when the REPLACEMENT CHARACTER is returned.

	UV	utf8_to_uvuni(const U8 *s, STRLEN *retlen)','name' => 'utf8_to_uvuni'},'pad_alloc' => {'text' => 'Allocates a place in the currently-compiling pad,
returning the offset of the allocated pad slot.
No name is initially attached to the pad slot.
I<tmptype> is a set of flags indicating the kind of pad entry required,
which will be set in the value SV for the allocated pad entry:

    SVs_PADMY    named lexical variable ("my", "our", "state")
    SVs_PADTMP   unnamed temporary store

I<optype> should be an opcode indicating the type of operation that the
pad entry is to support.  This doesn\'t affect operational semantics,
but is used for debugging.

NOTE: this function is experimental and may change or be
removed without notice.

	PADOFFSET pad_alloc(I32 optype, U32 tmptype)','name' => 'pad_alloc'},'av_fill' => {'text' => 'Set the highest index in the array to the given number, equivalent to
Perl\'s C<$#array = $fill;>.

The number of elements in the an array will be C<fill + 1> after
av_fill() returns.  If the array was previously shorter, then the
additional elements appended are set to C<PL_sv_undef>.  If the array
was longer, then the excess elements are freed.  C<av_fill(av, -1)> is
the same as C<av_clear(av)>.

	void	av_fill(AV *av, I32 fill)','name' => 'av_fill'},'croak_sv' => {'text' => 'This is an XS interface to Perl\'s C<die> function.

C<baseex> is the error message or object.  If it is a reference, it
will be used as-is.  Otherwise it is used as a string, and if it does
not end with a newline then it will be extended with some indication of
the current location in the code, as described for L</mess_sv>.

The error message or object will be used as an exception, by default
returning control to the nearest enclosing C<eval>, but subject to
modification by a C<$SIG{__DIE__}> handler.  In any case, the C<croak_sv>
function never returns normally.

To die with a simple string message, the L</croak> function may be
more convenient.

	void	croak_sv(SV *baseex)','name' => 'croak_sv'},'warn_nocontext' => {'text' => '','name' => 'warn_nocontext'},'my_swap' => {'text' => '','name' => 'my_swap'},'SvIOK_only' => {'text' => 'Tells an SV that it is an integer and disables all other OK bits.

	void	SvIOK_only(SV* sv)','name' => 'SvIOK_only'},'MoveD' => {'text' => 'Like C<Move> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	MoveD(void* src, void* dest, int nitems, type)','name' => 'MoveD'},'gv_IOadd' => {'text' => '','name' => 'gv_IOadd'},'grok_bin' => {'text' => 'converts a string representing a binary number to numeric form.

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

	UV	grok_bin(const char* start, STRLEN* len_p,
		         I32* flags, NV *result)','name' => 'grok_bin'},'parse_barestmt' => {'text' => 'Parse a single unadorned Perl statement.  This may be a normal imperative
statement or a declaration that has compile-time effect.  It does not
include any label or other affixture.  It is up to the caller to ensure
that the dynamic parser state (L</PL_parser> et al) is correctly set to
reflect the source of the code to be parsed and the lexical context for
the statement.

The op tree representing the statement is returned.  This may be a
null pointer if the statement is null, for example if it was actually
a subroutine definition (which has compile-time side effects).  If not
null, it will be ops directly implementing the statement, suitable to
pass to L</newSTATEOP>.  It will not normally include a C<nextstate> or
equivalent op (except for those embedded in a scope contained entirely
within the statement).

If an error occurs in parsing or compilation, in most cases a valid op
tree (most likely null) is returned anyway.  The error is reflected in
the parser state, normally resulting in a single exception at the top
level of parsing which covers all the compilation errors that occurred.
Some compilation errors, however, will throw an exception immediately.

The I<flags> parameter is reserved for future use, and must always
be zero.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_barestmt(U32 flags)','name' => 'parse_barestmt'},'cast_uv' => {'text' => '','name' => 'cast_uv'},'perl_free' => {'text' => 'Releases a Perl interpreter.  See L<perlembed>.

	void	perl_free(PerlInterpreter *my_perl)','name' => 'perl_free'},'mg_find' => {'text' => 'Finds the magic pointer for type matching the SV.  See C<sv_magic>.

	MAGIC*	mg_find(const SV* sv, int type)','name' => 'mg_find'},'safesysfree' => {'text' => '','name' => 'safesysfree'},'PL_parser-E<gt>linestr' => {'text' => 'Buffer scalar containing the chunk currently under consideration of the
text currently being lexed.  This is always a plain string scalar (for
which C<SvPOK> is true).  It is not intended to be used as a scalar by
normal scalar means; instead refer to the buffer directly by the pointer
variables described below.

The lexer maintains various C<char*> pointers to things in the
C<PL_parser-E<gt>linestr> buffer.  If C<PL_parser-E<gt>linestr> is ever
reallocated, all of these pointers must be updated.  Don\'t attempt to
do this manually, but rather use L</lex_grow_linestr> if you need to
reallocate the buffer.

The content of the text chunk in the buffer is commonly exactly one
complete line of input, up to and including a newline terminator,
but there are situations where it is otherwise.  The octets of the
buffer may be intended to be interpreted as either UTF-8 or Latin-1.
The function L</lex_bufutf8> tells you which.  Do not use the C<SvUTF8>
flag on this scalar, which may disagree with it.

For direct examination of the buffer, the variable
L</PL_parser-E<gt>bufend> points to the end of the buffer.  The current
lexing position is pointed to by L</PL_parser-E<gt>bufptr>.  Direct use
of these pointers is usually preferable to examination of the scalar
through normal scalar means.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_parser-E<gt>linestr'},'BhkENTRY_set' => {'text' => 'Set an entry in the BHK structure, and set the flags to indicate it is
valid. I<which> is a preprocessing token indicating which entry to set.
The type of I<ptr> depends on the entry.

NOTE: this function is experimental and may change or be
removed without notice.

	void	BhkENTRY_set(BHK *hk, which, void *ptr)','name' => 'BhkENTRY_set'},'hv_riter_p' => {'text' => '','name' => 'hv_riter_p'},'newSVpvn_share' => {'text' => 'Creates a new SV with its SvPVX_const pointing to a shared string in the string
table.  If the string does not already exist in the table, it is
created first.  Turns on the SvIsCOW flag (or READONLY
and FAKE in 5.16 and earlier).  If the C<hash> parameter
is non-zero, that value is used; otherwise the hash is computed.
The string\'s hash can later be retrieved from the SV
with the C<SvSHARED_HASH()> macro.  The idea here is
that as the string table is used for shared hash keys these strings will have
SvPVX_const == HeKEY and hash lookup will avoid string compare.

	SV*	newSVpvn_share(const char* s, I32 len, U32 hash)','name' => 'newSVpvn_share'},'mro_set_mro' => {'text' => '','name' => 'mro_set_mro'},'SvPOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a character string.
Checks the B<private> setting.  Use C<SvPOK> instead.

	U32	SvPOKp(SV* sv)','name' => 'SvPOKp'},'pregfree2' => {'text' => '','name' => 'pregfree2'},'sv_catpvn' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.  The
C<len> indicates number of bytes to copy.  If the SV has the UTF-8
status set, then the bytes appended should be valid UTF-8.
Handles \'get\' magic, but not \'set\' magic.  See C<sv_catpvn_mg>.

	void	sv_catpvn(SV *dsv, const char *sstr, STRLEN len)','name' => 'sv_catpvn'},'my_socketpair' => {'text' => '','name' => 'my_socketpair'},'blockhook_register' => {'text' => 'Register a set of hooks to be called when the Perl lexical scope changes
at compile time. See L<perlguts/"Compile-time scope hooks">.

NOTE: this function is experimental and may change or be
removed without notice.

NOTE: this function must be explicitly called as Perl_blockhook_register with an aTHX_ parameter.

	void	Perl_blockhook_register(pTHX_ BHK *hk)','name' => 'blockhook_register'},'init_global_struct' => {'text' => '','name' => 'init_global_struct'},'find_rundefsv' => {'text' => 'Find and return the variable that is named C<$_> in the lexical scope
of the currently-executing function.  This may be a lexical C<$_>,
or will otherwise be the global one.

	SV *	find_rundefsv()','name' => 'find_rundefsv'},'sv_utf8_downgrade' => {'text' => 'Attempts to convert the PV of an SV from characters to bytes.
If the PV contains a character that cannot fit
in a byte, this conversion will fail;
in this case, either returns false or, if C<fail_ok> is not
true, croaks.

This is not a general purpose Unicode to byte encoding interface:
use the Encode extension for that.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	sv_utf8_downgrade(SV *const sv,
		                  const bool fail_ok)','name' => 'sv_utf8_downgrade'},'utf8_hop' => {'text' => 'Return the UTF-8 pointer C<s> displaced by C<off> characters, either
forward or backward.

WARNING: do not use the following unless you *know* C<off> is within
the UTF-8 data pointed to by C<s> *and* that on entry C<s> is aligned
on the first byte of character or just after the last byte of a character.

	U8*	utf8_hop(const U8 *s, I32 off)','name' => 'utf8_hop'},'newPROG' => {'text' => '','name' => 'newPROG'},'sv_setref_pvn' => {'text' => 'Copies a string into a new SV, optionally blessing the SV.  The length of the
string must be specified with C<n>.  The C<rv> argument will be upgraded to
an RV.  That RV will be modified to point to the new SV.  The C<classname>
argument indicates the package for the blessing.  Set C<classname> to
C<NULL> to avoid the blessing.  The new SV will have a reference count
of 1, and the RV will be returned.

Note that C<sv_setref_pv> copies the pointer while this copies the string.

	SV*	sv_setref_pvn(SV *const rv,
		              const char *const classname,
		              const char *const pv,
		              const STRLEN n)','name' => 'sv_setref_pvn'},'SVt_PVMG' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_PVMG'},'gv_fetchsv' => {'text' => '','name' => 'gv_fetchsv'},'PUSHp' => {'text' => 'Push a string onto the stack.  The stack must have room for this element.
The C<len> indicates the length of the string.  Handles \'set\' magic.  Uses
C<TARG>, so C<dTARGET> or C<dXSTARG> should be called to declare it.  Do not
call multiple C<TARG>-oriented macros to return lists from XSUB\'s - see
C<mPUSHp> instead.  See also C<XPUSHp> and C<mXPUSHp>.

	void	PUSHp(char* str, STRLEN len)','name' => 'PUSHp'},'my_strftime' => {'text' => '','name' => 'my_strftime'},'mXPUSHi' => {'text' => 'Push an integer onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHi>, C<mPUSHi> and C<PUSHi>.

	void	mXPUSHi(IV iv)','name' => 'mXPUSHi'},'PL_sv_undef' => {'text' => 'This is the C<undef> SV.  Always refer to this as C<&PL_sv_undef>.

	SV	PL_sv_undef','name' => 'PL_sv_undef'},'hv_iterkeysv' => {'text' => 'Returns the key as an C<SV*> from the current position of the hash
iterator.  The return value will always be a mortal copy of the key.  Also
see C<hv_iterinit>.

	SV*	hv_iterkeysv(HE* entry)','name' => 'hv_iterkeysv'},'sv_catpv_flags' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.
If the SV has the UTF-8 status set, then the bytes appended should
be valid UTF-8.  If C<flags> has the C<SV_SMAGIC> bit set, will C<mg_set>
on the modified SV if appropriate.

	void	sv_catpv_flags(SV *dstr, const char *sstr,
		               const I32 flags)','name' => 'sv_catpv_flags'},'mPUSHp' => {'text' => 'Push a string onto the stack.  The stack must have room for this element.
The C<len> indicates the length of the string.  Does not use C<TARG>.
See also C<PUSHp>, C<mXPUSHp> and C<XPUSHp>.

	void	mPUSHp(char* str, STRLEN len)','name' => 'mPUSHp'},'lex_stuff_pv' => {'text' => 'Insert characters into the lexer buffer (L</PL_parser-E<gt>linestr>),
immediately after the current lexing point (L</PL_parser-E<gt>bufptr>),
reallocating the buffer if necessary.  This means that lexing code that
runs later will see the characters as if they had appeared in the input.
It is not recommended to do this as part of normal parsing, and most
uses of this facility run the risk of the inserted characters being
interpreted in an unintended manner.

The string to be inserted is represented by octets starting at I<pv>
and continuing to the first nul.  These octets are interpreted as either
UTF-8 or Latin-1, according to whether the C<LEX_STUFF_UTF8> flag is set
in I<flags>.  The characters are recoded for the lexer buffer, according
to how the buffer is currently being interpreted (L</lex_bufutf8>).
If it is not convenient to nul-terminate a string to be inserted, the
L</lex_stuff_pvn> function is more appropriate.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_stuff_pv(const char *pv, U32 flags)','name' => 'lex_stuff_pv'},'av_delete' => {'text' => 'Deletes the element indexed by C<key> from the array, makes the element mortal,
and returns it.  If C<flags> equals C<G_DISCARD>, the element is freed and null
is returned.  Perl equivalent: C<my $elem = delete($myarray[$idx]);> for the
non-C<G_DISCARD> version and a void-context C<delete($myarray[$idx]);> for the
C<G_DISCARD> version.

	SV*	av_delete(AV *av, I32 key, I32 flags)','name' => 'av_delete'},'utf8_distance' => {'text' => 'Returns the number of UTF-8 characters between the UTF-8 pointers C<a>
and C<b>.

WARNING: use only if you *know* that the pointers point inside the
same UTF-8 buffer.

	IV	utf8_distance(const U8 *a, const U8 *b)','name' => 'utf8_distance'},'SvPV_nomg' => {'text' => 'Like C<SvPV> but doesn\'t process magic.

	char*	SvPV_nomg(SV* sv, STRLEN len)','name' => 'SvPV_nomg'},'parser_dup' => {'text' => '','name' => 'parser_dup'},'SVt_PVLV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_PVLV'},'do_sprintf' => {'text' => '','name' => 'do_sprintf'},'SvUV_nomg' => {'text' => 'Like C<SvUV> but doesn\'t process magic.

	UV	SvUV_nomg(SV* sv)','name' => 'SvUV_nomg'},'save_I32' => {'text' => '','name' => 'save_I32'},'gv_autoload4' => {'text' => '','name' => 'gv_autoload4'},'POPpx' => {'text' => 'Pops a string off the stack.  Identical to POPp.  There are two names for
historical reasons.

	char*	POPpx','name' => 'POPpx'},'PL_modglobal' => {'text' => 'C<PL_modglobal> is a general purpose, interpreter global HV for use by
extensions that need to keep information on a per-interpreter basis.
In a pinch, it can also be used as a symbol table for extensions
to share data among each other.  It is a good idea to use keys
prefixed by the package name of the extension that owns the data.

	HV*	PL_modglobal','name' => 'PL_modglobal'},'newCONDOP' => {'text' => 'Constructs, checks, and returns a conditional-expression (C<cond_expr>)
op.  I<flags> gives the eight bits of C<op_flags>, except that C<OPf_KIDS>
will be set automatically, and, shifted up eight bits, the eight bits of
C<op_private>, except that the bit with value 1 is automatically set.
I<first> supplies the expression selecting between the two branches,
and I<trueop> and I<falseop> supply the branches; they are consumed by
this function and become part of the constructed op tree.

	OP *	newCONDOP(I32 flags, OP *first, OP *trueop,
		          OP *falseop)','name' => 'newCONDOP'},'save_pushi32ptr' => {'text' => '','name' => 'save_pushi32ptr'},'sv_setpvs' => {'text' => 'Like C<sv_setpvn>, but takes a literal string instead of a string/length pair.

	void	sv_setpvs(SV* sv, const char* s)','name' => 'sv_setpvs'},'cxinc' => {'text' => '','name' => 'cxinc'},'SvUVx' => {'text' => 'Coerces the given SV to an unsigned integer and
returns it.  Guarantees to evaluate C<sv> only once.  Only
use this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvUV>.

	UV	SvUVx(SV* sv)','name' => 'SvUVx'},'SvROK_on' => {'text' => 'Tells an SV that it is an RV.

	void	SvROK_on(SV* sv)','name' => 'SvROK_on'},'G_VOID' => {'text' => 'Used to indicate void context.  See C<GIMME_V> and L<perlcall>.','name' => 'G_VOID'},'sv_clear' => {'text' => 'Clear an SV: call any destructors, free up any memory used by the body,
and free the body itself.  The SV\'s head is I<not> freed, although
its type is set to all 1\'s so that it won\'t inadvertently be assumed
to be live during global destruction etc.
This function should only be called when REFCNT is zero.  Most of the time
you\'ll want to call C<sv_free()> (or its macro wrapper C<SvREFCNT_dec>)
instead.

	void	sv_clear(SV *const orig_sv)','name' => 'sv_clear'},'lex_read_space' => {'text' => 'Reads optional spaces, in Perl style, in the text currently being
lexed.  The spaces may include ordinary whitespace characters and
Perl-style comments.  C<#line> directives are processed if encountered.
L</PL_parser-E<gt>bufptr> is moved past the spaces, so that it points
at a non-space character (or the end of the input text).

If spaces extend into the next chunk of input text, the next chunk will
be read in.  Normally the current chunk will be discarded at the same
time, but if I<flags> includes C<LEX_KEEP_PREVIOUS> then the current
chunk will not be discarded.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_read_space(U32 flags)','name' => 'lex_read_space'},'SvGAMAGIC' => {'text' => 'Returns true if the SV has get magic or
overloading.  If either is true then
the scalar is active data, and has the potential to return a new value every
time it is accessed.  Hence you must be careful to
only read it once per user logical operation and work
with that returned value.  If neither is true then
the scalar\'s value cannot change unless written to.

	U32	SvGAMAGIC(SV* sv)','name' => 'SvGAMAGIC'},'XSRETURN_NV' => {'text' => 'Return a double from an XSUB immediately.  Uses C<XST_mNV>.

	void	XSRETURN_NV(NV nv)','name' => 'XSRETURN_NV'},'svtype' => {'text' => 'An enum of flags for Perl types.  These are found in the file B<sv.h>
in the C<svtype> enum.  Test these flags with the C<SvTYPE> macro.

The types are:

    SVt_NULL
    SVt_BIND (unused)
    SVt_IV
    SVt_NV
    SVt_RV
    SVt_PV
    SVt_PVIV
    SVt_PVNV
    SVt_PVMG
    SVt_REGEXP
    SVt_PVGV
    SVt_PVLV
    SVt_PVAV
    SVt_PVHV
    SVt_PVCV
    SVt_PVFM
    SVt_PVIO

These are most easily explained from the bottom up.

SVt_PVIO is for I/O objects, SVt_PVFM for formats, SVt_PVCV for
subroutines, SVt_PVHV for hashes and SVt_PVAV for arrays.

All the others are scalar types, that is, things that can be bound to a
C<$> variable.  For these, the internal types are mostly orthogonal to
types in the Perl language.

Hence, checking C<< SvTYPE(sv) < SVt_PVAV >> is the best way to see whether
something is a scalar.

SVt_PVGV represents a typeglob.  If !SvFAKE(sv), then it is a real,
incoercible typeglob.  If SvFAKE(sv), then it is a scalar to which a
typeglob has been assigned.  Assigning to it again will stop it from being
a typeglob.  SVt_PVLV represents a scalar that delegates to another scalar
behind the scenes.  It is used, e.g., for the return value of C<substr> and
for tied hash and array elements.  It can hold any scalar value, including
a typeglob. SVt_REGEXP is for regular expressions.

SVt_PVMG represents a "normal" scalar (not a typeglob, regular expression,
or delegate).  Since most scalars do not need all the internal fields of a
PVMG, we save memory by allocating smaller structs when possible.  All the
other types are just simpler forms of SVt_PVMG, with fewer internal fields.
 SVt_NULL can only hold undef.  SVt_IV can hold undef, an integer, or a
reference.  (SVt_RV is an alias for SVt_IV, which exists for backward
compatibility.)  SVt_NV can hold any of those or a double.  SVt_PV can only
hold undef or a string.  SVt_PVIV is a superset of SVt_PV and SVt_IV.
SVt_PVNV is similar.  SVt_PVMG can hold anything SVt_PVNV can hold, but it
can, but does not have to, be blessed or magical.','name' => 'svtype'},'hv_placeholders_get' => {'text' => '','name' => 'hv_placeholders_get'},'load_module' => {'text' => 'Loads the module whose name is pointed to by the string part of name.
Note that the actual module name, not its filename, should be given.
Eg, "Foo::Bar" instead of "Foo/Bar.pm".  flags can be any of
PERL_LOADMOD_DENY, PERL_LOADMOD_NOIMPORT, or PERL_LOADMOD_IMPORT_OPS
(or 0 for no flags). ver, if specified and not NULL, provides version semantics
similar to C<use Foo::Bar VERSION>.  The optional trailing SV*
arguments can be used to specify arguments to the module\'s import()
method, similar to C<use Foo::Bar VERSION LIST>.  They must be
terminated with a final NULL pointer.  Note that this list can only
be omitted when the PERL_LOADMOD_NOIMPORT flag has been used.
Otherwise at least a single NULL pointer to designate the default
import list is required.

The reference count for each specified C<SV*> parameter is decremented.

	void	load_module(U32 flags, SV* name, SV* ver, ...)','name' => 'load_module'},'dump_eval' => {'text' => '','name' => 'dump_eval'},'Poison' => {'text' => 'PoisonWith(0xEF) for catching access to freed memory.

	void	Poison(void* dest, int nitems, type)','name' => 'Poison'},'sv_catpvf_mg' => {'text' => 'Like C<sv_catpvf>, but also handles \'set\' magic.

	void	sv_catpvf_mg(SV *const sv,
		             const char *const pat, ...)','name' => 'sv_catpvf_mg'},'get_sv' => {'text' => 'Returns the SV of the specified Perl scalar.  C<flags> are passed to
C<gv_fetchpv>. If C<GV_ADD> is set and the
Perl variable does not exist then it will be created.  If C<flags> is zero
and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	SV*	get_sv(const char *name, I32 flags)','name' => 'get_sv'},'warn_sv' => {'text' => 'This is an XS interface to Perl\'s C<warn> function.

C<baseex> is the error message or object.  If it is a reference, it
will be used as-is.  Otherwise it is used as a string, and if it does
not end with a newline then it will be extended with some indication of
the current location in the code, as described for L</mess_sv>.

The error message or object will by default be written to standard error,
but this is subject to modification by a C<$SIG{__WARN__}> handler.

To warn with a simple string message, the L</warn> function may be
more convenient.

	void	warn_sv(SV *baseex)','name' => 'warn_sv'},'GetVars' => {'text' => '','name' => 'GetVars'},'do_hv_dump' => {'text' => '','name' => 'do_hv_dump'},'sv_setpv_mg' => {'text' => 'Like C<sv_setpv>, but also handles \'set\' magic.

	void	sv_setpv_mg(SV *const sv, const char *const ptr)','name' => 'sv_setpv_mg'},'whichsig' => {'text' => '','name' => 'whichsig'},'lex_next_chunk' => {'text' => 'Reads in the next chunk of text to be lexed, appending it to
L</PL_parser-E<gt>linestr>.  This should be called when lexing code has
looked to the end of the current chunk and wants to know more.  It is
usual, but not necessary, for lexing to have consumed the entirety of
the current chunk at this time.

If L</PL_parser-E<gt>bufptr> is pointing to the very end of the current
chunk (i.e., the current chunk has been entirely consumed), normally the
current chunk will be discarded at the same time that the new chunk is
read in.  If I<flags> includes C<LEX_KEEP_PREVIOUS>, the current chunk
will not be discarded.  If the current chunk has not been entirely
consumed, then it will not be discarded regardless of the flag.

Returns true if some new text was added to the buffer, or false if the
buffer has reached the end of the input text.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	lex_next_chunk(U32 flags)','name' => 'lex_next_chunk'},'sv_2mortal' => {'text' => 'Marks an existing SV as mortal.  The SV will be destroyed "soon", either
by an explicit call to FREETMPS, or by an implicit call at places such as
statement boundaries.  SvTEMP() is turned on which means that the SV\'s
string buffer can be "stolen" if this SV is copied.  See also C<sv_newmortal>
and C<sv_mortalcopy>.

	SV*	sv_2mortal(SV *const sv)','name' => 'sv_2mortal'},'sv_2bool_flags' => {'text' => 'This function is only used by sv_true() and friends,  and only if
the latter\'s argument is neither SvPOK, SvIOK nor SvNOK.  If the flags
contain SV_GMAGIC, then it does an mg_get() first.


	bool	sv_2bool_flags(SV *const sv, const I32 flags)','name' => 'sv_2bool_flags'},'malloc' => {'text' => '','name' => 'malloc'},'av_undef' => {'text' => 'Undefines the array.  Frees the memory used by the av to store its list of
scalars.  If any destructors are triggered as a result, the av itself may
be freed.

	void	av_undef(AV *av)','name' => 'av_undef'},'parse_label' => {'text' => 'Parse a single label, possibly optional, of the type that may prefix a
Perl statement.  It is up to the caller to ensure that the dynamic parser
state (L</PL_parser> et al) is correctly set to reflect the source of
the code to be parsed.  If I<flags> includes C<PARSE_OPTIONAL> then the
label is optional, otherwise it is mandatory.

The name of the label is returned in the form of a fresh scalar.  If an
optional label is absent, a null pointer is returned.

If an error occurs in parsing, which can only occur if the label is
mandatory, a valid label is returned anyway.  The error is reflected in
the parser state, normally resulting in a single exception at the top
level of parsing which covers all the compilation errors that occurred.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	parse_label(U32 flags)','name' => 'parse_label'},'PL_check' => {'text' => 'Array, indexed by opcode, of functions that will be called for the "check"
phase of optree building during compilation of Perl code.  For most (but
not all) types of op, once the op has been initially built and populated
with child ops it will be filtered through the check function referenced
by the appropriate element of this array.  The new op is passed in as the
sole argument to the check function, and the check function returns the
completed op.  The check function may (as the name suggests) check the op
for validity and signal errors.  It may also initialise or modify parts of
the ops, or perform more radical surgery such as adding or removing child
ops, or even throw the op away and return a different op in its place.

This array of function pointers is a convenient place to hook into the
compilation process.  An XS module can put its own custom check function
in place of any of the standard ones, to influence the compilation of a
particular type of op.  However, a custom check function must never fully
replace a standard check function (or even a custom check function from
another module).  A module modifying checking must instead B<wrap> the
preexisting check function.  A custom check function must be selective
about when to apply its custom behaviour.  In the usual case where
it decides not to do anything special with an op, it must chain the
preexisting op function.  Check functions are thus linked in a chain,
with the core\'s base checker at the end.

For thread safety, modules should not write directly to this array.
Instead, use the function L</wrap_op_checker>.','name' => 'PL_check'},'pack_cat' => {'text' => 'The engine implementing pack() Perl function. Note: parameters next_in_list and
flags are not used. This call should not be used; use packlist instead.

	void	pack_cat(SV *cat, const char *pat,
		         const char *patend, SV **beglist,
		         SV **endlist, SV ***next_in_list,
		         U32 flags)','name' => 'pack_cat'},'PerlIO_read' => {'text' => '','name' => 'PerlIO_read'},'sv_cmp' => {'text' => 'Compares the strings in two SVs.  Returns -1, 0, or 1 indicating whether the
string in C<sv1> is less than, equal to, or greater than the string in
C<sv2>.  Is UTF-8 and \'use bytes\' aware, handles get magic, and will
coerce its args to strings if necessary.  See also C<sv_cmp_locale>.

	I32	sv_cmp(SV *const sv1, SV *const sv2)','name' => 'sv_cmp'},'mg_free' => {'text' => 'Free any magic storage used by the SV.  See C<sv_magic>.

	int	mg_free(SV* sv)','name' => 'mg_free'},'sv_force_normal_flags' => {'text' => 'Undo various types of fakery on an SV, where fakery means
"more than" a string: if the PV is a shared string, make
a private copy; if we\'re a ref, stop refing; if we\'re a glob, downgrade to
an xpvmg; if we\'re a copy-on-write scalar, this is the on-write time when
we do the copy, and is also used locally; if this is a
vstring, drop the vstring magic.  If C<SV_COW_DROP_PV> is set
then a copy-on-write scalar drops its PV buffer (if any) and becomes
SvPOK_off rather than making a copy.  (Used where this
scalar is about to be set to some other value.)  In addition,
the C<flags> parameter gets passed to C<sv_unref_flags()>
when unreffing.  C<sv_force_normal> calls this function
with flags set to 0.

	void	sv_force_normal_flags(SV *const sv,
		                      const U32 flags)','name' => 'sv_force_normal_flags'},'cophh_fetch_pv' => {'text' => 'Like L</cophh_fetch_pvn>, but takes a nul-terminated string instead of
a string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	cophh_fetch_pv(const COPHH *cophh,
		               const char *key, U32 hash,
		               U32 flags)','name' => 'cophh_fetch_pv'},'tmps_grow' => {'text' => '','name' => 'tmps_grow'},'is_utf8_char' => {'text' => 'DEPRECATED!

Tests if some arbitrary number of bytes begins in a valid UTF-8
character.  Note that an INVARIANT (i.e. ASCII on non-EBCDIC machines)
character is a valid UTF-8 character.  The actual number of bytes in the UTF-8
character will be returned if it is valid, otherwise 0.

This function is deprecated due to the possibility that malformed input could
cause reading beyond the end of the input buffer.  Use L</is_utf8_char_buf>
instead.

	STRLEN	is_utf8_char(const U8 *s)','name' => 'is_utf8_char'},'get_vtbl' => {'text' => '','name' => 'get_vtbl'},'save_hints' => {'text' => '','name' => 'save_hints'},'SvNOK_off' => {'text' => 'Unsets the NV status of an SV.

	void	SvNOK_off(SV* sv)','name' => 'SvNOK_off'},'gv_fetchmeth_pv_autoload' => {'text' => 'Exactly like L</gv_fetchmeth_pvn_autoload>, but takes a nul-terminated string
instead of a string/length pair.

	GV*	gv_fetchmeth_pv_autoload(HV* stash,
		                         const char* name,
		                         I32 level, U32 flags)','name' => 'gv_fetchmeth_pv_autoload'},'sv_utf8_upgrade' => {'text' => 'Converts the PV of an SV to its UTF-8-encoded form.
Forces the SV to string form if it is not already.
Will C<mg_get> on C<sv> if appropriate.
Always sets the SvUTF8 flag to avoid future validity checks even
if the whole string is the same in UTF-8 as not.
Returns the number of bytes in the converted string

This is not a general purpose byte encoding to Unicode interface:
use the Encode extension for that.

	STRLEN	sv_utf8_upgrade(SV *sv)','name' => 'sv_utf8_upgrade'},'dXSARGS' => {'text' => 'Sets up stack and mark pointers for an XSUB, calling dSP and dMARK.
Sets up the C<ax> and C<items> variables by calling C<dAX> and C<dITEMS>.
This is usually handled automatically by C<xsubpp>.

		dXSARGS;','name' => 'dXSARGS'},'savesharedpv' => {'text' => 'A version of C<savepv()> which allocates the duplicate string in memory
which is shared between threads.

	char*	savesharedpv(const char* pv)','name' => 'savesharedpv'},'isSPACE' => {'text' => 'Returns a boolean indicating whether the specified character is a
whitespace character.  This is analogous
to what C<m/\\s/> matches in a regular expression.  Starting in Perl 5.18
(experimentally), this also matches what C<m/[[:space:]]/> does.
("Experimentally" means that this change may be backed out in 5.20 or 5.22 if
field experience indicates that it was unwise.)  Prior to 5.18, only the
locale forms of this macro (the ones with C<LC> in their names) matched
precisely what C<m/[[:space:]]/> does.  In those releases, the only difference,
in the non-locale variants, was that C<isSPACE()> did not match a vertical tab.
(See L</isPSXSPC> for a macro that matches a vertical tab in all releases.)
See the L<top of this section|/Character classes> for an explanation of variants
C<isSPACE_A>, C<isSPACE_L1>, C<isSPACE_uni>, C<isSPACE_utf8>, C<isSPACE_LC>,
C<isSPACE_LC_uvchr>, and C<isSPACE_LC_utf8>.

	bool	isSPACE(char ch)','name' => 'isSPACE'},'Safefree' => {'text' => 'The XSUB-writer\'s interface to the C C<free> function.

	void	Safefree(void* ptr)','name' => 'Safefree'},'custom_op_desc' => {'text' => 'Return the description of a given custom op. This was once used by the
OP_DESC macro, but is no longer: it has only been kept for
compatibility, and should not be used.

	const char * custom_op_desc(const OP *o)','name' => 'custom_op_desc'},'regdupe_internal' => {'text' => '','name' => 'regdupe_internal'},'gv_stashpvn' => {'text' => 'Returns a pointer to the stash for a specified package.  The C<namelen>
parameter indicates the length of the C<name>, in bytes.  C<flags> is passed
to C<gv_fetchpvn_flags()>, so if set to C<GV_ADD> then the package will be
created if it does not already exist.  If the package does not exist and
C<flags> is 0 (or any other setting that does not create packages) then NULL
is returned.

Flags may be one of:

    GV_ADD
    SVf_UTF8
    GV_NOADD_NOINIT
    GV_NOINIT
    GV_NOEXPAND
    GV_ADDMG

The most important of which are probably GV_ADD and SVf_UTF8.

	HV*	gv_stashpvn(const char* name, U32 namelen,
		            I32 flags)','name' => 'gv_stashpvn'},'vmess' => {'text' => 'C<pat> and C<args> are a sprintf-style format pattern and encapsulated
argument list.  These are used to generate a string message.  If the
message does not end with a newline, then it will be extended with
some indication of the current location in the code, as described for
L</mess_sv>.

Normally, the resulting message is returned in a new mortal SV.
During global destruction a single SV may be shared between uses of
this function.

	SV *	vmess(const char *pat, va_list *args)','name' => 'vmess'},'new_collate' => {'text' => '','name' => 'new_collate'},'my_stat' => {'text' => '','name' => 'my_stat'},'my_setenv' => {'text' => '','name' => 'my_setenv'},'newSV_type' => {'text' => 'Creates a new SV, of the type specified.  The reference count for the new SV
is set to 1.

	SV*	newSV_type(const svtype type)','name' => 'newSV_type'},'SvREFCNT_inc_void_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the return
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

	int	Perl_signbit(NV f)','name' => 'Perl_signbit'},'PUSH_MULTICALL' => {'text' => 'Opening bracket for a lightweight callback.
See L<perlcall/LIGHTWEIGHT CALLBACKS>.

		PUSH_MULTICALL;','name' => 'PUSH_MULTICALL'},'new_ctype' => {'text' => '','name' => 'new_ctype'},'save_svref' => {'text' => '','name' => 'save_svref'},'newNULLLIST' => {'text' => 'Constructs, checks, and returns a new C<stub> op, which represents an
empty list expression.

	OP *	newNULLLIST()','name' => 'newNULLLIST'},'sv_pos_u2b_flags' => {'text' => 'Converts the value pointed to by offsetp from a count of UTF-8 chars from
the start of the string, to a count of the equivalent number of bytes; if
lenp is non-zero, it does the same to lenp, but this time starting from
the offset, rather than from the start
of the string.  Handles type coercion.
I<flags> is passed to C<SvPV_flags>, and usually should be
C<SV_GMAGIC|SV_CONST_RETURN> to handle magic.

	STRLEN	sv_pos_u2b_flags(SV *const sv, STRLEN uoffset,
		                 STRLEN *const lenp, U32 flags)','name' => 'sv_pos_u2b_flags'},'init_tm' => {'text' => '','name' => 'init_tm'},'newWHILEOP' => {'text' => 'Constructs, checks, and returns an op tree expressing a C<while> loop.
This is a heavyweight loop, with structure that allows exiting the loop
by C<last> and suchlike.

I<loop> is an optional preconstructed C<enterloop> op to use in the
loop; if it is null then a suitable op will be constructed automatically.
I<expr> supplies the loop\'s controlling expression.  I<block> supplies the
main body of the loop, and I<cont> optionally supplies a C<continue> block
that operates as a second half of the body.  All of these optree inputs
are consumed by this function and become part of the constructed op tree.

I<flags> gives the eight bits of C<op_flags> for the C<leaveloop>
op and, shifted up eight bits, the eight bits of C<op_private> for
the C<leaveloop> op, except that (in both cases) some bits will be set
automatically.  I<debuggable> is currently unused and should always be 1.
I<has_my> can be supplied as true to force the
loop body to be enclosed in its own scope.

	OP *	newWHILEOP(I32 flags, I32 debuggable,
		           LOOP *loop, OP *expr, OP *block,
		           OP *cont, I32 has_my)','name' => 'newWHILEOP'},'Gv_AMupdate' => {'text' => '','name' => 'Gv_AMupdate'},'filter_del' => {'text' => '','name' => 'filter_del'},'SvIV_nomg' => {'text' => 'Like C<SvIV> but doesn\'t process magic.

	IV	SvIV_nomg(SV* sv)','name' => 'SvIV_nomg'},'POPp' => {'text' => 'Pops a string off the stack.

	char*	POPp','name' => 'POPp'},'RETVAL' => {'text' => 'Variable which is setup by C<xsubpp> to hold the return value for an 
XSUB. This is always the proper type for the XSUB. See 
L<perlxs/"The RETVAL Variable">.

	(whatever)	RETVAL','name' => 'RETVAL'},'HeSVKEY' => {'text' => 'Returns the key as an C<SV*>, or C<NULL> if the hash entry does not
contain an C<SV*> key.

	SV*	HeSVKEY(HE* he)','name' => 'HeSVKEY'},'newANONLIST' => {'text' => '','name' => 'newANONLIST'},'mg_findext' => {'text' => 'Finds the magic pointer of C<type> with the given C<vtbl> for the C<SV>.  See
C<sv_magicext>.

	MAGIC*	mg_findext(const SV* sv, int type,
		           const MGVTBL *vtbl)','name' => 'mg_findext'},'my_memset' => {'text' => '','name' => 'my_memset'},'my_atof2' => {'text' => '','name' => 'my_atof2'},'PerlIO_get_ptr' => {'text' => '','name' => 'PerlIO_get_ptr'},'save_destructor' => {'text' => '','name' => 'save_destructor'},'sv_cmp_flags' => {'text' => 'Compares the strings in two SVs.  Returns -1, 0, or 1 indicating whether the
string in C<sv1> is less than, equal to, or greater than the string in
C<sv2>.  Is UTF-8 and \'use bytes\' aware and will coerce its args to strings
if necessary.  If the flags include SV_GMAGIC, it handles get magic.  See
also C<sv_cmp_locale_flags>.

	I32	sv_cmp_flags(SV *const sv1, SV *const sv2,
		             const U32 flags)','name' => 'sv_cmp_flags'},'hv_iternextsv' => {'text' => 'Performs an C<hv_iternext>, C<hv_iterkey>, and C<hv_iterval> in one
operation.

	SV*	hv_iternextsv(HV *hv, char **key, I32 *retlen)','name' => 'hv_iternextsv'},'lex_read_to' => {'text' => 'Consume text in the lexer buffer, from L</PL_parser-E<gt>bufptr> up
to I<ptr>.  This advances L</PL_parser-E<gt>bufptr> to match I<ptr>,
performing the correct bookkeeping whenever a newline character is passed.
This is the normal way to consume lexed text.

Interpretation of the buffer\'s octets can be abstracted out by
using the slightly higher-level functions L</lex_peek_unichar> and
L</lex_read_unichar>.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_read_to(char *ptr)','name' => 'lex_read_to'},'sv_pvbyten_force' => {'text' => 'The backend for the C<SvPVbytex_force> macro.  Always use the macro
instead.

	char*	sv_pvbyten_force(SV *const sv, STRLEN *const lp)','name' => 'sv_pvbyten_force'},'reg_named_buff_fetch' => {'text' => '','name' => 'reg_named_buff_fetch'},'ibcmp_locale' => {'text' => 'This is a synonym for (! foldEQ_locale())

	I32	ibcmp_locale(const char* a, const char* b,
		             I32 len)','name' => 'ibcmp_locale'},'XST_mIV' => {'text' => 'Place an integer into the specified position C<pos> on the stack.  The
value is stored in a new mortal SV.

	void	XST_mIV(int pos, IV iv)','name' => 'XST_mIV'},'save_pptr' => {'text' => '','name' => 'save_pptr'},'PerlIO_set_ptrcnt' => {'text' => '','name' => 'PerlIO_set_ptrcnt'},'mPUSHs' => {'text' => 'Push an SV onto the stack and mortalizes the SV.  The stack must have room
for this element.  Does not use C<TARG>.  See also C<PUSHs> and C<mXPUSHs>.

	void	mPUSHs(SV* sv)','name' => 'mPUSHs'},'dump_packsubs' => {'text' => '','name' => 'dump_packsubs'},'GvSV' => {'text' => 'Return the SV from the GV.

	SV*	GvSV(GV* gv)','name' => 'GvSV'},'isPRINT' => {'text' => 'Returns a boolean indicating whether the specified character is a
printable character, analogous to C<m/[[:print:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isPRINT_A>, C<isPRINT_L1>, C<isPRINT_uni>, C<isPRINT_utf8>, C<isPRINT_LC>,
C<isPRINT_LC_uvchr>, and C<isPRINT_LC_utf8>.

	bool	isPRINT(char ch)','name' => 'isPRINT'},'init_i18nl10n' => {'text' => '','name' => 'init_i18nl10n'},'vform' => {'text' => '','name' => 'vform'},'get_op_descs' => {'text' => '','name' => 'get_op_descs'},'safesyscalloc' => {'text' => '','name' => 'safesyscalloc'},'PL_curpad' => {'text' => 'Points directly to the body of the L</PL_comppad> array.
(I.e., this is C<PAD_ARRAY(PL_comppad)>.)

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_curpad'},'POPi' => {'text' => 'Pops an integer off the stack.

	IV	POPi','name' => 'POPi'},'parse_stmtseq' => {'text' => 'Parse a sequence of zero or more Perl statements.  These may be normal
imperative statements, including optional labels, or declarations
that have compile-time effect, or any mixture thereof.  The statement
sequence ends when a closing brace or end-of-file is encountered in a
place where a new statement could have validly started.  It is up to
the caller to ensure that the dynamic parser state (L</PL_parser> et al)
is correctly set to reflect the source of the code to be parsed and the
lexical context for the statements.

The op tree representing the statement sequence is returned.  This may
be a null pointer if the statements were all null, for example if there
were no statements or if there were only subroutine definitions (which
have compile-time side effects).  If not null, it will be a C<lineseq>
list, normally including C<nextstate> or equivalent ops.

If an error occurs in parsing or compilation, in most cases a valid op
tree is returned anyway.  The error is reflected in the parser state,
normally resulting in a single exception at the top level of parsing
which covers all the compilation errors that occurred.  Some compilation
errors, however, will throw an exception immediately.

The I<flags> parameter is reserved for future use, and must always
be zero.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_stmtseq(U32 flags)','name' => 'parse_stmtseq'},'sv_2pvutf8_nolen' => {'text' => 'Return a pointer to the UTF-8-encoded representation of the SV.
May cause the SV to be upgraded to UTF-8 as a side-effect.

Usually accessed via the C<SvPVutf8_nolen> macro.

	char*	sv_2pvutf8_nolen(SV* sv)','name' => 'sv_2pvutf8_nolen'},'gv_HVadd' => {'text' => '','name' => 'gv_HVadd'},'custom_op_xop' => {'text' => 'Return the XOP structure for a given custom op. This function should be
considered internal to OP_NAME and the other access macros: use them instead.

NOTE: this function must be explicitly called as Perl_custom_op_xop with an aTHX_ parameter.

	const XOP * Perl_custom_op_xop(pTHX_ const OP *o)','name' => 'custom_op_xop'},'mro_get_linear_isa' => {'text' => 'Returns the mro linearisation for the given stash.  By default, this
will be whatever C<mro_get_linear_isa_dfs> returns unless some
other MRO is in effect for the stash.  The return value is a
read-only AV*.

You are responsible for C<SvREFCNT_inc()> on the
return value if you plan to store it anywhere
semi-permanently (otherwise it might be deleted
out from under you the next time the cache is
invalidated).

	AV*	mro_get_linear_isa(HV* stash)','name' => 'mro_get_linear_isa'},'SvPVbytex' => {'text' => 'Like C<SvPV>, but converts sv to byte representation first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVbyte>
otherwise.

	char*	SvPVbytex(SV* sv, STRLEN len)','name' => 'SvPVbytex'},'av_store' => {'text' => 'Stores an SV in an array.  The array index is specified as C<key>.  The
return value will be NULL if the operation failed or if the value did not
need to be actually stored within the array (as in the case of tied
arrays). Otherwise, it can be dereferenced
to get the C<SV*> that was stored
there (= C<val>)).

Note that the caller is responsible for suitably incrementing the reference
count of C<val> before the call, and decrementing it if the function
returned NULL.

Approximate Perl equivalent: C<$myarray[$key] = $val;>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays.

	SV**	av_store(AV *av, I32 key, SV *val)','name' => 'av_store'},'reg_named_buff_scalar' => {'text' => '','name' => 'reg_named_buff_scalar'},'unlnk' => {'text' => '','name' => 'unlnk'},'av_fetch' => {'text' => 'Returns the SV at the specified index in the array.  The C<key> is the
index.  If lval is true, you are guaranteed to get a real SV back (in case
it wasn\'t real before), which you can then modify.  Check that the return
value is non-null before dereferencing it to a C<SV*>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for
more information on how to use this function on tied arrays. 

The rough perl equivalent is C<$myarray[$idx]>.

	SV**	av_fetch(AV *av, I32 key, I32 lval)','name' => 'av_fetch'},'SvNOK_only' => {'text' => 'Tells an SV that it is a double and disables all other OK bits.

	void	SvNOK_only(SV* sv)','name' => 'SvNOK_only'},'hv_iterval' => {'text' => 'Returns the value from the current position of the hash iterator.  See
C<hv_iterkey>.

	SV*	hv_iterval(HV *hv, HE *entry)','name' => 'hv_iterval'},'sv_reftype' => {'text' => 'Returns a string describing what the SV is a reference to.

	const char* sv_reftype(const SV *const sv, const int ob)','name' => 'sv_reftype'},'foldEQ_locale' => {'text' => 'Returns true if the leading len bytes of the strings s1 and s2 are the same
case-insensitively in the current locale; false otherwise.

	I32	foldEQ_locale(const char* a, const char* b,
		              I32 len)','name' => 'foldEQ_locale'},'cophh_2hv' => {'text' => 'Generates and returns a standard Perl hash representing the full set of
key/value pairs in the cop hints hash I<cophh>.  I<flags> is currently
unused and must be zero.

NOTE: this function is experimental and may change or be
removed without notice.

	HV *	cophh_2hv(const COPHH *cophh, U32 flags)','name' => 'cophh_2hv'},'SvREFCNT_inc_simple_void_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the return
value, and you know that I<sv> is not NULL.  The macro doesn\'t need
to return a meaningful value, or check for NULLness, so it\'s smaller
and faster.

	void	SvREFCNT_inc_simple_void_NN(SV* sv)','name' => 'SvREFCNT_inc_simple_void_NN'},'rsignal_state' => {'text' => '','name' => 'rsignal_state'},'av_len' => {'text' => 'Same as L</av_top_index>.  Returns the highest index in the array.  Note that the
return value is +1 what its name implies it returns; and hence differs in
meaning from what the similarly named L</sv_len> returns.

	I32	av_len(AV *av)','name' => 'av_len'},'sv_unmagic' => {'text' => 'Removes all magic of type C<type> from an SV.

	int	sv_unmagic(SV *const sv, const int type)','name' => 'sv_unmagic'},'SvTAINT' => {'text' => 'Taints an SV if tainting is enabled, and if some input to the current
expression is tainted--usually a variable, but possibly also implicit
inputs such as locale settings.  C<SvTAINT> propagates that taintedness to
the outputs of an expression in a pessimistic fashion; i.e., without paying
attention to precisely which outputs are influenced by which inputs.

	void	SvTAINT(SV* sv)','name' => 'SvTAINT'},'mg_clear' => {'text' => 'Clear something magical that the SV represents.  See C<sv_magic>.

	int	mg_clear(SV* sv)','name' => 'mg_clear'},'my_sprintf' => {'text' => 'The C library C<sprintf>, wrapped if necessary, to ensure that it will return
the length of the string written to the buffer. Only rare pre-ANSI systems
need the wrapper function - usually this is a direct call to C<sprintf>.

	int	my_sprintf(char *buffer, const char *pat, ...)','name' => 'my_sprintf'},'to_utf8_fold' => {'text' => 'Convert the UTF-8 encoded character at C<p> to its foldcase version and
store that in UTF-8 in C<ustrp> and its length in bytes in C<lenp>.  Note
that the C<ustrp> needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
foldcase version may be longer than the original character (up to
three characters).

The first character of the foldcased version is returned
(but note, as explained above, that there may be more.)

The character at C<p> is assumed by this routine to be well-formed.

	UV	to_utf8_fold(const U8 *p, U8* ustrp,
		             STRLEN *lenp)','name' => 'to_utf8_fold'},'regfree_internal' => {'text' => '','name' => 'regfree_internal'},'gv_stashpv' => {'text' => 'Returns a pointer to the stash for a specified package.  Uses C<strlen> to
determine the length of C<name>, then calls C<gv_stashpvn()>.

	HV*	gv_stashpv(const char* name, I32 flags)','name' => 'gv_stashpv'},'sv_cmp_locale_flags' => {'text' => 'Compares the strings in two SVs in a locale-aware manner.  Is UTF-8 and
\'use bytes\' aware and will coerce its args to strings if necessary.  If the
flags contain SV_GMAGIC, it handles get magic.  See also C<sv_cmp_flags>.

	I32	sv_cmp_locale_flags(SV *const sv1,
		                    SV *const sv2,
		                    const U32 flags)','name' => 'sv_cmp_locale_flags'},'sv_vcatpvf_mg' => {'text' => 'Like C<sv_vcatpvf>, but also handles \'set\' magic.

Usually used via its frontend C<sv_catpvf_mg>.

	void	sv_vcatpvf_mg(SV *const sv,
		              const char *const pat,
		              va_list *const args)','name' => 'sv_vcatpvf_mg'},'mXPUSHu' => {'text' => 'Push an unsigned integer onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHu>, C<mPUSHu> and C<PUSHu>.

	void	mXPUSHu(UV uv)','name' => 'mXPUSHu'},'hv_exists_ent' => {'text' => 'Returns a boolean indicating whether
the specified hash key exists.  C<hash>
can be a valid precomputed hash value, or 0 to ask for it to be
computed.

	bool	hv_exists_ent(HV *hv, SV *keysv, U32 hash)','name' => 'hv_exists_ent'},'PL_comppad' => {'text' => 'During compilation, this points to the array containing the values
part of the pad for the currently-compiling code.  (At runtime a CV may
have many such value arrays; at compile time just one is constructed.)
At runtime, this points to the array containing the currently-relevant
values for the pad for the currently-executing code.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_comppad'},'atfork_unlock' => {'text' => '','name' => 'atfork_unlock'},'SvNIOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a number, integer or
double.

	U32	SvNIOK(SV* sv)','name' => 'SvNIOK'},'save_long' => {'text' => '','name' => 'save_long'},'mro_method_changed_in' => {'text' => 'Invalidates method caching on any child classes
of the given stash, so that they might notice
the changes in this one.

Ideally, all instances of C<PL_sub_generation++> in
perl source outside of F<mro.c> should be
replaced by calls to this.

Perl automatically handles most of the common
ways a method might be redefined.  However, there
are a few ways you could change a method in a stash
without the cache code noticing, in which case you
need to call this method afterwards:

1) Directly manipulating the stash HV entries from
XS code.

2) Assigning a reference to a readonly scalar
constant into a stash entry in order to create
a constant subroutine (like constant.pm
does).

This same method is available from pure perl
via, C<mro::method_changed_in(classname)>.

	void	mro_method_changed_in(HV* stash)','name' => 'mro_method_changed_in'},'unpack_str' => {'text' => 'The engine implementing unpack() Perl function. Note: parameters strbeg, new_s
and ocnt are not used. This call should not be used, use unpackstring instead.

	I32	unpack_str(const char *pat, const char *patend,
		           const char *s, const char *strbeg,
		           const char *strend, char **new_s,
		           I32 ocnt, U32 flags)','name' => 'unpack_str'},'my_fflush_all' => {'text' => '','name' => 'my_fflush_all'},'sv_newref' => {'text' => 'Increment an SV\'s reference count.  Use the C<SvREFCNT_inc()> wrapper
instead.

	SV*	sv_newref(SV *const sv)','name' => 'sv_newref'},'cop_hints_fetch_pv' => {'text' => 'Like L</cop_hints_fetch_pvn>, but takes a nul-terminated string instead
of a string/length pair.

	SV *	cop_hints_fetch_pv(const COP *cop,
		                   const char *key, U32 hash,
		                   U32 flags)','name' => 'cop_hints_fetch_pv'},'XSRETURN_IV' => {'text' => 'Return an integer from an XSUB immediately.  Uses C<XST_mIV>.

	void	XSRETURN_IV(IV iv)','name' => 'XSRETURN_IV'},'sv_uni_display' => {'text' => 'Build to the scalar C<dsv> a displayable version of the scalar C<sv>,
the displayable version being at most C<pvlim> bytes long
(if longer, the rest is truncated and "..." will be appended).

The C<flags> argument is as in L</pv_uni_display>().

The pointer to the PV of the C<dsv> is returned.

	char*	sv_uni_display(SV *dsv, SV *ssv, STRLEN pvlim,
		               UV flags)','name' => 'sv_uni_display'},'sv_unmagicext' => {'text' => 'Removes all magic of type C<type> with the specified C<vtbl> from an SV.

	int	sv_unmagicext(SV *const sv, const int type,
		              MGVTBL *vtbl)','name' => 'sv_unmagicext'},'newSVpvs' => {'text' => 'Like C<newSVpvn>, but takes a literal string instead of a string/length pair.

	SV*	newSVpvs(const char* s)','name' => 'newSVpvs'},'SvREFCNT_dec' => {'text' => 'Decrements the reference count of the given SV. I<sv> may be NULL.

	void	SvREFCNT_dec(SV* sv)','name' => 'SvREFCNT_dec'},'realloc' => {'text' => '','name' => 'realloc'},'POPs' => {'text' => 'Pops an SV off the stack.

	SV*	POPs','name' => 'POPs'},'SvNV' => {'text' => 'Coerce the given SV to a double and return it.  See C<SvNVx> for a version
which guarantees to evaluate sv only once.

	NV	SvNV(SV* sv)','name' => 'SvNV'},'packlist' => {'text' => 'The engine implementing pack() Perl function.

	void	packlist(SV *cat, const char *pat,
		         const char *patend, SV **beglist,
		         SV **endlist)','name' => 'packlist'},'SvUTF8' => {'text' => 'Returns a U32 value indicating the UTF-8 status of an SV.  If things are set-up
properly, this indicates whether or not the SV contains UTF-8 encoded data.
You should use this I<after> a call to SvPV() or one of its variants, in
case any call to string overloading updates the internal flag.

	U32	SvUTF8(SV* sv)','name' => 'SvUTF8'},'gv_fetchmethod_autoload' => {'text' => 'Returns the glob which contains the subroutine to call to invoke the method
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

	GV*	gv_fetchmethod_autoload(HV* stash,
		                        const char* name,
		                        I32 autoload)','name' => 'gv_fetchmethod_autoload'},'op_dump' => {'text' => '','name' => 'op_dump'},'get_mstats' => {'text' => '','name' => 'get_mstats'},'savestack_grow' => {'text' => '','name' => 'savestack_grow'},'debstackptrs' => {'text' => '','name' => 'debstackptrs'},'sv_eq' => {'text' => 'Returns a boolean indicating whether the strings in the two SVs are
identical.  Is UTF-8 and \'use bytes\' aware, handles get magic, and will
coerce its args to strings if necessary.

	I32	sv_eq(SV* sv1, SV* sv2)','name' => 'sv_eq'},'SvTAINTED' => {'text' => 'Checks to see if an SV is tainted.  Returns TRUE if it is, FALSE if
not.

	bool	SvTAINTED(SV* sv)','name' => 'SvTAINTED'},'ptr_table_store' => {'text' => '','name' => 'ptr_table_store'},'cv_undef' => {'text' => 'Clear out all the active components of a CV. This can happen either
by an explicit C<undef &foo>, or by the reference count going to zero.
In the former case, we keep the CvOUTSIDE pointer, so that any anonymous
children can still follow the full lexical scope chain.

	void	cv_undef(CV* cv)','name' => 'cv_undef'},'StructCopy' => {'text' => 'This is an architecture-independent macro to copy one structure to another.

	void	StructCopy(type *src, type *dest, type)','name' => 'StructCopy'},'sv_catpvf_nocontext' => {'text' => '','name' => 'sv_catpvf_nocontext'},'save_padsv_and_mortalize' => {'text' => '','name' => 'save_padsv_and_mortalize'},'gv_autoload_sv' => {'text' => '','name' => 'gv_autoload_sv'},'cophh_delete_pvs' => {'text' => 'Like L</cophh_delete_pvn>, but takes a literal string instead of a
string/length pair, and no precomputed hash.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_delete_pvs(const COPHH *cophh,
		                 const char *key, U32 flags)','name' => 'cophh_delete_pvs'},'GvCV' => {'text' => 'Return the CV from the GV.

	CV*	GvCV(GV* gv)','name' => 'GvCV'},'get_cvn_flags' => {'text' => 'Returns the CV of the specified Perl subroutine.  C<flags> are passed to
C<gv_fetchpvn_flags>. If C<GV_ADD> is set and the Perl subroutine does not
exist then it will be declared (which has the same effect as saying
C<sub name;>).  If C<GV_ADD> is not set and the subroutine does not exist
then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	CV*	get_cvn_flags(const char* name, STRLEN len,
		              I32 flags)','name' => 'get_cvn_flags'},'XopENTRY_set' => {'text' => 'Set a member of the XOP structure. I<which> is a cpp token indicating
which entry to set. See L<perlguts/"Custom Operators"> for details about
the available members and how they are used.

	void	XopENTRY_set(XOP *xop, which, value)','name' => 'XopENTRY_set'},'reentrant_free' => {'text' => '','name' => 'reentrant_free'},'items' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the number of 
items on the stack.  See L<perlxs/"Variable-length Parameter Lists">.

	I32	items','name' => 'items'},'XST_mPV' => {'text' => 'Place a copy of a string into the specified position C<pos> on the stack. 
The value is stored in a new mortal SV.

	void	XST_mPV(int pos, char* str)','name' => 'XST_mPV'},'dump_vindent' => {'text' => '','name' => 'dump_vindent'},'SvPVx' => {'text' => 'A version of C<SvPV> which guarantees to evaluate C<sv> only once.
Only use this if C<sv> is an expression with side effects, otherwise use the
more efficient C<SvPV>.

	char*	SvPVx(SV* sv, STRLEN len)','name' => 'SvPVx'},'dump_form' => {'text' => '','name' => 'dump_form'},'sv_grow' => {'text' => 'Expands the character buffer in the SV.  If necessary, uses C<sv_unref> and
upgrades the SV to C<SVt_PV>.  Returns a pointer to the character buffer.
Use the C<SvGROW> wrapper instead.

	char*	sv_grow(SV *const sv, STRLEN newlen)','name' => 'sv_grow'},'vnormal' => {'text' => 'Accepts a version object and returns the normalized string
representation.  Call like:

    sv = vnormal(rv);

NOTE: you can pass either the object directly or the SV
contained within the RV.

The SV returned has a refcount of 1.

	SV*	vnormal(SV *vs)','name' => 'vnormal'},'filter_add' => {'text' => '','name' => 'filter_add'},'newPVOP' => {'text' => 'Constructs, checks, and returns an op of any type that involves an
embedded C-level pointer (PV).  I<type> is the opcode.  I<flags> gives
the eight bits of C<op_flags>.  I<pv> supplies the C-level pointer, which
must have been allocated using L</PerlMemShared_malloc>; the memory will
be freed when the op is destroyed.

	OP *	newPVOP(I32 type, I32 flags, char *pv)','name' => 'newPVOP'},'XPUSHs' => {'text' => 'Push an SV onto the stack, extending the stack if necessary.  Does not
handle \'set\' magic.  Does not use C<TARG>.  See also C<XPUSHmortal>,
C<PUSHs> and C<PUSHmortal>.

	void	XPUSHs(SV* sv)','name' => 'XPUSHs'},'set_numeric_radix' => {'text' => '','name' => 'set_numeric_radix'},'newIO' => {'text' => '','name' => 'newIO'},'PadnameUTF8' => {'text' => 'Whether PadnamePV is in UTF8.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	PadnameUTF8(PADNAME pn)','name' => 'PadnameUTF8'},'do_join' => {'text' => '','name' => 'do_join'},'save_helem' => {'text' => '','name' => 'save_helem'},'die' => {'text' => 'Behaves the same as L</croak>, except for the return type.
It should be used only where the C<OP *> return type is required.
The function never actually returns.

	OP *	die(const char *pat, ...)','name' => 'die'},'sv_usepvn' => {'text' => 'Tells an SV to use C<ptr> to find its string value. Implemented by
calling C<sv_usepvn_flags> with C<flags> of 0, hence does not handle \'set\'
magic. See C<sv_usepvn_flags>.

	void	sv_usepvn(SV* sv, char* ptr, STRLEN len)','name' => 'sv_usepvn'},'SvREFCNT' => {'text' => 'Returns the value of the object\'s reference count.

	U32	SvREFCNT(SV* sv)','name' => 'SvREFCNT'},'newCONSTSUB_flags' => {'text' => 'Creates a constant sub equivalent to Perl C<sub FOO () { 123 }> which is
eligible for inlining at compile-time.

Currently, the only useful value for C<flags> is SVf_UTF8.

The newly created subroutine takes ownership of a reference to the passed in
SV.

Passing NULL for SV creates a constant sub equivalent to C<sub BAR () {}>,
which won\'t be called if used as a destructor, but will suppress the overhead
of a call to C<AUTOLOAD>.  (This form, however, isn\'t eligible for inlining at
compile time.)

	CV*	newCONSTSUB_flags(HV* stash, const char* name,
		                  STRLEN len, U32 flags, SV* sv)','name' => 'newCONSTSUB_flags'},'swash_init' => {'text' => '','name' => 'swash_init'},'newANONSUB' => {'text' => '','name' => 'newANONSUB'},'warn' => {'text' => 'This is an XS interface to Perl\'s C<warn> function.

Take a sprintf-style format pattern and argument list.  These are used to
generate a string message.  If the message does not end with a newline,
then it will be extended with some indication of the current location
in the code, as described for L</mess_sv>.

The error message or object will by default be written to standard error,
but this is subject to modification by a C<$SIG{__WARN__}> handler.

Unlike with L</croak>, C<pat> is not permitted to be null.

	void	warn(const char *pat, ...)','name' => 'warn'},'PerlIO_get_bufsiz' => {'text' => '','name' => 'PerlIO_get_bufsiz'},'fp_dup' => {'text' => '','name' => 'fp_dup'},'hek_dup' => {'text' => '','name' => 'hek_dup'},'pmop_dump' => {'text' => '','name' => 'pmop_dump'},'newANONATTRSUB' => {'text' => '','name' => 'newANONATTRSUB'},'CvPADLIST' => {'text' => 'CV\'s can have CvPADLIST(cv) set to point to a PADLIST.  This is the CV\'s
scratchpad, which stores lexical variables and opcode temporary and
per-thread values.

For these purposes "formats" are a kind-of CV; eval""s are too (except they\'re
not callable at will and are always thrown away after the eval"" is done
executing).  Require\'d files are simply evals without any outer lexical
scope.

XSUBs don\'t have CvPADLIST set - dXSTARG fetches values from PL_curpad,
but that is really the callers pad (a slot of which is allocated by
every entersub).

The PADLIST has a C array where pads are stored.

The 0th entry of the PADLIST is a PADNAMELIST (which is actually just an
AV, but that may change) which represents the "names" or rather
the "static type information" for lexicals.  The individual elements of a
PADNAMELIST are PADNAMEs (just SVs; but, again, that may change).  Future
refactorings might stop the PADNAMELIST from being stored in the PADLIST\'s
array, so don\'t rely on it.  See L</PadlistNAMES>.

The CvDEPTH\'th entry of a PADLIST is a PAD (an AV) which is the stack frame
at that depth of recursion into the CV.  The 0th slot of a frame AV is an
AV which is @_.  Other entries are storage for variables and op targets.

Iterating over the PADNAMELIST iterates over all possible pad
items.  Pad slots that are SVs_PADTMP (targets/GVs/constants) end up having
&PL_sv_undef "names" (see pad_alloc()).

Only my/our variable (SvPADMY/PADNAME_isOUR) slots get valid names.
The rest are op targets/GVs/constants which are statically allocated
or resolved at compile time.  These don\'t have names by which they
can be looked up from Perl code at run time through eval"" the way
my/our variables can be.  Since they can\'t be looked up by "name"
but only by their index allocated at compile time (which is usually
in PL_op->op_targ), wasting a name SV for them doesn\'t make sense.

The SVs in the names AV have their PV being the name of the variable.
xlow+1..xhigh inclusive in the NV union is a range of cop_seq numbers for
which the name is valid (accessed through the macros COP_SEQ_RANGE_LOW and
_HIGH).  During compilation, these fields may hold the special value
PERL_PADSEQ_INTRO to indicate various stages:

   COP_SEQ_RANGE_LOW        _HIGH
   -----------------        -----
   PERL_PADSEQ_INTRO            0   variable not yet introduced:   { my ($x
   valid-seq#   PERL_PADSEQ_INTRO   variable in scope:             { my ($x)
   valid-seq#          valid-seq#   compilation of scope complete: { my ($x) }

For typed lexicals name SV is SVt_PVMG and SvSTASH
points at the type.  For C<our> lexicals, the type is also SVt_PVMG, with the
SvOURSTASH slot pointing at the stash of the associated global (so that
duplicate C<our> declarations in the same package can be detected).  SvUVX is
sometimes hijacked to store the generation number during compilation.

If PADNAME_OUTER (SvFAKE) is set on the
name SV, then that slot in the frame AV is
a REFCNT\'ed reference to a lexical from "outside". In this case,
the name SV does not use xlow and xhigh to store a cop_seq range, since it is
in scope throughout. Instead xhigh stores some flags containing info about
the real lexical (is it declared in an anon, and is it capable of being
instantiated multiple times?), and for fake ANONs, xlow contains the index
within the parent\'s pad where the lexical\'s value is stored, to make
cloning quicker.

If the \'name\' is \'&\' the corresponding entry in the PAD
is a CV representing a possible closure.
(PADNAME_OUTER and name of \'&\' is not a
meaningful combination currently but could
become so if C<my sub foo {}> is implemented.)

Note that formats are treated as anon subs, and are cloned each time
write is called (if necessary).

The flag SVs_PADSTALE is cleared on lexicals each time the my() is executed,
and set on scope exit.  This allows the
\'Variable $x is not available\' warning
to be generated in evals, such as 

    { my $x = 1; sub f { eval \'$x\'} } f();

For state vars, SVs_PADSTALE is overloaded to mean \'not yet initialised\'.

NOTE: this function is experimental and may change or be
removed without notice.

	PADLIST * CvPADLIST(CV *cv)','name' => 'CvPADLIST'},'HvNAMEUTF8' => {'text' => 'Returns true if the name is in UTF8 encoding.

	unsigned char HvNAMEUTF8(HV *stash)','name' => 'HvNAMEUTF8'},'SVt_PVGV' => {'text' => 'Type flag for typeglobs.  See L</svtype>.','name' => 'SVt_PVGV'},'sv_catpvf_mg_nocontext' => {'text' => '','name' => 'sv_catpvf_mg_nocontext'},'reg_named_buff_all' => {'text' => '','name' => 'reg_named_buff_all'},'PerlIO_close' => {'text' => '','name' => 'PerlIO_close'},'EXTEND' => {'text' => 'Used to extend the argument stack for an XSUB\'s return values. Once
used, guarantees that there is room for at least C<nitems> to be pushed
onto the stack.

	void	EXTEND(SP, int nitems)','name' => 'EXTEND'},'newOP' => {'text' => 'Constructs, checks, and returns an op of any base type (any type that
has no extra fields).  I<type> is the opcode.  I<flags> gives the
eight bits of C<op_flags>, and, shifted up eight bits, the eight bits
of C<op_private>.

	OP *	newOP(I32 type, I32 flags)','name' => 'newOP'},'newSVuv' => {'text' => 'Creates a new SV and copies an unsigned integer into it.
The reference count for the SV is set to 1.

	SV*	newSVuv(const UV u)','name' => 'newSVuv'},'gv_fetchmeth' => {'text' => 'Like L</gv_fetchmeth_pvn>, but lacks a flags parameter.

	GV*	gv_fetchmeth(HV* stash, const char* name,
		             STRLEN len, I32 level)','name' => 'gv_fetchmeth'},'op_refcnt_lock' => {'text' => '','name' => 'op_refcnt_lock'},'gv_fetchmeth_pvn_autoload' => {'text' => 'Same as gv_fetchmeth_pvn(), but looks for autoloaded subroutines too.
Returns a glob for the subroutine.

For an autoloaded subroutine without a GV, will create a GV even
if C<level < 0>.  For an autoloaded subroutine without a stub, GvCV()
of the result may be zero.

Currently, the only significant value for C<flags> is SVf_UTF8.

	GV*	gv_fetchmeth_pvn_autoload(HV* stash,
		                          const char* name,
		                          STRLEN len, I32 level,
		                          U32 flags)','name' => 'gv_fetchmeth_pvn_autoload'},'newGVgen' => {'text' => '','name' => 'newGVgen'},'sv_does' => {'text' => 'Like L</sv_does_pv>, but doesn\'t take a C<flags> parameter.

	bool	sv_does(SV* sv, const char *const name)','name' => 'sv_does'},'delimcpy' => {'text' => '','name' => 'delimcpy'},'newLOOPOP' => {'text' => 'Constructs, checks, and returns an op tree expressing a loop.  This is
only a loop in the control flow through the op tree; it does not have
the heavyweight loop structure that allows exiting the loop by C<last>
and suchlike.  I<flags> gives the eight bits of C<op_flags> for the
top-level op, except that some bits will be set automatically as required.
I<expr> supplies the expression controlling loop iteration, and I<block>
supplies the body of the loop; they are consumed by this function and
become part of the constructed op tree.  I<debuggable> is currently
unused and should always be 1.

	OP *	newLOOPOP(I32 flags, I32 debuggable, OP *expr,
		          OP *block)','name' => 'newLOOPOP'},'reg_named_buff_firstkey' => {'text' => '','name' => 'reg_named_buff_firstkey'},'free_global_struct' => {'text' => '','name' => 'free_global_struct'},'uvuni_to_utf8' => {'text' => '','name' => 'uvuni_to_utf8'},'SvLEN' => {'text' => 'Returns the size of the string buffer in the SV, not including any part
attributable to C<SvOOK>.  See C<SvCUR>.

	STRLEN	SvLEN(SV* sv)','name' => 'SvLEN'},'PerlIO_tell' => {'text' => '','name' => 'PerlIO_tell'},'SvPOK_only_UTF8' => {'text' => 'Tells an SV that it is a string and disables all other OK bits,
and leaves the UTF-8 status as it was.

	void	SvPOK_only_UTF8(SV* sv)','name' => 'SvPOK_only_UTF8'},'mg_get' => {'text' => 'Do magic before a value is retrieved from the SV.  The type of SV must
be >= SVt_PVMG. See C<sv_magic>.

	int	mg_get(SV* sv)','name' => 'mg_get'},'SvTRUE' => {'text' => 'Returns a boolean indicating whether Perl would evaluate the SV as true or
false.  See SvOK() for a defined/undefined test.  Handles \'get\' magic
unless the scalar is already SvPOK, SvIOK or SvNOK (the public, not the
private flags).

	bool	SvTRUE(SV* sv)','name' => 'SvTRUE'},'regdump' => {'text' => '','name' => 'regdump'},'my_pclose' => {'text' => '','name' => 'my_pclose'},'hv_iternext_flags' => {'text' => 'Returns entries from a hash iterator.  See C<hv_iterinit> and C<hv_iternext>.
The C<flags> value will normally be zero; if HV_ITERNEXT_WANTPLACEHOLDERS is
set the placeholders keys (for restricted hashes) will be returned in addition
to normal keys. By default placeholders are automatically skipped over.
Currently a placeholder is implemented with a value that is
C<&PL_sv_placeholder>.  Note that the implementation of placeholders and
restricted hashes may change, and the implementation currently is
insufficiently abstracted for any change to be tidy.

NOTE: this function is experimental and may change or be
removed without notice.

	HE*	hv_iternext_flags(HV *hv, I32 flags)','name' => 'hv_iternext_flags'},'is_utf8_string_loclen' => {'text' => 'Like L</is_utf8_string>() but stores the location of the failure (in the
case of "utf8ness failure") or the location C<s>+C<len> (in the case of
"utf8ness success") in the C<ep>, and the number of UTF-8
encoded characters in the C<el>.

See also L</is_utf8_string_loc>() and L</is_utf8_string>().

	bool	is_utf8_string_loclen(const U8 *s, STRLEN len,
		                      const U8 **ep, STRLEN *el)','name' => 'is_utf8_string_loclen'},'call_method' => {'text' => 'Performs a callback to the specified Perl method.  The blessed object must
be on the stack.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_method(const char* methname, I32 flags)','name' => 'call_method'},'BhkENABLE' => {'text' => 'Re-enable an entry in this BHK structure, by setting the appropriate
flag. I<which> is a preprocessor token indicating which entry to enable.
This will assert (under -DDEBUGGING) if the entry doesn\'t contain a valid
pointer.

NOTE: this function is experimental and may change or be
removed without notice.

	void	BhkENABLE(BHK *hk, which)','name' => 'BhkENABLE'},'sys_init' => {'text' => '','name' => 'sys_init'},'perl_parse' => {'text' => 'Tells a Perl interpreter to parse a Perl script.  See L<perlembed>.

	int	perl_parse(PerlInterpreter *my_perl,
		           XSINIT_t xsinit, int argc,
		           char** argv, char** env)','name' => 'perl_parse'},'av_clear' => {'text' => 'Clears an array, making it empty.  Does not free the memory the av uses to
store its list of scalars.  If any destructors are triggered as a result,
the av itself may be freed when this function returns.

Perl equivalent: C<@myarray = ();>.

	void	av_clear(AV *av)','name' => 'av_clear'},'sv_force_normal' => {'text' => 'Undo various types of fakery on an SV: if the PV is a shared string, make
a private copy; if we\'re a ref, stop refing; if we\'re a glob, downgrade to
an xpvmg. See also C<sv_force_normal_flags>.

	void	sv_force_normal(SV *sv)','name' => 'sv_force_normal'},'av_unshift' => {'text' => 'Unshift the given number of C<undef> values onto the beginning of the
array.  The array will grow automatically to accommodate the addition.  You
must then use C<av_store> to assign values to these new elements.

Perl equivalent: C<unshift @myarray, ( (undef) x $n );>

	void	av_unshift(AV *av, I32 num)','name' => 'av_unshift'},'save_set_svflags' => {'text' => '','name' => 'save_set_svflags'},'SvREFCNT_inc_NN' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you know I<sv>
is not NULL.  Since we don\'t have to check the NULLness, it\'s faster
and smaller.

	SV*	SvREFCNT_inc_NN(SV* sv)','name' => 'SvREFCNT_inc_NN'},'sys_term' => {'text' => '','name' => 'sys_term'},'re_intuit_start' => {'text' => '','name' => 're_intuit_start'},'SvUVX' => {'text' => 'Returns the raw value in the SV\'s UV slot, without checks or conversions.
Only use when you are sure SvIOK is true.  See also C<SvUV()>.

	UV	SvUVX(SV* sv)','name' => 'SvUVX'},'hv_copy_hints_hv' => {'text' => 'A specialised version of L</newHVhv> for copying C<%^H>.  I<ohv> must be
a pointer to a hash (which may have C<%^H> magic, but should be generally
non-magical), or C<NULL> (interpreted as an empty hash).  The content
of I<ohv> is copied to a new hash, which has the C<%^H>-specific magic
added to it.  A pointer to the new hash is returned.

	HV *	hv_copy_hints_hv(HV *ohv)','name' => 'hv_copy_hints_hv'},'do_pmop_dump' => {'text' => '','name' => 'do_pmop_dump'},'sv_utf8_decode' => {'text' => 'If the PV of the SV is an octet sequence in UTF-8
and contains a multiple-byte character, the C<SvUTF8> flag is turned on
so that it looks like a character.  If the PV contains only single-byte
characters, the C<SvUTF8> flag stays off.
Scans PV for validity and returns false if the PV is invalid UTF-8.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	sv_utf8_decode(SV *const sv)','name' => 'sv_utf8_decode'},'op_refcnt_unlock' => {'text' => '','name' => 'op_refcnt_unlock'},'hv_stores' => {'text' => 'Like C<hv_store>, but takes a literal string instead of a string/length pair
and omits the hash parameter.

	SV**	hv_stores(HV* tb, const char* key,
		          NULLOK SV* val)','name' => 'hv_stores'},'SvNV_nomg' => {'text' => 'Like C<SvNV> but doesn\'t process magic.

	NV	SvNV_nomg(SV* sv)','name' => 'SvNV_nomg'},'eval_sv' => {'text' => 'Tells Perl to C<eval> the string in the SV. It supports the same flags
as C<call_sv>, with the obvious exception of G_EVAL. See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	eval_sv(SV* sv, I32 flags)','name' => 'eval_sv'},'FREETMPS' => {'text' => 'Closing bracket for temporaries on a callback.  See C<SAVETMPS> and
L<perlcall>.

		FREETMPS;','name' => 'FREETMPS'},'sv_utf8_upgrade_nomg' => {'text' => 'Like sv_utf8_upgrade, but doesn\'t do magic on C<sv>.

	STRLEN	sv_utf8_upgrade_nomg(SV *sv)','name' => 'sv_utf8_upgrade_nomg'},'sv_pvn_force' => {'text' => 'Get a sensible string out of the SV somehow.
A private implementation of the C<SvPV_force> macro for compilers which
can\'t cope with complex macro expressions.  Always use the macro instead.

	char*	sv_pvn_force(SV* sv, STRLEN* lp)','name' => 'sv_pvn_force'},'GIMME' => {'text' => 'A backward-compatible version of C<GIMME_V> which can only return
C<G_SCALAR> or C<G_ARRAY>; in a void context, it returns C<G_SCALAR>.
Deprecated.  Use C<GIMME_V> instead.

	U32	GIMME','name' => 'GIMME'},'SvIOK_UV' => {'text' => 'Returns a boolean indicating whether the SV contains an integer that must be
interpreted as unsigned.  A non-negative integer whose value is within the
range of both an IV and a UV may be be flagged as either SvUOK or SVIOK.

	bool	SvIOK_UV(SV* sv)','name' => 'SvIOK_UV'},'my_snprintf' => {'text' => 'The C library C<snprintf> functionality, if available and
standards-compliant (uses C<vsnprintf>, actually).  However, if the
C<vsnprintf> is not available, will unfortunately use the unsafe
C<vsprintf> which can overrun the buffer (there is an overrun check,
but that may be too late).  Consider using C<sv_vcatpvf> instead, or
getting C<vsnprintf>.

	int	my_snprintf(char *buffer, const Size_t len,
		            const char *format, ...)','name' => 'my_snprintf'},'newLOGOP' => {'text' => 'Constructs, checks, and returns a logical (flow control) op.  I<type>
is the opcode.  I<flags> gives the eight bits of C<op_flags>, except
that C<OPf_KIDS> will be set automatically, and, shifted up eight bits,
the eight bits of C<op_private>, except that the bit with value 1 is
automatically set.  I<first> supplies the expression controlling the
flow, and I<other> supplies the side (alternate) chain of ops; they are
consumed by this function and become part of the constructed op tree.

	OP *	newLOGOP(I32 type, I32 flags, OP *first,
		         OP *other)','name' => 'newLOGOP'},'gp_ref' => {'text' => '','name' => 'gp_ref'},'save_op' => {'text' => '','name' => 'save_op'},'perl_construct' => {'text' => 'Initializes a new Perl interpreter.  See L<perlembed>.

	void	perl_construct(PerlInterpreter *my_perl)','name' => 'perl_construct'},'SvUOK' => {'text' => 'Returns a boolean indicating whether the SV contains an integer that must be
interpreted as unsigned.  A non-negative integer whose value is within the
range of both an IV and a UV may be be flagged as either SvUOK or SVIOK.

	bool	SvUOK(SV* sv)','name' => 'SvUOK'},'newWHENOP' => {'text' => 'Constructs, checks, and returns an op tree expressing a C<when> block.
I<cond> supplies the test expression, and I<block> supplies the block
that will be executed if the test evaluates to true; they are consumed
by this function and become part of the constructed op tree.  I<cond>
will be interpreted DWIMically, often as a comparison against C<$_>,
and may be null to generate a C<default> block.

	OP *	newWHENOP(OP *cond, OP *block)','name' => 'newWHENOP'},'sv_dec' => {'text' => 'Auto-decrement of the value in the SV, doing string to numeric conversion
if necessary.  Handles \'get\' magic and operator overloading.

	void	sv_dec(SV *const sv)','name' => 'sv_dec'},'pv_display' => {'text' => 'Similar to

  pv_escape(dsv,pv,cur,pvlim,PERL_PV_ESCAPE_QUOTE);

except that an additional "\\0" will be appended to the string when
len > cur and pv[cur] is "\\0".

Note that the final string may be up to 7 chars longer than pvlim.

	char*	pv_display(SV *dsv, const char *pv, STRLEN cur,
		           STRLEN len, STRLEN pvlim)','name' => 'pv_display'},'newHVREF' => {'text' => '','name' => 'newHVREF'},'sv_2pvbyte_nolen' => {'text' => 'Return a pointer to the byte-encoded representation of the SV.
May cause the SV to be downgraded from UTF-8 as a side-effect.

Usually accessed via the C<SvPVbyte_nolen> macro.

	char*	sv_2pvbyte_nolen(SV* sv)','name' => 'sv_2pvbyte_nolen'},'PadlistMAX' => {'text' => 'The index of the last pad in the padlist.

NOTE: this function is experimental and may change or be
removed without notice.

	SSize_t	PadlistMAX(PADLIST padlist)','name' => 'PadlistMAX'},'PerlIO_fileno' => {'text' => '','name' => 'PerlIO_fileno'},'uvchr_to_utf8' => {'text' => 'Adds the UTF-8 representation of the Native code point C<uv> to the end
of the string C<d>; C<d> should have at least C<UTF8_MAXBYTES+1> free
bytes available. The return value is the pointer to the byte after the
end of the new character. In other words,

    d = uvchr_to_utf8(d, uv);

is the recommended wide native character-aware way of saying

    *(d++) = uv;

	U8*	uvchr_to_utf8(U8 *d, UV uv)','name' => 'uvchr_to_utf8'},'isDIGIT' => {'text' => 'Returns a boolean indicating whether the specified character is a
digit, analogous to C<m/[[:digit:]]/>.
Variants C<isDIGIT_A> and C<isDIGIT_L1> are identical to C<isDIGIT>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isDIGIT_uni>, C<isDIGIT_utf8>, C<isDIGIT_LC>, C<isDIGIT_LC_uvchr>, and
C<isDIGIT_LC_utf8>.

	bool	isDIGIT(char ch)','name' => 'isDIGIT'},'call_atexit' => {'text' => '','name' => 'call_atexit'},'my_bzero' => {'text' => '','name' => 'my_bzero'},'newCONSTSUB' => {'text' => 'See L</newCONSTSUB_flags>.

	CV*	newCONSTSUB(HV* stash, const char* name, SV* sv)','name' => 'newCONSTSUB'},'SvSHARE' => {'text' => 'Arranges for sv to be shared between threads if a suitable module
has been loaded.

	void	SvSHARE(SV* sv)','name' => 'SvSHARE'},'vwarner' => {'text' => '','name' => 'vwarner'},'sortsv' => {'text' => 'Sort an array. Here is an example:

    sortsv(AvARRAY(av), av_top_index(av)+1, Perl_sv_cmp_locale);

Currently this always uses mergesort. See sortsv_flags for a more
flexible routine.

	void	sortsv(SV** array, size_t num_elts,
		       SVCOMPARE_t cmp)','name' => 'sortsv'},'av_tindex' => {'text' => 'Same as C<av_top_index()>.

	int	av_tindex(AV* av)','name' => 'av_tindex'},'cophh_store_pvs' => {'text' => 'Like L</cophh_store_pvn>, but takes a literal string instead of a
string/length pair, and no precomputed hash.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_store_pvs(const COPHH *cophh,
		                const char *key, SV *value,
		                U32 flags)','name' => 'cophh_store_pvs'},'sys_intern_clear' => {'text' => '','name' => 'sys_intern_clear'},'my_ntohl' => {'text' => '','name' => 'my_ntohl'},'doref' => {'text' => '','name' => 'doref'},'scan_bin' => {'text' => 'For backwards compatibility. Use C<grok_bin> instead.

	NV	scan_bin(const char* start, STRLEN len,
		         STRLEN* retlen)','name' => 'scan_bin'},'Nullcv' => {'text' => 'Null CV pointer.

(deprecated - use C<(CV *)NULL> instead)','name' => 'Nullcv'},'PadlistREFCNT' => {'text' => 'The reference count of the padlist.  Currently this is always 1.

NOTE: this function is experimental and may change or be
removed without notice.

	U32	PadlistREFCNT(PADLIST padlist)','name' => 'PadlistREFCNT'},'sv_catpvs_nomg' => {'text' => 'Like C<sv_catpvn_nomg>, but takes a literal string instead of a
string/length pair.

	void	sv_catpvs_nomg(SV* sv, const char* s)','name' => 'sv_catpvs_nomg'},'lex_bufutf8' => {'text' => 'Indicates whether the octets in the lexer buffer
(L</PL_parser-E<gt>linestr>) should be interpreted as the UTF-8 encoding
of Unicode characters.  If not, they should be interpreted as Latin-1
characters.  This is analogous to the C<SvUTF8> flag for scalars.

In UTF-8 mode, it is not guaranteed that the lexer buffer actually
contains valid UTF-8.  Lexing code must be robust in the face of invalid
encoding.

The actual C<SvUTF8> flag of the L</PL_parser-E<gt>linestr> scalar
is significant, but not the whole story regarding the input character
encoding.  Normally, when a file is being read, the scalar contains octets
and its C<SvUTF8> flag is off, but the octets should be interpreted as
UTF-8 if the C<use utf8> pragma is in effect.  During a string eval,
however, the scalar may have the C<SvUTF8> flag on, and in this case its
octets should be interpreted as UTF-8 unless the C<use bytes> pragma
is in effect.  This logic may change in the future; use this function
instead of implementing the logic yourself.

NOTE: this function is experimental and may change or be
removed without notice.

	bool	lex_bufutf8()','name' => 'lex_bufutf8'},'MULTICALL' => {'text' => 'Make a lightweight callback. See L<perlcall/LIGHTWEIGHT CALLBACKS>.

		MULTICALL;','name' => 'MULTICALL'},'debprofdump' => {'text' => '','name' => 'debprofdump'},'SvPVbyte' => {'text' => 'Like C<SvPV>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte(SV* sv, STRLEN len)','name' => 'SvPVbyte'},'savesharedpvs' => {'text' => 'A version of C<savepvs()> which allocates the duplicate string in memory
which is shared between threads.

	char*	savesharedpvs(const char* s)','name' => 'savesharedpvs'},'sys_init3' => {'text' => '','name' => 'sys_init3'},'gv_fetchmeth_pv' => {'text' => 'Exactly like L</gv_fetchmeth_pvn>, but takes a nul-terminated string 
instead of a string/length pair.

	GV*	gv_fetchmeth_pv(HV* stash, const char* name,
		                I32 level, U32 flags)','name' => 'gv_fetchmeth_pv'},'PerlIO_stdout' => {'text' => '','name' => 'PerlIO_stdout'},'XS_INTERNAL' => {'text' => 'Macro to declare an XSUB and its C parameter list without exporting the symbols.
This is handled by C<xsubpp> and generally preferable over exporting the XSUB
symbols unnecessarily.','name' => 'XS_INTERNAL'},'SAVETMPS' => {'text' => 'Opening bracket for temporaries on a callback.  See C<FREETMPS> and
L<perlcall>.

		SAVETMPS;','name' => 'SAVETMPS'},'AvFILL' => {'text' => 'Same as C<av_top_index()>.  Deprecated, use C<av_top_index()> instead.

	int	AvFILL(AV* av)','name' => 'AvFILL'},'SvPVutf8x' => {'text' => 'Like C<SvPV>, but converts sv to utf8 first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVutf8>
otherwise.

	char*	SvPVutf8x(SV* sv, STRLEN len)','name' => 'SvPVutf8x'},'ORIGMARK' => {'text' => 'The original stack mark for the XSUB.  See C<dORIGMARK>.','name' => 'ORIGMARK'},'sv_2cv' => {'text' => 'Using various gambits, try to get a CV from an SV; in addition, try if
possible to set C<*st> and C<*gvp> to the stash and GV associated with it.
The flags in C<lref> are passed to gv_fetchsv.

	CV*	sv_2cv(SV* sv, HV **const st, GV **const gvp,
		       const I32 lref)','name' => 'sv_2cv'},'gp_free' => {'text' => '','name' => 'gp_free'},'SvPV_force_nomg' => {'text' => 'Like C<SvPV_force>, but doesn\'t process get magic.

	char*	SvPV_force_nomg(SV* sv, STRLEN len)','name' => 'SvPV_force_nomg'},'SvPOK_only' => {'text' => 'Tells an SV that it is a string and disables all other OK bits.
Will also turn off the UTF-8 status.

	void	SvPOK_only(SV* sv)','name' => 'SvPOK_only'},'save_destructor_x' => {'text' => '','name' => 'save_destructor_x'},'sv_usepvn_mg' => {'text' => 'Like C<sv_usepvn>, but also handles \'set\' magic.

	void	sv_usepvn_mg(SV *sv, char *ptr, STRLEN len)','name' => 'sv_usepvn_mg'},'hv_fetch' => {'text' => 'Returns the SV which corresponds to the specified key in the hash.
The absolute value of C<klen> is the length of the key.  If C<klen> is
negative the key is assumed to be in UTF-8-encoded Unicode.  If
C<lval> is set then the fetch will be part of a store.  This means that if
there is no value in the hash associated with the given key, then one is
created and a pointer to it is returned.  The C<SV*> it points to can be
assigned to.  But always check that the
return value is non-null before dereferencing it to an C<SV*>.

See L<perlguts/"Understanding the Magic of Tied Hashes and Arrays"> for more
information on how to use this function on tied hashes.

	SV**	hv_fetch(HV *hv, const char *key, I32 klen,
		         I32 lval)','name' => 'hv_fetch'},'sv_pvbyte' => {'text' => 'Use C<SvPVbyte_nolen> instead.

	char*	sv_pvbyte(SV *sv)','name' => 'sv_pvbyte'},'XCPT_TRY_START' => {'text' => 'Starts a try block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_TRY_START'},'sv_unref_flags' => {'text' => 'Unsets the RV status of the SV, and decrements the reference count of
whatever was being referenced by the RV.  This can almost be thought of
as a reversal of C<newSVrv>.  The C<cflags> argument can contain
C<SV_IMMEDIATE_UNREF> to force the reference count to be decremented
(otherwise the decrementing is conditional on the reference count being
different from one or the reference being a readonly SV).
See C<SvROK_off>.

	void	sv_unref_flags(SV *const ref, const U32 flags)','name' => 'sv_unref_flags'},'isPSXSPC' => {'text' => '(short for Posix Space)
Starting in 5.18, this is identical (experimentally) in all its forms to the
corresponding C<isSPACE()> macros.  ("Experimentally" means that this change
may be backed out in 5.20 or 5.22 if field experience indicates that it
was unwise.)
The locale forms of this macro are identical to their corresponding
C<isSPACE()> forms in all Perl releases.  In releases prior to 5.18, the
non-locale forms differ from their C<isSPACE()> forms only in that the
C<isSPACE()> forms don\'t match a Vertical Tab, and the C<isPSXSPC()> forms do.
Otherwise they are identical.  Thus this macro is analogous to what
C<m/[[:space:]]/> matches in a regular expression.
See the L<top of this section|/Character classes> for an explanation of variants
C<isPSXSPC_A>, C<isPSXSPC_L1>, C<isPSXSPC_uni>, C<isPSXSPC_utf8>, C<isPSXSPC_LC>,
C<isPSXSPC_LC_uvchr>, and C<isPSXSPC_LC_utf8>.

	bool	isPSXSPC(char ch)','name' => 'isPSXSPC'},'SvRV' => {'text' => 'Dereferences an RV to return the SV.

	SV*	SvRV(SV* sv)','name' => 'SvRV'},'hv_scalar' => {'text' => 'Evaluates the hash in scalar context and returns the result. Handles magic when the hash is tied.

	SV*	hv_scalar(HV *hv)','name' => 'hv_scalar'},'mg_copy' => {'text' => 'Copies the magic from one SV to another.  See C<sv_magic>.

	int	mg_copy(SV *sv, SV *nsv, const char *key,
		        I32 klen)','name' => 'mg_copy'},'save_I16' => {'text' => '','name' => 'save_I16'},'sv_rvweaken' => {'text' => 'Weaken a reference: set the C<SvWEAKREF> flag on this RV; give the
referred-to SV C<PERL_MAGIC_backref> magic if it hasn\'t already; and
push a back-reference to this RV onto the array of backreferences
associated with that magic.  If the RV is magical, set magic will be
called after the RV is cleared.

	SV*	sv_rvweaken(SV *const sv)','name' => 'sv_rvweaken'},'grok_oct' => {'text' => 'converts a string representing an octal number to numeric form.

On entry I<start> and I<*len> give the string to scan, I<*flags> gives
conversion flags, and I<result> should be NULL or a pointer to an NV.
The scan stops at the end of the string, or the first invalid character.
Unless C<PERL_SCAN_SILENT_ILLDIGIT> is set in I<*flags>, encountering an
8 or 9 will also trigger a warning.
On return I<*len> is set to the length of the scanned string,
and I<*flags> gives output flags.

If the value is <= UV_MAX it is returned as a UV, the output flags are clear,
and nothing is written to I<*result>. If the value is > UV_MAX C<grok_oct>
returns UV_MAX, sets C<PERL_SCAN_GREATER_THAN_UV_MAX> in the output flags,
and writes the value to I<*result> (or the value is discarded if I<result>
is NULL).

If C<PERL_SCAN_ALLOW_UNDERSCORES> is set in I<*flags> then the octal
number may use \'_\' characters to separate digits.

	UV	grok_oct(const char* start, STRLEN* len_p,
		         I32* flags, NV *result)','name' => 'grok_oct'},'MARK' => {'text' => 'Stack marker variable for the XSUB.  See C<dMARK>.','name' => 'MARK'},'newSVpvn' => {'text' => 'Creates a new SV and copies a buffer into it, which may contain NUL characters
(C<\\0>) and other binary data.  The reference count for the SV is set to 1.
Note that if C<len> is zero, Perl will create a zero length (Perl) string.  You
are responsible for ensuring that the source buffer is at least
C<len> bytes long.  If the C<buffer> argument is NULL the new SV will be
undefined.

	SV*	newSVpvn(const char *const s, const STRLEN len)','name' => 'newSVpvn'},'scan_hex' => {'text' => 'For backwards compatibility. Use C<grok_hex> instead.

	NV	scan_hex(const char* start, STRLEN len,
		         STRLEN* retlen)','name' => 'scan_hex'},'unpackstring' => {'text' => 'The engine implementing the unpack() Perl function.

Using the template pat..patend, this function unpacks the string
s..strend into a number of mortal SVs, which it pushes onto the perl
argument (@_) stack (so you will need to issue a C<PUTBACK> before and
C<SPAGAIN> after the call to this function). It returns the number of
pushed elements.

The strend and patend pointers should point to the byte following the last
character of each string.

Although this function returns its values on the perl argument stack, it
doesn\'t take any parameters from that stack (and thus in particular
there\'s no need to do a PUSHMARK before calling it, unlike L</call_pv> for
example).

	I32	unpackstring(const char *pat,
		             const char *patend, const char *s,
		             const char *strend, U32 flags)','name' => 'unpackstring'},'av_extend' => {'text' => 'Pre-extend an array.  The C<key> is the index to which the array should be
extended.

	void	av_extend(AV *av, I32 key)','name' => 'av_extend'},'sv_peek' => {'text' => '','name' => 'sv_peek'},'hv_iternext' => {'text' => 'Returns entries from a hash iterator.  See C<hv_iterinit>.

You may call C<hv_delete> or C<hv_delete_ent> on the hash entry that the
iterator currently points to, without losing your place or invalidating your
iterator.  Note that in this case the current entry is deleted from the hash
with your iterator holding the last reference to it.  Your iterator is flagged
to free the entry on the next call to C<hv_iternext>, so you must not discard
your iterator immediately else the entry will leak - call C<hv_iternext> to
trigger the resource deallocation.

	HE*	hv_iternext(HV *hv)','name' => 'hv_iternext'},'SVt_REGEXP' => {'text' => 'Type flag for regular expressions.  See L</svtype>.','name' => 'SVt_REGEXP'},'hv_store_ent' => {'text' => 'Stores C<val> in a hash.  The hash key is specified as C<key>.  The C<hash>
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

	HE*	hv_store_ent(HV *hv, SV *key, SV *val, U32 hash)','name' => 'hv_store_ent'},'hv_eiter_set' => {'text' => '','name' => 'hv_eiter_set'},'gv_stashsv' => {'text' => 'Returns a pointer to the stash for a specified package.  See C<gv_stashpvn>.

	HV*	gv_stashsv(SV* sv, I32 flags)','name' => 'gv_stashsv'},'newXSproto' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.  Adds Perl prototypes to
the subs.','name' => 'newXSproto'},'form' => {'text' => 'Takes a sprintf-style format pattern and conventional
(non-SV) arguments and returns the formatted string.

    (char *) Perl_form(pTHX_ const char* pat, ...)

can be used any place a string (char *) is required:

    char * s = Perl_form("%d.%d",major,minor);

Uses a single private buffer so if you want to format several strings you
must explicitly copy the earlier strings away (and free the copies when you
are done).

	char*	form(const char* pat, ...)','name' => 'form'},'instr' => {'text' => '','name' => 'instr'},'pregexec' => {'text' => '','name' => 'pregexec'},'is_utf8_string' => {'text' => 'Returns true if the first C<len> bytes of string C<s> form a valid
UTF-8 string, false otherwise.  If C<len> is 0, it will be calculated
using C<strlen(s)> (which means if you use this option, that C<s> has to have a
terminating NUL byte).  Note that all characters being ASCII constitute \'a
valid UTF-8 string\'.

See also L</is_ascii_string>(), L</is_utf8_string_loclen>(), and L</is_utf8_string_loc>().

	bool	is_utf8_string(const U8 *s, STRLEN len)','name' => 'is_utf8_string'},'PadnamelistARRAY' => {'text' => 'The C array of pad names.

NOTE: this function is experimental and may change or be
removed without notice.

	PADNAME ** PadnamelistARRAY(PADNAMELIST pnl)','name' => 'PadnamelistARRAY'},'croak_xs_usage' => {'text' => 'A specialised variant of C<croak()> for emitting the usage message for xsubs

    croak_xs_usage(cv, "eee_yow");

works out the package name and subroutine name from C<cv>, and then calls
C<croak()>. Hence if C<cv> is C<&ouch::awk>, it would call C<croak> as:

    Perl_croak(aTHX_ "Usage: %"SVf"::%"SVf"(%s)", "ouch" "awk", "eee_yow");

	void	croak_xs_usage(const CV *const cv,
		               const char *const params)','name' => 'croak_xs_usage'},'sv_insert' => {'text' => 'Inserts a string at the specified offset/length within the SV.  Similar to
the Perl substr() function.  Handles get magic.

	void	sv_insert(SV *const bigstr, const STRLEN offset,
		          const STRLEN len,
		          const char *const little,
		          const STRLEN littlelen)','name' => 'sv_insert'},'SvPOK' => {'text' => 'Returns a U32 value indicating whether the SV contains a character
string.

	U32	SvPOK(SV* sv)','name' => 'SvPOK'},'sv_destroyable' => {'text' => 'Dummy routine which reports that object can be destroyed when there is no
sharing module present.  It ignores its single SV argument, and returns
\'true\'.  Exists to avoid test for a NULL function pointer and because it
could potentially warn under some level of strict-ness.

	bool	sv_destroyable(SV *sv)','name' => 'sv_destroyable'},'save_aelem_flags' => {'text' => '','name' => 'save_aelem_flags'},'PadlistNAMES' => {'text' => 'The names associated with pad entries.

NOTE: this function is experimental and may change or be
removed without notice.

	PADNAMELIST * PadlistNAMES(PADLIST padlist)','name' => 'PadlistNAMES'},'XS' => {'text' => 'Macro to declare an XSUB and its C parameter list.  This is handled by
C<xsubpp>. It is the same as using the more explicit XS_EXTERNAL macro.','name' => 'XS'},'gv_check' => {'text' => '','name' => 'gv_check'},'sv_setpvn' => {'text' => 'Copies a string into an SV.  The C<len> parameter indicates the number of
bytes to be copied.  If the C<ptr> argument is NULL the SV will become
undefined.  Does not handle \'set\' magic.  See C<sv_setpvn_mg>.

	void	sv_setpvn(SV *const sv, const char *const ptr,
		          const STRLEN len)','name' => 'sv_setpvn'},'mg_magical' => {'text' => 'Turns on the magical status of an SV.  See C<sv_magic>.

	void	mg_magical(SV* sv)','name' => 'mg_magical'},'op_linklist' => {'text' => 'This function is the implementation of the L</LINKLIST> macro. It should
not be called directly.

	OP*	op_linklist(OP *o)','name' => 'op_linklist'},'newSVrv' => {'text' => 'Creates a new SV for the existing RV, C<rv>, to point to.  If C<rv> is not an
RV then it will be upgraded to one.  If C<classname> is non-null then the new
SV will be blessed in the specified package.  The new SV is returned and its
reference count is 1. The reference count 1 is owned by C<rv>.

	SV*	newSVrv(SV *const rv,
		        const char *const classname)','name' => 'newSVrv'},'cast_i32' => {'text' => '','name' => 'cast_i32'},'strnEQ' => {'text' => 'Test two strings to see if they are equal.  The C<len> parameter indicates
the number of bytes to compare.  Returns true or false. (A wrapper for
C<strncmp>).

	bool	strnEQ(char* s1, char* s2, STRLEN len)','name' => 'strnEQ'},'sv_dup_inc' => {'text' => '','name' => 'sv_dup_inc'},'newMYSUB' => {'text' => '','name' => 'newMYSUB'},'PoisonWith' => {'text' => 'Fill up memory with a byte pattern (a byte repeated over and over
again) that hopefully catches attempts to access uninitialized memory.

	void	PoisonWith(void* dest, int nitems, type,
		           U8 byte)','name' => 'PoisonWith'},'av_create_and_unshift_one' => {'text' => 'Unshifts an SV onto the beginning of the array, creating the array if
necessary.
A small internal helper function to remove a commonly duplicated idiom.

NOTE: this function is experimental and may change or be
removed without notice.

	SV**	av_create_and_unshift_one(AV **const avp,
		                          SV *const val)','name' => 'av_create_and_unshift_one'},'SvNIOK_off' => {'text' => 'Unsets the NV/IV status of an SV.

	void	SvNIOK_off(SV* sv)','name' => 'SvNIOK_off'},'bytes_cmp_utf8' => {'text' => 'Compares the sequence of characters (stored as octets) in C<b>, C<blen> with the
sequence of characters (stored as UTF-8) in C<u>, C<ulen>. Returns 0 if they are
equal, -1 or -2 if the first string is less than the second string, +1 or +2
if the first string is greater than the second string.

-1 or +1 is returned if the shorter string was identical to the start of the
longer string. -2 or +2 is returned if the was a difference between characters
within the strings.

	int	bytes_cmp_utf8(const U8 *b, STRLEN blen,
		               const U8 *u, STRLEN ulen)','name' => 'bytes_cmp_utf8'},'seed' => {'text' => '','name' => 'seed'},'pad_findmy_pvs' => {'text' => 'Exactly like L</pad_findmy_pvn>, but takes a literal string instead
of a string/length pair.

	PADOFFSET pad_findmy_pvs(const char *name, U32 flags)','name' => 'pad_findmy_pvs'},'sv_magic' => {'text' => 'Adds magic to an SV.  First upgrades C<sv> to type C<SVt_PVMG> if
necessary, then adds a new magic item of type C<how> to the head of the
magic list.

See C<sv_magicext> (which C<sv_magic> now calls) for a description of the
handling of the C<name> and C<namlen> arguments.

You need to use C<sv_magicext> to add magic to SvREADONLY SVs and also
to add more than one instance of the same \'how\'.

	void	sv_magic(SV *const sv, SV *const obj,
		         const int how, const char *const name,
		         const I32 namlen)','name' => 'sv_magic'},'sv_utf8_upgrade_flags' => {'text' => 'Converts the PV of an SV to its UTF-8-encoded form.
Forces the SV to string form if it is not already.
Always sets the SvUTF8 flag to avoid future validity checks even
if all the bytes are invariant in UTF-8.
If C<flags> has C<SV_GMAGIC> bit set,
will C<mg_get> on C<sv> if appropriate, else not.
Returns the number of bytes in the converted string
C<sv_utf8_upgrade> and
C<sv_utf8_upgrade_nomg> are implemented in terms of this function.

This is not a general purpose byte encoding to Unicode interface:
use the Encode extension for that.

	STRLEN	sv_utf8_upgrade_flags(SV *const sv,
		                      const I32 flags)','name' => 'sv_utf8_upgrade_flags'},'do_open9' => {'text' => '','name' => 'do_open9'},'magic_dump' => {'text' => '','name' => 'magic_dump'},'sv_catpvs_mg' => {'text' => 'Like C<sv_catpvn_mg>, but takes a literal string instead of a
string/length pair.

	void	sv_catpvs_mg(SV* sv, const char* s)','name' => 'sv_catpvs_mg'},'sv_setpvs_mg' => {'text' => 'Like C<sv_setpvn_mg>, but takes a literal string instead of a
string/length pair.

	void	sv_setpvs_mg(SV* sv, const char* s)','name' => 'sv_setpvs_mg'},'gv_fetchfile_flags' => {'text' => '','name' => 'gv_fetchfile_flags'},'SvREFCNT_inc_void' => {'text' => 'Same as SvREFCNT_inc, but can only be used if you don\'t need the
return value.  The macro doesn\'t need to return a meaningful value.

	void	SvREFCNT_inc_void(SV* sv)','name' => 'SvREFCNT_inc_void'},'leave_scope' => {'text' => '','name' => 'leave_scope'},'newSTATEOP' => {'text' => 'Constructs a state op (COP).  The state op is normally a C<nextstate> op,
but will be a C<dbstate> op if debugging is enabled for currently-compiled
code.  The state op is populated from L</PL_curcop> (or L</PL_compiling>).
If I<label> is non-null, it supplies the name of a label to attach to
the state op; this function takes ownership of the memory pointed at by
I<label>, and will free it.  I<flags> gives the eight bits of C<op_flags>
for the state op.

If I<o> is null, the state op is returned.  Otherwise the state op is
combined with I<o> into a C<lineseq> list op, which is returned.  I<o>
is consumed by this function and becomes part of the returned op tree.

	OP *	newSTATEOP(I32 flags, char *label, OP *o)','name' => 'newSTATEOP'},'my_fork' => {'text' => '','name' => 'my_fork'},'isBLANK' => {'text' => 'Returns a boolean indicating whether the specified character is a
character considered to be a blank, analogous to C<m/[[:blank:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isBLANK_A>, C<isBLANK_L1>, C<isBLANK_uni>, C<isBLANK_utf8>, C<isBLANK_LC>,
C<isBLANK_LC_uvchr>, and C<isBLANK_LC_utf8>.  Note, however, that some
platforms do not have the C library routine C<isblank()>.  In these cases, the
variants whose names contain C<LC> are the same as the corresponding ones
without.

	bool	isBLANK(char ch)','name' => 'isBLANK'},'SvROK' => {'text' => 'Tests if the SV is an RV.

	U32	SvROK(SV* sv)','name' => 'SvROK'},'sv_unref' => {'text' => 'Unsets the RV status of the SV, and decrements the reference count of
whatever was being referenced by the RV.  This can almost be thought of
as a reversal of C<newSVrv>.  This is C<sv_unref_flags> with the C<flag>
being zero.  See C<SvROK_off>.

	void	sv_unref(SV* sv)','name' => 'sv_unref'},'moreswitches' => {'text' => '','name' => 'moreswitches'},'cophh_fetch_pvs' => {'text' => 'Like L</cophh_fetch_pvn>, but takes a literal string instead of a
string/length pair, and no precomputed hash.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	cophh_fetch_pvs(const COPHH *cophh,
		                const char *key, U32 flags)','name' => 'cophh_fetch_pvs'},'ptr_table_fetch' => {'text' => '','name' => 'ptr_table_fetch'},'save_nogv' => {'text' => '','name' => 'save_nogv'},'sv_setnv' => {'text' => 'Copies a double into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setnv_mg>.

	void	sv_setnv(SV *const sv, const NV num)','name' => 'sv_setnv'},'SvREFCNT_inc_simple_NN' => {'text' => 'Same as SvREFCNT_inc_simple, but can only be used if you know I<sv>
is not NULL.  Since we don\'t have to check the NULLness, it\'s faster
and smaller.

	SV*	SvREFCNT_inc_simple_NN(SV* sv)','name' => 'SvREFCNT_inc_simple_NN'},'newHV' => {'text' => 'Creates a new HV.  The reference count is set to 1.

	HV*	newHV()','name' => 'newHV'},'SVt_PVFM' => {'text' => 'Type flag for formats.  See L</svtype>.','name' => 'SVt_PVFM'},'gv_dump' => {'text' => '','name' => 'gv_dump'},'strNE' => {'text' => 'Test two strings to see if they are different.  Returns true or
false.

	bool	strNE(char* s1, char* s2)','name' => 'strNE'},'my_strlcpy' => {'text' => '','name' => 'my_strlcpy'},'PerlIO_fill' => {'text' => '','name' => 'PerlIO_fill'},'caller_cx' => {'text' => 'The XSUB-writer\'s equivalent of L<caller()|perlfunc/caller>. The
returned C<PERL_CONTEXT> structure can be interrogated to find all the
information returned to Perl by C<caller>. Note that XSUBs don\'t get a
stack frame, so C<caller_cx(0, NULL)> will return information for the
immediately-surrounding Perl code.

This function skips over the automatic calls to C<&DB::sub> made on the
behalf of the debugger. If the stack frame requested was a sub called by
C<DB::sub>, the return value will be the frame for the call to
C<DB::sub>, since that has the correct line number/etc. for the call
site. If I<dbcxp> is non-C<NULL>, it will be set to a pointer to the
frame for the sub call itself.

	const PERL_CONTEXT * caller_cx(
	                         I32 level,
	                         const PERL_CONTEXT **dbcxp
	                     )','name' => 'caller_cx'},'my_failure_exit' => {'text' => '','name' => 'my_failure_exit'},'cophh_copy' => {'text' => 'Make and return a complete copy of the cop hints hash I<cophh>.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_copy(COPHH *cophh)','name' => 'cophh_copy'},'sv_pvutf8n_force' => {'text' => 'The backend for the C<SvPVutf8x_force> macro.  Always use the macro
instead.

	char*	sv_pvutf8n_force(SV *const sv, STRLEN *const lp)','name' => 'sv_pvutf8n_force'},'do_sv_dump' => {'text' => '','name' => 'do_sv_dump'},'SvNV_set' => {'text' => 'Set the value of the NV pointer in sv to val.  See C<SvIV_set>.

	void	SvNV_set(SV* sv, NV val)','name' => 'SvNV_set'},'die_sv' => {'text' => 'Behaves the same as L</croak_sv>, except for the return type.
It should be used only where the C<OP *> return type is required.
The function never actually returns.

	OP *	die_sv(SV *baseex)','name' => 'die_sv'},'newAV' => {'text' => 'Creates a new AV.  The reference count is set to 1.

Perl equivalent: C<my @array;>.

	AV*	newAV()','name' => 'newAV'},'bytes_from_utf8' => {'text' => 'Converts a string C<s> of length C<len> from UTF-8 into native byte encoding.
Unlike L</utf8_to_bytes> but like L</bytes_to_utf8>, returns a pointer to
the newly-created string, and updates C<len> to contain the new
length.  Returns the original string if no conversion occurs, C<len>
is unchanged. Do nothing if C<is_utf8> points to 0. Sets C<is_utf8> to
0 if C<s> is converted or consisted entirely of characters that are invariant
in utf8 (i.e., US-ASCII on non-EBCDIC machines).

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	bytes_from_utf8(const U8 *s, STRLEN *len,
		                bool *is_utf8)','name' => 'bytes_from_utf8'},'SvPV_nomg_nolen' => {'text' => 'Like C<SvPV_nolen> but doesn\'t process magic.

	char*	SvPV_nomg_nolen(SV* sv)','name' => 'SvPV_nomg_nolen'},'dump_sub' => {'text' => '','name' => 'dump_sub'},'vload_module' => {'text' => '','name' => 'vload_module'},'save_adelete' => {'text' => '','name' => 'save_adelete'},'av_make' => {'text' => 'Creates a new AV and populates it with a list of SVs.  The SVs are copied
into the array, so they may be freed after the call to av_make.  The new AV
will have a reference count of 1.

Perl equivalent: C<my @new_array = ($scalar1, $scalar2, $scalar3...);>

	AV*	av_make(I32 size, SV **strp)','name' => 'av_make'},'SvUV' => {'text' => 'Coerces the given SV to an unsigned integer and returns it.  See C<SvUVx>
for a version which guarantees to evaluate sv only once.

	UV	SvUV(SV* sv)','name' => 'SvUV'},'hv_name_set' => {'text' => '','name' => 'hv_name_set'},'cophh_store_pvn' => {'text' => 'Stores a value, associated with a key, in the cop hints hash I<cophh>,
and returns the modified hash.  The returned hash pointer is in general
not the same as the hash pointer that was passed in.  The input hash is
consumed by the function, and the pointer to it must not be subsequently
used.  Use L</cophh_copy> if you need both hashes.

The key is specified by I<keypv> and I<keylen>.  If I<flags> has the
C<COPHH_KEY_UTF8> bit set, the key octets are interpreted as UTF-8,
otherwise they are interpreted as Latin-1.  I<hash> is a precomputed
hash of the key string, or zero if it has not been precomputed.

I<value> is the scalar value to store for this key.  I<value> is copied
by this function, which thus does not take ownership of any reference
to it, and later changes to the scalar will not be reflected in the
value visible in the cop hints hash.  Complex types of scalar will not
be stored with referential integrity, but will be coerced to strings.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_store_pvn(COPHH *cophh, const char *keypv,
		                STRLEN keylen, U32 hash,
		                SV *value, U32 flags)','name' => 'cophh_store_pvn'},'perl_run' => {'text' => 'Tells a Perl interpreter to run.  See L<perlembed>.

	int	perl_run(PerlInterpreter *my_perl)','name' => 'perl_run'},'mess_nocontext' => {'text' => '','name' => 'mess_nocontext'},'sv_insert_flags' => {'text' => 'Same as C<sv_insert>, but the extra C<flags> are passed to the
C<SvPV_force_flags> that applies to C<bigstr>.

	void	sv_insert_flags(SV *const bigstr,
		                const STRLEN offset,
		                const STRLEN len,
		                const char *const little,
		                const STRLEN littlelen,
		                const U32 flags)','name' => 'sv_insert_flags'},'OP_CLASS' => {'text' => 'Return the class of the provided OP: that is, which of the *OP
structures it uses. For core ops this currently gets the information out
of PL_opargs, which does not always accurately reflect the type used.
For custom ops the type is returned from the registration, and it is up
to the registree to ensure it is accurate. The value returned will be
one of the OA_* constants from op.h.

	U32	OP_CLASS(OP *o)','name' => 'OP_CLASS'},'SvPVutf8_nolen' => {'text' => 'Like C<SvPV_nolen>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8_nolen(SV* sv)','name' => 'SvPVutf8_nolen'},'SvRXOK' => {'text' => 'Returns a boolean indicating whether the SV (or the one it references)
is a REGEXP.

If you want to do something with the REGEXP* later use SvRX instead
and check for NULL.

	bool	SvRXOK(SV* sv)','name' => 'SvRXOK'},'sv_dup' => {'text' => '','name' => 'sv_dup'},'sv_setpviv' => {'text' => 'Copies an integer into the given SV, also updating its string value.
Does not handle \'set\' magic.  See C<sv_setpviv_mg>.

	void	sv_setpviv(SV *const sv, const IV num)','name' => 'sv_setpviv'},'sv_true' => {'text' => 'Returns true if the SV has a true value by Perl\'s rules.
Use the C<SvTRUE> macro instead, which may call C<sv_true()> or may
instead use an in-line version.

	I32	sv_true(SV *const sv)','name' => 'sv_true'},'save_aptr' => {'text' => '','name' => 'save_aptr'},'hv_exists' => {'text' => 'Returns a boolean indicating whether the specified hash key exists.  The
absolute value of C<klen> is the length of the key.  If C<klen> is
negative the key is assumed to be in UTF-8-encoded Unicode.

	bool	hv_exists(HV *hv, const char *key, I32 klen)','name' => 'hv_exists'},'my_popen' => {'text' => '','name' => 'my_popen'},'mg_length' => {'text' => 'This function is deprecated.

It reports on the SV\'s length in bytes, calling length magic if available,
but does not set the UTF8 flag on the sv.  It will fall back to \'get\'
magic if there is no \'length\' magic, but with no indication as to
whether it called \'get\' magic.  It assumes the sv is a PVMG or
higher.  Use sv_len() instead.

	U32	mg_length(SV* sv)','name' => 'mg_length'},'vdeb' => {'text' => '','name' => 'vdeb'},'do_close' => {'text' => '','name' => 'do_close'},'newUNOP' => {'text' => 'Constructs, checks, and returns an op of any unary type.  I<type> is
the opcode.  I<flags> gives the eight bits of C<op_flags>, except that
C<OPf_KIDS> will be set automatically if required, and, shifted up eight
bits, the eight bits of C<op_private>, except that the bit with value 1
is automatically set.  I<first> supplies an optional op to be the direct
child of the unary op; it is consumed by this function and become part
of the constructed op tree.

	OP *	newUNOP(I32 type, I32 flags, OP *first)','name' => 'newUNOP'},'mini_mktime' => {'text' => '','name' => 'mini_mktime'},'HEf_SVKEY' => {'text' => 'This flag, used in the length slot of hash entries and magic structures,
specifies the structure contains an C<SV*> pointer where a C<char*> pointer
is to be expected. (For information only--not to be used).','name' => 'HEf_SVKEY'},'save_helem_flags' => {'text' => '','name' => 'save_helem_flags'},'newPADOP' => {'text' => 'Constructs, checks, and returns an op of any type that involves a
reference to a pad element.  I<type> is the opcode.  I<flags> gives the
eight bits of C<op_flags>.  A pad slot is automatically allocated, and
is populated with I<sv>; this function takes ownership of one reference
to it.

This function only exists if Perl has been compiled to use ithreads.

	OP *	newPADOP(I32 type, I32 flags, SV *sv)','name' => 'newPADOP'},'utf8_length' => {'text' => 'Return the length of the UTF-8 char encoded string C<s> in characters.
Stops at C<e> (inclusive).  If C<e E<lt> s> or if the scan would end
up past C<e>, croaks.

	STRLEN	utf8_length(const U8* s, const U8 *e)','name' => 'utf8_length'},'dowantarray' => {'text' => '','name' => 'dowantarray'},'my_cxt_init' => {'text' => '','name' => 'my_cxt_init'},'SvIOK_only_UV' => {'text' => 'Tells an SV that it is an unsigned integer and disables all other OK bits.

	void	SvIOK_only_UV(SV* sv)','name' => 'SvIOK_only_UV'},'clone_params_new' => {'text' => '','name' => 'clone_params_new'},'dump_fds' => {'text' => '','name' => 'dump_fds'},'sv_vcatpvfn' => {'text' => 'void	sv_vcatpvfn(SV *const sv, const char *const pat,
		            const STRLEN patlen,
		            va_list *const args,
		            SV **const svargs, const I32 svmax,
		            bool *const maybe_tainted)','name' => 'sv_vcatpvfn'},'BhkDISABLE' => {'text' => 'Temporarily disable an entry in this BHK structure, by clearing the
appropriate flag. I<which> is a preprocessor token indicating which
entry to disable.

NOTE: this function is experimental and may change or be
removed without notice.

	void	BhkDISABLE(BHK *hk, which)','name' => 'BhkDISABLE'},'croak_no_modify' => {'text' => 'Exactly equivalent to C<Perl_croak(aTHX_ "%s", PL_no_modify)>, but generates
terser object code than using C<Perl_croak>. Less code used on exception code
paths reduces CPU cache pressure.

	void	croak_no_modify()','name' => 'croak_no_modify'},'do_spawn' => {'text' => '','name' => 'do_spawn'},'share_hek' => {'text' => '','name' => 'share_hek'},'sv_pvutf8n' => {'text' => 'A private implementation of the C<SvPVutf8> macro for compilers
which can\'t cope with complex macro expressions. Always use the macro
instead.

	char*	sv_pvutf8n(SV *sv, STRLEN *lp)','name' => 'sv_pvutf8n'},'gv_fetchpv' => {'text' => '','name' => 'gv_fetchpv'},'newSV' => {'text' => 'Creates a new SV.  A non-zero C<len> parameter indicates the number of
bytes of preallocated string space the SV should have.  An extra byte for a
trailing NUL is also reserved.  (SvPOK is not set for the SV even if string
space is allocated.)  The reference count for the new SV is set to 1.

In 5.9.3, newSV() replaces the older NEWSV() API, and drops the first
parameter, I<x>, a debug aid which allowed callers to identify themselves.
This aid has been superseded by a new build option, PERL_MEM_LOG (see
L<perlhacktips/PERL_MEM_LOG>).  The older API is still there for use in XS
modules supporting older perls.

	SV*	newSV(const STRLEN len)','name' => 'newSV'},'sv_2pvutf8' => {'text' => 'Return a pointer to the UTF-8-encoded representation of the SV, and set *lp
to its length.  May cause the SV to be upgraded to UTF-8 as a side-effect.

Usually accessed via the C<SvPVutf8> macro.

	char*	sv_2pvutf8(SV *sv, STRLEN *const lp)','name' => 'sv_2pvutf8'},'dITEMS' => {'text' => 'Sets up the C<items> variable.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dITEMS;','name' => 'dITEMS'},'save_scalar' => {'text' => '','name' => 'save_scalar'},'newSUB' => {'text' => '','name' => 'newSUB'},'isGRAPH' => {'text' => 'Returns a boolean indicating whether the specified character is a
graphic character, analogous to C<m/[[:graph:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isGRAPH_A>, C<isGRAPH_L1>, C<isGRAPH_uni>, C<isGRAPH_utf8>, C<isGRAPH_LC>,
C<isGRAPH_LC_uvchr>, and C<isGRAPH_LC_utf8>.

	bool	isGRAPH(char ch)','name' => 'isGRAPH'},'pad_findmy_pv' => {'text' => 'Exactly like L</pad_findmy_pvn>, but takes a nul-terminated string
instead of a string/length pair.

	PADOFFSET pad_findmy_pv(const char *name, U32 flags)','name' => 'pad_findmy_pv'},'whichsig_sv' => {'text' => '','name' => 'whichsig_sv'},'despatch_signals' => {'text' => '','name' => 'despatch_signals'},'PUTBACK' => {'text' => 'Closing bracket for XSUB arguments.  This is usually handled by C<xsubpp>.
See C<PUSHMARK> and L<perlcall> for other uses.

		PUTBACK;','name' => 'PUTBACK'},'dAXMARK' => {'text' => 'Sets up the C<ax> variable and stack marker variable C<mark>.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dAXMARK;','name' => 'dAXMARK'},'sv_2uv_flags' => {'text' => 'Return the unsigned integer value of an SV, doing any necessary string
conversion.  If flags includes SV_GMAGIC, does an mg_get() first.
Normally used via the C<SvUV(sv)> and C<SvUVx(sv)> macros.

	UV	sv_2uv_flags(SV *const sv, const I32 flags)','name' => 'sv_2uv_flags'},'G_SCALAR' => {'text' => 'Used to indicate scalar context.  See C<GIMME_V>, C<GIMME>, and
L<perlcall>.','name' => 'G_SCALAR'},'pad_new' => {'text' => 'Create a new padlist, updating the global variables for the
currently-compiling padlist to point to the new padlist.  The following
flags can be OR\'ed together:

    padnew_CLONE	this pad is for a cloned CV
    padnew_SAVE		save old globals on the save stack
    padnew_SAVESUB	also save extra stuff for start of sub

	PADLIST * pad_new(int flags)','name' => 'pad_new'},'SvTAINTED_off' => {'text' => 'Untaints an SV.  Be I<very> careful with this routine, as it short-circuits
some of Perl\'s fundamental security features.  XS module authors should not
use this function unless they fully understand all the implications of
unconditionally untainting the value. Untainting should be done in the
standard perl fashion, via a carefully crafted regexp, rather than directly
untainting variables.

	void	SvTAINTED_off(SV* sv)','name' => 'SvTAINTED_off'},'require_pv' => {'text' => 'Tells Perl to C<require> the file named by the string argument.  It is
analogous to the Perl code C<eval "require \'$file\'">.  It\'s even
implemented that way; consider using load_module instead.

NOTE: the perl_ form of this function is deprecated.

	void	require_pv(const char* pv)','name' => 'require_pv'},'save_hdelete' => {'text' => '','name' => 'save_hdelete'},'strEQ' => {'text' => 'Test two strings to see if they are equal.  Returns true or false.

	bool	strEQ(char* s1, char* s2)','name' => 'strEQ'},'sv_upgrade' => {'text' => 'Upgrade an SV to a more complex form.  Generally adds a new body type to the
SV, then copies across as much information as possible from the old body.
It croaks if the SV is already in a more complex form than requested.  You
generally want to use the C<SvUPGRADE> macro wrapper, which checks the type
before calling C<sv_upgrade>, and hence does not croak.  See also
C<svtype>.

	void	sv_upgrade(SV *const sv, svtype new_type)','name' => 'sv_upgrade'},'safesysmalloc' => {'text' => '','name' => 'safesysmalloc'},'save_item' => {'text' => '','name' => 'save_item'},'isUPPER' => {'text' => 'Returns a boolean indicating whether the specified character is an
uppercase character, analogous to C<m/[[:upper:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isUPPER_A>, C<isUPPER_L1>, C<isUPPER_uni>, C<isUPPER_utf8>, C<isUPPER_LC>,
C<isUPPER_LC_uvchr>, and C<isUPPER_LC_utf8>.

	bool	isUPPER(char ch)','name' => 'isUPPER'},'XopENABLE' => {'text' => 'Reenable a member of the XOP which has been disabled.

	void	XopENABLE(XOP *xop, which)','name' => 'XopENABLE'},'lex_peek_unichar' => {'text' => 'Looks ahead one (Unicode) character in the text currently being lexed.
Returns the codepoint (unsigned integer value) of the next character,
or -1 if lexing has reached the end of the input text.  To consume the
peeked character, use L</lex_read_unichar>.

If the next character is in (or extends into) the next chunk of input
text, the next chunk will be read in.  Normally the current chunk will be
discarded at the same time, but if I<flags> includes C<LEX_KEEP_PREVIOUS>
then the current chunk will not be discarded.

If the input is being interpreted as UTF-8 and a UTF-8 encoding error
is encountered, an exception is generated.

NOTE: this function is experimental and may change or be
removed without notice.

	I32	lex_peek_unichar(U32 flags)','name' => 'lex_peek_unichar'},'sv_setsv_mg' => {'text' => 'Like C<sv_setsv>, but also handles \'set\' magic.

	void	sv_setsv_mg(SV *const dstr, SV *const sstr)','name' => 'sv_setsv_mg'},'call_list' => {'text' => '','name' => 'call_list'},'croak_nocontext' => {'text' => '','name' => 'croak_nocontext'},'isLOWER' => {'text' => 'Returns a boolean indicating whether the specified character is a
lowercase character, analogous to C<m/[[:lower:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isLOWER_A>, C<isLOWER_L1>, C<isLOWER_uni>, C<isLOWER_utf8>, C<isLOWER_LC>,
C<isLOWER_LC_uvchr>, and C<isLOWER_LC_utf8>.

	bool	isLOWER(char ch)','name' => 'isLOWER'},'hv_iterkey' => {'text' => 'Returns the key from the current position of the hash iterator.  See
C<hv_iterinit>.

	char*	hv_iterkey(HE* entry, I32* retlen)','name' => 'hv_iterkey'},'SvNOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a double.  Checks the
B<private> setting.  Use C<SvNOK> instead.

	U32	SvNOKp(SV* sv)','name' => 'SvNOKp'},'PadnamePV' => {'text' => 'The name stored in the pad name struct.  This returns NULL for a target or
GV slot.

NOTE: this function is experimental and may change or be
removed without notice.

	char *	PadnamePV(PADNAME pn)','name' => 'PadnamePV'},'nothreadhook' => {'text' => 'Stub that provides thread hook for perl_destruct when there are
no threads.

	int	nothreadhook()','name' => 'nothreadhook'},'utf8_to_uvchr' => {'text' => 'DEPRECATED!

Returns the native code point of the first character in the string C<s>
which is assumed to be in UTF-8 encoding; C<retlen> will be set to the
length, in bytes, of that character.

Some, but not all, UTF-8 malformations are detected, and in fact, some
malformed input could cause reading beyond the end of the input buffer, which
is why this function is deprecated.  Use L</utf8_to_uvchr_buf> instead.

If C<s> points to one of the detected malformations, and UTF8 warnings are
enabled, zero is returned and C<*retlen> is set (if C<retlen> isn\'t
NULL) to -1.  If those warnings are off, the computed value if well-defined (or
the Unicode REPLACEMENT CHARACTER, if not) is silently returned, and C<*retlen>
is set (if C<retlen> isn\'t NULL) so that (S<C<s> + C<*retlen>>) is the
next possible position in C<s> that could begin a non-malformed character.
See L</utf8n_to_uvuni> for details on when the REPLACEMENT CHARACTER is returned.

	UV	utf8_to_uvchr(const U8 *s, STRLEN *retlen)','name' => 'utf8_to_uvchr'},'bytes_to_utf8' => {'text' => 'Converts a string C<s> of length C<len> bytes from the native encoding into
UTF-8.
Returns a pointer to the newly-created string, and sets C<len> to
reflect the new length in bytes.

A NUL character will be written after the end of the string.

If you want to convert to UTF-8 from encodings other than
the native (Latin1 or EBCDIC),
see L</sv_recode_to_utf8>().

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	bytes_to_utf8(const U8 *s, STRLEN *len)','name' => 'bytes_to_utf8'},'HvENAMELEN' => {'text' => 'Returns the length of the stash\'s effective name.

	STRLEN	HvENAMELEN(HV *stash)','name' => 'HvENAMELEN'},'SvIsCOW_shared_hash' => {'text' => 'Returns a boolean indicating whether the SV is Copy-On-Write shared hash key
scalar.

	bool	SvIsCOW_shared_hash(SV* sv)','name' => 'SvIsCOW_shared_hash'},'start_subparse' => {'text' => '','name' => 'start_subparse'},'mg_size' => {'text' => '','name' => 'mg_size'},'PadnamelistMAX' => {'text' => 'The index of the last pad name.

NOTE: this function is experimental and may change or be
removed without notice.

	SSize_t	PadnamelistMAX(PADNAMELIST pnl)','name' => 'PadnamelistMAX'},'mg_free_type' => {'text' => 'Remove any magic of type I<how> from the SV I<sv>.  See L</sv_magic>.

	void	mg_free_type(SV *sv, int how)','name' => 'mg_free_type'},'sv_catsv_nomg' => {'text' => 'Like C<sv_catsv> but doesn\'t process magic.

	void	sv_catsv_nomg(SV* dsv, SV* ssv)','name' => 'sv_catsv_nomg'},'sv_setuv_mg' => {'text' => 'Like C<sv_setuv>, but also handles \'set\' magic.

	void	sv_setuv_mg(SV *const sv, const UV u)','name' => 'sv_setuv_mg'},'sys_intern_init' => {'text' => '','name' => 'sys_intern_init'},'XS_VERSION' => {'text' => 'The version identifier for an XS module.  This is usually
handled automatically by C<ExtUtils::MakeMaker>.  See C<XS_VERSION_BOOTCHECK>.','name' => 'XS_VERSION'},'find_rundefsvoffset' => {'text' => 'Find the position of the lexical C<$_> in the pad of the
currently-executing function.  Returns the offset in the current pad,
or C<NOT_IN_PAD> if there is no lexical C<$_> in scope (in which case
the global one should be used instead).
L</find_rundefsv> is likely to be more convenient.

NOTE: the perl_ form of this function is deprecated.

	PADOFFSET find_rundefsvoffset()','name' => 'find_rundefsvoffset'},'sv_setpv' => {'text' => 'Copies a string into an SV.  The string must be null-terminated.  Does not
handle \'set\' magic.  See C<sv_setpv_mg>.

	void	sv_setpv(SV *const sv, const char *const ptr)','name' => 'sv_setpv'},'hv_placeholders_set' => {'text' => '','name' => 'hv_placeholders_set'},'parse_fullstmt' => {'text' => 'Parse a single complete Perl statement.  This may be a normal imperative
statement or a declaration that has compile-time effect, and may include
optional labels.  It is up to the caller to ensure that the dynamic
parser state (L</PL_parser> et al) is correctly set to reflect the source
of the code to be parsed and the lexical context for the statement.

The op tree representing the statement is returned.  This may be a
null pointer if the statement is null, for example if it was actually
a subroutine definition (which has compile-time side effects).  If not
null, it will be the result of a L</newSTATEOP> call, normally including
a C<nextstate> or equivalent op.

If an error occurs in parsing or compilation, in most cases a valid op
tree (most likely null) is returned anyway.  The error is reflected in
the parser state, normally resulting in a single exception at the top
level of parsing which covers all the compilation errors that occurred.
Some compilation errors, however, will throw an exception immediately.

The I<flags> parameter is reserved for future use, and must always
be zero.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_fullstmt(U32 flags)','name' => 'parse_fullstmt'},'atfork_lock' => {'text' => '','name' => 'atfork_lock'},'gv_fetchmethod' => {'text' => 'See L</gv_fetchmethod_autoload>.

	GV*	gv_fetchmethod(HV* stash, const char* name)','name' => 'gv_fetchmethod'},'SvGROW' => {'text' => 'Expands the character buffer in the SV so that it has room for the
indicated number of bytes (remember to reserve space for an extra trailing
NUL character).  Calls C<sv_grow> to perform the expansion if necessary.
Returns a pointer to the character buffer. SV must be of type >= SVt_PV. One
alternative is to call C<sv_grow> if you are not sure of the type of SV.

	char *	SvGROW(SV* sv, STRLEN len)','name' => 'SvGROW'},'dMULTICALL' => {'text' => 'Declare local variables for a multicall. See L<perlcall/LIGHTWEIGHT CALLBACKS>.

		dMULTICALL;','name' => 'dMULTICALL'},'isIDFIRST' => {'text' => 'Returns a boolean indicating whether the specified character can be the first
character of an identifier.  This is very close to, but not quite the same as
the official Unicode property C<XID_Start>.  The difference is that this
returns true only if the input character also matches L</isWORDCHAR>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isIDFIRST_A>, C<isIDFIRST_L1>, C<isIDFIRST_uni>, C<isIDFIRST_utf8>,
C<isIDFIRST_LC>, C<isIDFIRST_LC_uvchr>, and C<isIDFIRST_LC_utf8>.

	bool	isIDFIRST(char ch)','name' => 'isIDFIRST'},'sv_catpv' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.
If the SV has the UTF-8 status set, then the bytes appended should be
valid UTF-8.  Handles \'get\' magic, but not \'set\' magic.  See C<sv_catpv_mg>.

	void	sv_catpv(SV *const sv, const char* ptr)','name' => 'sv_catpv'},'fprintf_nocontext' => {'text' => '','name' => 'fprintf_nocontext'},'sv_len' => {'text' => 'Returns the length of the string in the SV.  Handles magic and type
coercion and sets the UTF8 flag appropriately.  See also C<SvCUR>, which
gives raw access to the xpv_cur slot.

	STRLEN	sv_len(SV *const sv)','name' => 'sv_len'},'PerlIO_stderr' => {'text' => '','name' => 'PerlIO_stderr'},'sv_pvutf8' => {'text' => 'Use the C<SvPVutf8_nolen> macro instead

	char*	sv_pvutf8(SV *sv)','name' => 'sv_pvutf8'},'SvPVbyte_nolen' => {'text' => 'Like C<SvPV_nolen>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte_nolen(SV* sv)','name' => 'SvPVbyte_nolen'},'LEAVE' => {'text' => 'Closing bracket on a callback.  See C<ENTER> and L<perlcall>.

		LEAVE;','name' => 'LEAVE'},'mess' => {'text' => 'Take a sprintf-style format pattern and argument list.  These are used to
generate a string message.  If the message does not end with a newline,
then it will be extended with some indication of the current location
in the code, as described for L</mess_sv>.

Normally, the resulting message is returned in a new mortal SV.
During global destruction a single SV may be shared between uses of
this function.

	SV *	mess(const char *pat, ...)','name' => 'mess'},'SVt_PVAV' => {'text' => 'Type flag for arrays.  See L</svtype>.','name' => 'SVt_PVAV'},'hv_delete_ent' => {'text' => 'Deletes a key/value pair in the hash.  The value SV is removed from the hash,
made mortal, and returned to the caller.  The C<flags> value will normally be
zero; if set to G_DISCARD then NULL will be returned.  NULL will also be
returned if the key is not found.  C<hash> can be a valid precomputed hash
value, or 0 to ask for it to be computed.

	SV*	hv_delete_ent(HV *hv, SV *keysv, I32 flags,
		              U32 hash)','name' => 'hv_delete_ent'},'PL_keyword_plugin' => {'text' => 'Function pointer, pointing at a function used to handle extended keywords.
The function should be declared as

	int keyword_plugin_function(pTHX_
		char *keyword_ptr, STRLEN keyword_len,
		OP **op_ptr)

The function is called from the tokeniser, whenever a possible keyword
is seen.  C<keyword_ptr> points at the word in the parser\'s input
buffer, and C<keyword_len> gives its length; it is not null-terminated.
The function is expected to examine the word, and possibly other state
such as L<%^H|perlvar/%^H>, to decide whether it wants to handle it
as an extended keyword.  If it does not, the function should return
C<KEYWORD_PLUGIN_DECLINE>, and the normal parser process will continue.

If the function wants to handle the keyword, it first must
parse anything following the keyword that is part of the syntax
introduced by the keyword.  See L</Lexer interface> for details.

When a keyword is being handled, the plugin function must build
a tree of C<OP> structures, representing the code that was parsed.
The root of the tree must be stored in C<*op_ptr>.  The function then
returns a constant indicating the syntactic role of the construct that
it has parsed: C<KEYWORD_PLUGIN_STMT> if it is a complete statement, or
C<KEYWORD_PLUGIN_EXPR> if it is an expression.  Note that a statement
construct cannot be used inside an expression (except via C<do BLOCK>
and similar), and an expression is not a complete statement (it requires
at least a terminating semicolon).

When a keyword is handled, the plugin function may also have
(compile-time) side effects.  It may modify C<%^H>, define functions, and
so on.  Typically, if side effects are the main purpose of a handler,
it does not wish to generate any ops to be included in the normal
compilation.  In this case it is still required to supply an op tree,
but it suffices to generate a single null op.

That\'s how the C<*PL_keyword_plugin> function needs to behave overall.
Conventionally, however, one does not completely replace the existing
handler function.  Instead, take a copy of C<PL_keyword_plugin> before
assigning your own function pointer to it.  Your handler function should
look for keywords that it is interested in and handle those.  Where it
is not interested, it should call the saved plugin function, passing on
the arguments it received.  Thus C<PL_keyword_plugin> actually points
at a chain of handler functions, all of which have an opportunity to
handle keywords, and only the last function in the chain (built into
the Perl core) will normally return C<KEYWORD_PLUGIN_DECLINE>.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_keyword_plugin'},'LINKLIST' => {'text' => 'Given the root of an optree, link the tree in execution order using the
C<op_next> pointers and return the first op executed. If this has
already been done, it will not be redone, and C<< o->op_next >> will be
returned. If C<< o->op_next >> is not already set, I<o> should be at
least an C<UNOP>.

	OP*	LINKLIST(OP *o)','name' => 'LINKLIST'},'utf8_to_uvuni_buf' => {'text' => 'Returns the Unicode code point of the first character in the string C<s> which
is assumed to be in UTF-8 encoding; C<send> points to 1 beyond the end of C<s>.
C<retlen> will be set to the length, in bytes, of that character.

This function should only be used when the returned UV is considered
an index into the Unicode semantic tables (e.g. swashes).

If C<s> does not point to a well-formed UTF-8 character and UTF8 warnings are
enabled, zero is returned and C<*retlen> is set (if C<retlen> isn\'t
NULL) to -1.  If those warnings are off, the computed value if well-defined (or
the Unicode REPLACEMENT CHARACTER, if not) is silently returned, and C<*retlen>
is set (if C<retlen> isn\'t NULL) so that (S<C<s> + C<*retlen>>) is the
next possible position in C<s> that could begin a non-malformed character.
See L</utf8n_to_uvuni> for details on when the REPLACEMENT CHARACTER is returned.

	UV	utf8_to_uvuni_buf(const U8 *s, const U8 *send,
		                  STRLEN *retlen)','name' => 'utf8_to_uvuni_buf'},'cast_iv' => {'text' => '','name' => 'cast_iv'},'savesvpv' => {'text' => 'A version of C<savepv()>/C<savepvn()> which gets the string to duplicate from
the passed in SV using C<SvPV()>

	char*	savesvpv(SV* sv)','name' => 'savesvpv'},'CLASS' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the 
class name for a C++ XS constructor.  This is always a C<char*>.  See C<THIS>.

	char*	CLASS','name' => 'CLASS'},'foldEQ_latin1' => {'text' => '','name' => 'foldEQ_latin1'},'newAVREF' => {'text' => '','name' => 'newAVREF'},'HeKLEN' => {'text' => 'If this is negative, and amounts to C<HEf_SVKEY>, it indicates the entry
holds an C<SV*> key.  Otherwise, holds the actual length of the key.  Can
be assigned to. The C<HePV()> macro is usually preferable for finding key
lengths.

	STRLEN	HeKLEN(HE* he)','name' => 'HeKLEN'},'sv_pvn_force_flags' => {'text' => 'Get a sensible string out of the SV somehow.
If C<flags> has C<SV_GMAGIC> bit set, will C<mg_get> on C<sv> if
appropriate, else not.  C<sv_pvn_force> and C<sv_pvn_force_nomg> are
implemented in terms of this function.
You normally want to use the various wrapper macros instead: see
C<SvPV_force> and C<SvPV_force_nomg>

	char*	sv_pvn_force_flags(SV *const sv,
		                   STRLEN *const lp,
		                   const I32 flags)','name' => 'sv_pvn_force_flags'},'sv_setpvf_mg_nocontext' => {'text' => '','name' => 'sv_setpvf_mg_nocontext'},'parse_termexpr' => {'text' => 'Parse a Perl term expression.  This may contain operators of precedence
down to the assignment operators.  The expression must be followed (and thus
terminated) either by a comma or lower-precedence operator or by
something that would normally terminate an expression such as semicolon.
If I<flags> includes C<PARSE_OPTIONAL> then the expression is optional,
otherwise it is mandatory.  It is up to the caller to ensure that the
dynamic parser state (L</PL_parser> et al) is correctly set to reflect
the source of the code to be parsed and the lexical context for the
expression.

The op tree representing the expression is returned.  If an optional
expression is absent, a null pointer is returned, otherwise the pointer
will be non-null.

If an error occurs in parsing or compilation, in most cases a valid op
tree is returned anyway.  The error is reflected in the parser state,
normally resulting in a single exception at the top level of parsing
which covers all the compilation errors that occurred.  Some compilation
errors, however, will throw an exception immediately.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_termexpr(U32 flags)','name' => 'parse_termexpr'},'mPUSHi' => {'text' => 'Push an integer onto the stack.  The stack must have room for this element.
Does not use C<TARG>.  See also C<PUSHi>, C<mXPUSHi> and C<XPUSHi>.

	void	mPUSHi(IV iv)','name' => 'mPUSHi'},'PUSHn' => {'text' => 'Push a double onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to
return lists from XSUB\'s - see C<mPUSHn> instead.  See also C<XPUSHn> and
C<mXPUSHn>.

	void	PUSHn(NV nv)','name' => 'PUSHn'},'to_utf8_title' => {'text' => 'Convert the UTF-8 encoded character at C<p> to its titlecase version and
store that in UTF-8 in C<ustrp> and its length in bytes in C<lenp>.  Note
that the C<ustrp> needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
titlecase version may be longer than the original character.

The first character of the titlecased version is returned
(but note, as explained above, that there may be more.)

The character at C<p> is assumed by this routine to be well-formed.

	UV	to_utf8_title(const U8 *p, U8* ustrp,
		              STRLEN *lenp)','name' => 'to_utf8_title'},'PerlIO_unread' => {'text' => '','name' => 'PerlIO_unread'},'PadMAX' => {'text' => 'The index of the last pad entry.

NOTE: this function is experimental and may change or be
removed without notice.

	SSize_t	PadMAX(PAD pad)','name' => 'PadMAX'},'gv_fullname' => {'text' => '','name' => 'gv_fullname'},'PL_sv_yes' => {'text' => 'This is the C<true> SV.  See C<PL_sv_no>.  Always refer to this as
C<&PL_sv_yes>.

	SV	PL_sv_yes','name' => 'PL_sv_yes'},'pregfree' => {'text' => '','name' => 'pregfree'},'sv_nosharing' => {'text' => 'Dummy routine which "shares" an SV when there is no sharing module present.
Or "locks" it. Or "unlocks" it. In other words, ignores its single SV argument.
Exists to avoid test for a NULL function pointer and because it could
potentially warn under some level of strict-ness.

	void	sv_nosharing(SV *sv)','name' => 'sv_nosharing'},'ck_entersub_args_list' => {'text' => 'Performs the default fixup of the arguments part of an C<entersub>
op tree.  This consists of applying list context to each of the
argument ops.  This is the standard treatment used on a call marked
with C<&>, or a method call, or a call through a subroutine reference,
or any other call where the callee can\'t be identified at compile time,
or a call where the callee has no prototype.

	OP *	ck_entersub_args_list(OP *entersubop)','name' => 'ck_entersub_args_list'},'ck_warner' => {'text' => '','name' => 'ck_warner'},'is_ascii_string' => {'text' => 'Returns true if the first C<len> bytes of the string C<s> are the same whether
or not the string is encoded in UTF-8 (or UTF-EBCDIC on EBCDIC machines).  That
is, if they are invariant.  On ASCII-ish machines, only ASCII characters
fit this definition, hence the function\'s name.

If C<len> is 0, it will be calculated using C<strlen(s)>.  

See also L</is_utf8_string>(), L</is_utf8_string_loclen>(), and L</is_utf8_string_loc>().

	bool	is_ascii_string(const U8 *s, STRLEN len)','name' => 'is_ascii_string'},'SvUTF8_off' => {'text' => 'Unsets the UTF-8 status of an SV (the data is not changed, just the flag).
Do not use frivolously.

	void	SvUTF8_off(SV *sv)','name' => 'SvUTF8_off'},'sv_dec_nomg' => {'text' => 'Auto-decrement of the value in the SV, doing string to numeric conversion
if necessary.  Handles operator overloading.  Skips handling \'get\' magic.

	void	sv_dec_nomg(SV *const sv)','name' => 'sv_dec_nomg'},'looks_like_number' => {'text' => 'Test if the content of an SV looks like a number (or is a number).
C<Inf> and C<Infinity> are treated as numbers (so will not issue a
non-numeric warning), even if your atof() doesn\'t grok them.  Get-magic is
ignored.

	I32	looks_like_number(SV *const sv)','name' => 'looks_like_number'},'sv_catpv_mg' => {'text' => 'Like C<sv_catpv>, but also handles \'set\' magic.

	void	sv_catpv_mg(SV *const sv, const char *const ptr)','name' => 'sv_catpv_mg'},'save_vptr' => {'text' => '','name' => 'save_vptr'},'OP_NAME' => {'text' => 'Return the name of the provided OP. For core ops this looks up the name
from the op_type; for custom ops from the op_ppaddr.

	const char * OP_NAME(OP *o)','name' => 'OP_NAME'},'XSRETURN_EMPTY' => {'text' => 'Return an empty list from an XSUB immediately.

		XSRETURN_EMPTY;','name' => 'XSRETURN_EMPTY'},'SvREFCNT_dec_NN' => {'text' => 'Same as SvREFCNT_dec, but can only be used if you know I<sv>
is not NULL.  Since we don\'t have to check the NULLness, it\'s faster
and smaller.

	void	SvREFCNT_dec_NN(SV* sv)','name' => 'SvREFCNT_dec_NN'},'mro_get_private_data' => {'text' => '','name' => 'mro_get_private_data'},'XS_APIVERSION_BOOTCHECK' => {'text' => 'Macro to verify that the perl api version an XS module has been compiled against
matches the api version of the perl interpreter it\'s being loaded into.

		XS_APIVERSION_BOOTCHECK;','name' => 'XS_APIVERSION_BOOTCHECK'},'hv_delayfree_ent' => {'text' => '','name' => 'hv_delayfree_ent'},'sv_setpvf' => {'text' => 'Works like C<sv_catpvf> but copies the text into the SV instead of
appending it.  Does not handle \'set\' magic.  See C<sv_setpvf_mg>.

	void	sv_setpvf(SV *const sv, const char *const pat,
		          ...)','name' => 'sv_setpvf'},'custom_op_register' => {'text' => 'Register a custom op. See L<perlguts/"Custom Operators">.

NOTE: this function must be explicitly called as Perl_custom_op_register with an aTHX_ parameter.

	void	Perl_custom_op_register(pTHX_ 
		                        Perl_ppaddr_t ppaddr,
		                        const XOP *xop)','name' => 'custom_op_register'},'scan_num' => {'text' => '','name' => 'scan_num'},'save_int' => {'text' => '','name' => 'save_int'},'call_sv' => {'text' => 'Performs a callback to the Perl sub whose name is in the SV.  See
L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_sv(SV* sv, VOL I32 flags)','name' => 'call_sv'},'SVt_PV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_PV'},'strGT' => {'text' => 'Test two strings to see if the first, C<s1>, is greater than the second,
C<s2>.  Returns true or false.

	bool	strGT(char* s1, char* s2)','name' => 'strGT'},'mXPUSHs' => {'text' => 'Push an SV onto the stack, extending the stack if necessary and mortalizes
the SV.  Does not use C<TARG>.  See also C<XPUSHs> and C<mPUSHs>.

	void	mXPUSHs(SV* sv)','name' => 'mXPUSHs'},'POPl' => {'text' => 'Pops a long off the stack.

	long	POPl','name' => 'POPl'},'init_i18nl14n' => {'text' => '','name' => 'init_i18nl14n'},'scan_version' => {'text' => 'Returns a pointer to the next character after the parsed
version string, as well as upgrading the passed in SV to
an RV.

Function must be called with an already existing SV like

    sv = newSV(0);
    s = scan_version(s, SV *sv, bool qv);

Performs some preprocessing to the string to ensure that
it has the correct characteristics of a version.  Flags the
object if it contains an underscore (which denotes this
is an alpha version).  The boolean qv denotes that the version
should be interpreted as if it had multiple decimals, even if
it doesn\'t.

	const char* scan_version(const char *s, SV *rv, bool qv)','name' => 'scan_version'},'hv_common_key_len' => {'text' => '','name' => 'hv_common_key_len'},'get_cv' => {'text' => 'Uses C<strlen> to get the length of C<name>, then calls C<get_cvn_flags>.

NOTE: the perl_ form of this function is deprecated.

	CV*	get_cv(const char* name, I32 flags)','name' => 'get_cv'},'vnumify' => {'text' => 'Accepts a version object and returns the normalized floating
point representation.  Call like:

    sv = vnumify(rv);

NOTE: you can pass either the object directly or the SV
contained within the RV.

The SV returned has a refcount of 1.

	SV*	vnumify(SV *vs)','name' => 'vnumify'},'SvIOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains an integer.  Checks
the B<private> setting.  Use C<SvIOK> instead.

	U32	SvIOKp(SV* sv)','name' => 'SvIOKp'},'XST_mUNDEF' => {'text' => 'Place C<&PL_sv_undef> into the specified position C<pos> on the
stack.

	void	XST_mUNDEF(int pos)','name' => 'XST_mUNDEF'},'ptr_table_free' => {'text' => '','name' => 'ptr_table_free'},'SVt_PVIV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_PVIV'},'SvUNLOCK' => {'text' => 'Releases a mutual exclusion lock on sv if a suitable module
has been loaded.

	void	SvUNLOCK(SV* sv)','name' => 'SvUNLOCK'},'mg_set' => {'text' => 'Do magic after a value is assigned to the SV.  See C<sv_magic>.

	int	mg_set(SV* sv)','name' => 'mg_set'},'sv_mortalcopy' => {'text' => 'Creates a new SV which is a copy of the original SV (using C<sv_setsv>).
The new SV is marked as mortal.  It will be destroyed "soon", either by an
explicit call to FREETMPS, or by an implicit call at places such as
statement boundaries.  See also C<sv_newmortal> and C<sv_2mortal>.

	SV*	sv_mortalcopy(SV *const oldsv)','name' => 'sv_mortalcopy'},'cophh_fetch_sv' => {'text' => 'Like L</cophh_fetch_pvn>, but takes a Perl scalar instead of a
string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	cophh_fetch_sv(const COPHH *cophh, SV *key,
		               U32 hash, U32 flags)','name' => 'cophh_fetch_sv'},'PadARRAY' => {'text' => 'The C array of pad entries.

NOTE: this function is experimental and may change or be
removed without notice.

	SV **	PadARRAY(PAD pad)','name' => 'PadARRAY'},'sv_catpvn_nomg' => {'text' => 'Like C<sv_catpvn> but doesn\'t process magic.

	void	sv_catpvn_nomg(SV* sv, const char* ptr,
		               STRLEN len)','name' => 'sv_catpvn_nomg'},'newHVhv' => {'text' => '','name' => 'newHVhv'},'newSVpvs_flags' => {'text' => 'Like C<newSVpvn_flags>, but takes a literal string instead of a string/length
pair.

	SV*	newSVpvs_flags(const char* s, U32 flags)','name' => 'newSVpvs_flags'},'savepvn' => {'text' => 'Perl\'s version of what C<strndup()> would be if it existed. Returns a
pointer to a newly allocated string which is a duplicate of the first
C<len> bytes from C<pv>, plus a trailing NUL byte. The memory allocated for
the new string can be freed with the C<Safefree()> function.

	char*	savepvn(const char* pv, I32 len)','name' => 'savepvn'},'pad_findmy_sv' => {'text' => 'Exactly like L</pad_findmy_pvn>, but takes the name string in the form
of an SV instead of a string/length pair.

	PADOFFSET pad_findmy_sv(SV *name, U32 flags)','name' => 'pad_findmy_sv'},'cophh_delete_sv' => {'text' => 'Like L</cophh_delete_pvn>, but takes a Perl scalar instead of a
string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_delete_sv(const COPHH *cophh, SV *key,
		                U32 hash, U32 flags)','name' => 'cophh_delete_sv'},'av_exists' => {'text' => 'Returns true if the element indexed by C<key> has been initialized.

This relies on the fact that uninitialized array elements are set to
C<&PL_sv_undef>.

Perl equivalent: C<exists($myarray[$key])>.

	bool	av_exists(AV *av, I32 key)','name' => 'av_exists'},'SvCUR' => {'text' => 'Returns the length of the string which is in the SV.  See C<SvLEN>.

	STRLEN	SvCUR(SV* sv)','name' => 'SvCUR'},'sv_2nv_flags' => {'text' => 'Return the num value of an SV, doing any necessary string or integer
conversion.  If flags includes SV_GMAGIC, does an mg_get() first.
Normally used via the C<SvNV(sv)> and C<SvNVx(sv)> macros.

	NV	sv_2nv_flags(SV *const sv, const I32 flags)','name' => 'sv_2nv_flags'},'gv_init' => {'text' => 'The old form of gv_init_pvn().  It does not work with UTF8 strings, as it
has no flags parameter.  If the C<multi> parameter is set, the
GV_ADDMULTI flag will be passed to gv_init_pvn().

	void	gv_init(GV* gv, HV* stash, const char* name,
		        STRLEN len, int multi)','name' => 'gv_init'},'sv_bless' => {'text' => 'Blesses an SV into a specified package.  The SV must be an RV.  The package
must be designated by its stash (see C<gv_stashpv()>).  The reference count
of the SV is unaffected.

	SV*	sv_bless(SV *const sv, HV *const stash)','name' => 'sv_bless'},'cv_set_call_checker' => {'text' => 'Sets the function that will be used to fix up a call to I<cv>.
Specifically, the function is applied to an C<entersub> op tree for a
subroutine call, not marked with C<&>, where the callee can be identified
at compile time as I<cv>.

The C-level function pointer is supplied in I<ckfun>, and an SV argument
for it is supplied in I<ckobj>.  The function is intended to be called
in this manner:

    entersubop = ckfun(aTHX_ entersubop, namegv, ckobj);

In this call, I<entersubop> is a pointer to the C<entersub> op,
which may be replaced by the check function, and I<namegv> is a GV
supplying the name that should be used by the check function to refer
to the callee of the C<entersub> op if it needs to emit any diagnostics.
It is permitted to apply the check function in non-standard situations,
such as to a call to a different subroutine or to a method call.

The current setting for a particular CV can be retrieved by
L</cv_get_call_checker>.

	void	cv_set_call_checker(CV *cv,
		                    Perl_call_checker ckfun,
		                    SV *ckobj)','name' => 'cv_set_call_checker'},'save_ary' => {'text' => '','name' => 'save_ary'},'sv_2io' => {'text' => 'Using various gambits, try to get an IO from an SV: the IO slot if its a
GV; or the recursive result if we\'re an RV; or the IO slot of the symbol
named after the PV if we\'re a string.

\'Get\' magic is ignored on the sv passed in, but will be called on
C<SvRV(sv)> if sv is an RV.

	IO*	sv_2io(SV *const sv)','name' => 'sv_2io'},'SvMAGIC_set' => {'text' => 'Set the value of the MAGIC pointer in sv to val.  See C<SvIV_set>.

	void	SvMAGIC_set(SV* sv, MAGIC* val)','name' => 'SvMAGIC_set'},'isALPHA' => {'text' => 'Returns a boolean indicating whether the specified character is an
alphabetic character, analogous to C<m/[[:alpha:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isALPHA_A>, C<isALPHA_L1>, C<isALPHA_uni>, C<isALPHA_utf8>, C<isALPHA_LC>,
C<isALPHA_LC_uvchr>, and C<isALPHA_LC_utf8>.

	bool	isALPHA(char ch)','name' => 'isALPHA'},'newSVhek' => {'text' => 'Creates a new SV from the hash key structure.  It will generate scalars that
point to the shared string table where possible.  Returns a new (undefined)
SV if the hek is NULL.

	SV*	newSVhek(const HEK *const hek)','name' => 'newSVhek'},'taint_env' => {'text' => '','name' => 'taint_env'},'Nullhv' => {'text' => 'Null HV pointer.

(deprecated - use C<(HV *)NULL> instead)','name' => 'Nullhv'},'SvREFCNT_inc' => {'text' => 'Increments the reference count of the given SV, returning the SV.

All of the following SvREFCNT_inc* macros are optimized versions of
SvREFCNT_inc, and can be replaced with SvREFCNT_inc.

	SV*	SvREFCNT_inc(SV* sv)','name' => 'SvREFCNT_inc'},'newGVgen_flags' => {'text' => '','name' => 'newGVgen_flags'},'SvTYPE' => {'text' => 'Returns the type of the SV.  See C<svtype>.

	svtype	SvTYPE(SV* sv)','name' => 'SvTYPE'},'block_gimme' => {'text' => '','name' => 'block_gimme'},'SvROK_off' => {'text' => 'Unsets the RV status of an SV.

	void	SvROK_off(SV* sv)','name' => 'SvROK_off'},'Renew' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function.

	void	Renew(void* ptr, int nitems, type)','name' => 'Renew'},'XPUSHmortal' => {'text' => 'Push a new mortal SV onto the stack, extending the stack if necessary.
Does not use C<TARG>.  See also C<XPUSHs>, C<PUSHmortal> and C<PUSHs>.

	void	XPUSHmortal()','name' => 'XPUSHmortal'},'SvNOK_on' => {'text' => 'Tells an SV that it is a double.

	void	SvNOK_on(SV* sv)','name' => 'SvNOK_on'},'SvVOK' => {'text' => 'Returns a boolean indicating whether the SV contains a v-string.

	bool	SvVOK(SV* sv)','name' => 'SvVOK'},'whichsig_pvn' => {'text' => '','name' => 'whichsig_pvn'},'sv_setpvf_mg' => {'text' => 'Like C<sv_setpvf>, but also handles \'set\' magic.

	void	sv_setpvf_mg(SV *const sv,
		             const char *const pat, ...)','name' => 'sv_setpvf_mg'},'my_chsize' => {'text' => '','name' => 'my_chsize'},'newLISTOP' => {'text' => 'Constructs, checks, and returns an op of any list type.  I<type> is
the opcode.  I<flags> gives the eight bits of C<op_flags>, except that
C<OPf_KIDS> will be set automatically if required.  I<first> and I<last>
supply up to two ops to be direct children of the list op; they are
consumed by this function and become part of the constructed op tree.

	OP *	newLISTOP(I32 type, I32 flags, OP *first,
		          OP *last)','name' => 'newLISTOP'},'sv_setref_pv' => {'text' => 'Copies a pointer into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  If the C<pv> argument is NULL then C<PL_sv_undef> will be placed
into the SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

Do not use with other Perl types such as HV, AV, SV, CV, because those
objects will become corrupted by the pointer copy process.

Note that C<sv_setref_pvn> copies the string while this copies the pointer.

	SV*	sv_setref_pv(SV *const rv,
		             const char *const classname,
		             void *const pv)','name' => 'sv_setref_pv'},'fbm_compile' => {'text' => 'Analyses the string in order to make fast searches on it using fbm_instr()
-- the Boyer-Moore algorithm.

	void	fbm_compile(SV* sv, U32 flags)','name' => 'fbm_compile'},'SvNIOKp' => {'text' => 'Returns a U32 value indicating whether the SV contains a number, integer or
double.  Checks the B<private> setting.  Use C<SvNIOK> instead.

	U32	SvNIOKp(SV* sv)','name' => 'SvNIOKp'},'PERL_SYS_TERM' => {'text' => 'Provides system-specific clean up of the C runtime environment after
running Perl interpreters. This should be called only once, after
freeing any remaining Perl interpreters.

	void	PERL_SYS_TERM()','name' => 'PERL_SYS_TERM'},'mro_register' => {'text' => 'Registers a custom mro plugin.  See L<perlmroapi> for details.

	void	mro_register(const struct mro_alg *mro)','name' => 'mro_register'},'vnewSVpvf' => {'text' => '','name' => 'vnewSVpvf'},'rv2cv_op_cv' => {'text' => 'Examines an op, which is expected to identify a subroutine at runtime,
and attempts to determine at compile time which subroutine it identifies.
This is normally used during Perl compilation to determine whether
a prototype can be applied to a function call.  I<cvop> is the op
being considered, normally an C<rv2cv> op.  A pointer to the identified
subroutine is returned, if it could be determined statically, and a null
pointer is returned if it was not possible to determine statically.

Currently, the subroutine can be identified statically if the RV that the
C<rv2cv> is to operate on is provided by a suitable C<gv> or C<const> op.
A C<gv> op is suitable if the GV\'s CV slot is populated.  A C<const> op is
suitable if the constant value must be an RV pointing to a CV.  Details of
this process may change in future versions of Perl.  If the C<rv2cv> op
has the C<OPpENTERSUB_AMPER> flag set then no attempt is made to identify
the subroutine statically: this flag is used to suppress compile-time
magic on a subroutine call, forcing it to use default runtime behaviour.

If I<flags> has the bit C<RV2CVOPCV_MARK_EARLY> set, then the handling
of a GV reference is modified.  If a GV was examined and its CV slot was
found to be empty, then the C<gv> op has the C<OPpEARLY_CV> flag set.
If the op is not optimised away, and the CV slot is later populated with
a subroutine having a prototype, that flag eventually triggers the warning
"called too early to check prototype".

If I<flags> has the bit C<RV2CVOPCV_RETURN_NAME_GV> set, then instead
of returning a pointer to the subroutine it returns a pointer to the
GV giving the most appropriate name for the subroutine in this context.
Normally this is just the C<CvGV> of the subroutine, but for an anonymous
(C<CvANON>) subroutine that is referenced through a GV it will be the
referencing GV.  The resulting C<GV*> is cast to C<CV*> to be returned.
A null pointer is returned as usual if there is no statically-determinable
subroutine.

	CV *	rv2cv_op_cv(OP *cvop, U32 flags)','name' => 'rv2cv_op_cv'},'sv_len_utf8' => {'text' => 'Returns the number of characters in the string in an SV, counting wide
UTF-8 bytes as a single character.  Handles magic and type coercion.

	STRLEN	sv_len_utf8(SV *const sv)','name' => 'sv_len_utf8'},'PerlIO_set_cnt' => {'text' => '','name' => 'PerlIO_set_cnt'},'SvREFCNT_inc_simple_void' => {'text' => 'Same as SvREFCNT_inc_simple, but can only be used if you don\'t need the
return value.  The macro doesn\'t need to return a meaningful value.

	void	SvREFCNT_inc_simple_void(SV* sv)','name' => 'SvREFCNT_inc_simple_void'},'cx_dup' => {'text' => '','name' => 'cx_dup'},'hv_clear_placeholders' => {'text' => 'Clears any placeholders from a hash.  If a restricted hash has any of its keys
marked as readonly and the key is subsequently deleted, the key is not actually
deleted but is marked by assigning it a value of &PL_sv_placeholder.  This tags
it so it will be ignored by future operations such as iterating over the hash,
but will still allow the hash to have a value reassigned to the key at some
future point.  This function clears any such placeholder keys from the hash.
See Hash::Util::lock_keys() for an example of its use.

	void	hv_clear_placeholders(HV *hv)','name' => 'hv_clear_placeholders'},'dAX' => {'text' => 'Sets up the C<ax> variable.
This is usually handled automatically by C<xsubpp> by calling C<dXSARGS>.

		dAX;','name' => 'dAX'},'SvRV_set' => {'text' => 'Set the value of the RV pointer in sv to val.  See C<SvIV_set>.

	void	SvRV_set(SV* sv, SV* val)','name' => 'SvRV_set'},'grok_number' => {'text' => 'Recognise (or not) a number.  The type of the number is returned
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

	int	grok_number(const char *pv, STRLEN len,
		            UV *valuep)','name' => 'grok_number'},'csighandler' => {'text' => '','name' => 'csighandler'},'SvIVx' => {'text' => 'Coerces the given SV to an integer and returns it.
Guarantees to evaluate C<sv> only once.  Only use
this if C<sv> is an expression with side effects,
otherwise use the more efficient C<SvIV>.

	IV	SvIVx(SV* sv)','name' => 'SvIVx'},'grok_numeric_radix' => {'text' => 'Scan and skip for a numeric decimal separator (radix).

	bool	grok_numeric_radix(const char **sp,
		                   const char *send)','name' => 'grok_numeric_radix'},'XST_mNO' => {'text' => 'Place C<&PL_sv_no> into the specified position C<pos> on the
stack.

	void	XST_mNO(int pos)','name' => 'XST_mNO'},'gp_dup' => {'text' => '','name' => 'gp_dup'},'sv_derived_from_pv' => {'text' => 'Exactly like L</sv_derived_from_pvn>, but takes a nul-terminated string 
instead of a string/length pair.

	bool	sv_derived_from_pv(SV* sv,
		                   const char *const name,
		                   U32 flags)','name' => 'sv_derived_from_pv'},'savepvs' => {'text' => 'Like C<savepvn>, but takes a literal string instead of a string/length pair.

	char*	savepvs(const char* s)','name' => 'savepvs'},'SvSTASH_set' => {'text' => 'Set the value of the STASH pointer in sv to val.  See C<SvIV_set>.

	void	SvSTASH_set(SV* sv, HV* val)','name' => 'SvSTASH_set'},'sv_catpv_nomg' => {'text' => 'Like C<sv_catpv> but doesn\'t process magic.

	void	sv_catpv_nomg(SV* sv, const char* ptr)','name' => 'sv_catpv_nomg'},'ZeroD' => {'text' => 'Like C<Zero> but returns dest. Useful for encouraging compilers to tail-call
optimise.

	void *	ZeroD(void* dest, int nitems, type)','name' => 'ZeroD'},'sv_collxfrm' => {'text' => 'This calls C<sv_collxfrm_flags> with the SV_GMAGIC flag.  See
C<sv_collxfrm_flags>.

	char*	sv_collxfrm(SV *const sv, STRLEN *const nxp)','name' => 'sv_collxfrm'},'swash_fetch' => {'text' => '','name' => 'swash_fetch'},'SP' => {'text' => 'Stack pointer.  This is usually handled by C<xsubpp>.  See C<dSP> and
C<SPAGAIN>.','name' => 'SP'},'sv_catpvn_mg' => {'text' => 'Like C<sv_catpvn>, but also handles \'set\' magic.

	void	sv_catpvn_mg(SV *sv, const char *ptr,
		             STRLEN len)','name' => 'sv_catpvn_mg'},'op_lvalue' => {'text' => 'Propagate lvalue ("modifiable") context to an op and its children.
I<type> represents the context type, roughly based on the type of op that
would do the modifying, although C<local()> is represented by OP_NULL,
because it has no op type of its own (it is signalled by a flag on
the lvalue op).

This function detects things that can\'t be modified, such as C<$x+1>, and
generates errors for them. For example, C<$x+1 = 2> would cause it to be
called with an op of type OP_ADD and a C<type> argument of OP_SASSIGN.

It also flags things that need to behave specially in an lvalue context,
such as C<$$x = 5> which might have to vivify a reference in C<$x>.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	op_lvalue(OP *o, I32 type)','name' => 'op_lvalue'},'dirp_dup' => {'text' => '','name' => 'dirp_dup'},'gv_stashpvs' => {'text' => 'Like C<gv_stashpvn>, but takes a literal string instead of a string/length pair.

	HV*	gv_stashpvs(const char* name, I32 create)','name' => 'gv_stashpvs'},'Zero' => {'text' => 'The XSUB-writer\'s interface to the C C<memzero> function.  The C<dest> is the
destination, C<nitems> is the number of items, and C<type> is the type.

	void	Zero(void* dest, int nitems, type)','name' => 'Zero'},'vcmp' => {'text' => 'Version object aware cmp.  Both operands must already have been 
converted into version objects.

	int	vcmp(SV *lhv, SV *rhv)','name' => 'vcmp'},'SvSTASH' => {'text' => 'Returns the stash of the SV.

	HV*	SvSTASH(SV* sv)','name' => 'SvSTASH'},'XSRETURN_UNDEF' => {'text' => 'Return C<&PL_sv_undef> from an XSUB immediately.  Uses C<XST_mUNDEF>.

		XSRETURN_UNDEF;','name' => 'XSRETURN_UNDEF'},'sv_iv' => {'text' => 'A private implementation of the C<SvIVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	IV	sv_iv(SV* sv)','name' => 'sv_iv'},'PL_parser-E<gt>bufend' => {'text' => 'Direct pointer to the end of the chunk of text currently being lexed, the
end of the lexer buffer.  This is equal to C<SvPVX(PL_parser-E<gt>linestr)
+ SvCUR(PL_parser-E<gt>linestr)>.  A NUL character (zero octet) is
always located at the end of the buffer, and does not count as part of
the buffer\'s contents.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_parser-E<gt>bufend'},'PerlIO_error' => {'text' => '','name' => 'PerlIO_error'},'pv_escape' => {'text' => 'Escapes at most the first "count" chars of pv and puts the results into
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
using C<\\x01F1> style escapes, otherwise if PERL_PV_ESCAPE_NONASCII is set, only
chars above 127 will be escaped using this style; otherwise, only chars above
255 will be so escaped; other non printable chars will use octal or
common escaped patterns like C<\\n>. Otherwise, if PERL_PV_ESCAPE_NOBACKSLASH
then all chars below 255 will be treated as printable and
will be output as literals.

If PERL_PV_ESCAPE_FIRSTCHAR is set then only the first char of the
string will be escaped, regardless of max. If the output is to be in hex,
then it will be returned as a plain hex
sequence. Thus the output will either be a single char,
an octal escape sequence, a special escape like C<\\n> or a hex value.

If PERL_PV_ESCAPE_RE is set then the escape char used will be a \'%\' and
not a \'\\\\\'. This is because regexes very often contain backslashed
sequences, whereas \'%\' is not a particularly common character in patterns.

Returns a pointer to the escaped text as held by dsv.

	char*	pv_escape(SV *dsv, char const * const str,
		          const STRLEN count, const STRLEN max,
		          STRLEN * const escaped,
		          const U32 flags)','name' => 'pv_escape'},'HeSVKEY_force' => {'text' => 'Returns the key as an C<SV*>.  Will create and return a temporary mortal
C<SV*> if the hash entry contains only a C<char*> key.

	SV*	HeSVKEY_force(HE* he)','name' => 'HeSVKEY_force'},'my_exit' => {'text' => '','name' => 'my_exit'},'newRV_inc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original SV is
incremented.

	SV*	newRV_inc(SV* sv)','name' => 'newRV_inc'},'isPUNCT' => {'text' => 'Returns a boolean indicating whether the specified character is a
punctuation character, analogous to C<m/[[:punct:]]/>.
Note that the definition of what is punctuation isn\'t as
straightforward as one might desire.  See L<perlrecharclass/POSIX Character
Classes> for details.
See the L<top of this section|/Character classes> for an explanation of variants
C<isPUNCT_A>, C<isPUNCT_L1>, C<isPUNCT_uni>, C<isPUNCT_utf8>, C<isPUNCT_LC>,
C<isPUNCT_LC_uvchr>, and C<isPUNCT_LC_utf8>.

	bool	isPUNCT(char ch)','name' => 'isPUNCT'},'SVt_PVCV' => {'text' => 'Type flag for subroutines.  See L</svtype>.','name' => 'SVt_PVCV'},'ss_dup' => {'text' => '','name' => 'ss_dup'},'gv_handler' => {'text' => '','name' => 'gv_handler'},'sv_setpviv_mg' => {'text' => 'Like C<sv_setpviv>, but also handles \'set\' magic.

	void	sv_setpviv_mg(SV *const sv, const IV iv)','name' => 'sv_setpviv_mg'},'debstack' => {'text' => '','name' => 'debstack'},'sv_2bool' => {'text' => 'This macro is only used by sv_true() or its macro equivalent, and only if
the latter\'s argument is neither SvPOK, SvIOK nor SvNOK.
It calls sv_2bool_flags with the SV_GMAGIC flag.

	bool	sv_2bool(SV *const sv)','name' => 'sv_2bool'},'lex_grow_linestr' => {'text' => 'Reallocates the lexer buffer (L</PL_parser-E<gt>linestr>) to accommodate
at least I<len> octets (including terminating NUL).  Returns a
pointer to the reallocated buffer.  This is necessary before making
any direct modification of the buffer that would increase its length.
L</lex_stuff_pvn> provides a more convenient way to insert text into
the buffer.

Do not use C<SvGROW> or C<sv_grow> directly on C<PL_parser-E<gt>linestr>;
this function updates all of the lexer\'s variables that point directly
into the buffer.

NOTE: this function is experimental and may change or be
removed without notice.

	char *	lex_grow_linestr(STRLEN len)','name' => 'lex_grow_linestr'},'dORIGMARK' => {'text' => 'Saves the original stack mark for the XSUB.  See C<ORIGMARK>.

		dORIGMARK;','name' => 'dORIGMARK'},'sv_inc_nomg' => {'text' => 'Auto-increment of the value in the SV, doing string to numeric conversion
if necessary.  Handles operator overloading.  Skips handling \'get\' magic.

	void	sv_inc_nomg(SV *const sv)','name' => 'sv_inc_nomg'},'sv_newmortal' => {'text' => 'Creates a new null SV which is mortal.  The reference count of the SV is
set to 1.  It will be destroyed "soon", either by an explicit call to
FREETMPS, or by an implicit call at places such as statement boundaries.
See also C<sv_mortalcopy> and C<sv_2mortal>.

	SV*	sv_newmortal()','name' => 'sv_newmortal'},'SvOOK' => {'text' => 'Returns a U32 indicating whether the pointer to the string buffer is offset.
This hack is used internally to speed up removal of characters from the
beginning of a SvPV.  When SvOOK is true, then the start of the
allocated string buffer is actually C<SvOOK_offset()> bytes before SvPVX.
This offset used to be stored in SvIVX, but is now stored within the spare
part of the buffer.

	U32	SvOOK(SV* sv)','name' => 'SvOOK'},'SvPV_set' => {'text' => 'Set the value of the PV pointer in sv to val.  See also C<SvIV_set>.

Beware that the existing pointer may be involved in copy-on-write or other
mischief, so do C<SvOOK_off(sv)> and use C<sv_force_normal> or
C<SvPV_force> (or check the SvIsCOW flag) first to make sure this
modification is safe.

	void	SvPV_set(SV* sv, char* val)','name' => 'SvPV_set'},'mess_sv' => {'text' => 'Expands a message, intended for the user, to include an indication of
the current location in the code, if the message does not already appear
to be complete.

C<basemsg> is the initial message or object.  If it is a reference, it
will be used as-is and will be the result of this function.  Otherwise it
is used as a string, and if it already ends with a newline, it is taken
to be complete, and the result of this function will be the same string.
If the message does not end with a newline, then a segment such as C<at
foo.pl line 37> will be appended, and possibly other clauses indicating
the current state of execution.  The resulting message will end with a
dot and a newline.

Normally, the resulting message is returned in a new mortal SV.
During global destruction a single SV may be shared between uses of this
function.  If C<consume> is true, then the function is permitted (but not
required) to modify and return C<basemsg> instead of allocating a new SV.

	SV *	mess_sv(SV *basemsg, bool consume)','name' => 'mess_sv'},'hv_clear' => {'text' => 'Frees the all the elements of a hash, leaving it empty.
The XS equivalent of C<%hash = ()>.  See also L</hv_undef>.

If any destructors are triggered as a result, the hv itself may
be freed.

	void	hv_clear(HV *hv)','name' => 'hv_clear'},'get_hv' => {'text' => 'Returns the HV of the specified Perl hash.  C<flags> are passed to
C<gv_fetchpv>. If C<GV_ADD> is set and the
Perl variable does not exist then it will be created.  If C<flags> is zero
and the variable does not exist then NULL is returned.

NOTE: the perl_ form of this function is deprecated.

	HV*	get_hv(const char *name, I32 flags)','name' => 'get_hv'},'safesysrealloc' => {'text' => '','name' => 'safesysrealloc'},'XSRETURN_YES' => {'text' => 'Return C<&PL_sv_yes> from an XSUB immediately.  Uses C<XST_mYES>.

		XSRETURN_YES;','name' => 'XSRETURN_YES'},'PoisonNew' => {'text' => 'PoisonWith(0xAB) for catching access to allocated but uninitialized memory.

	void	PoisonNew(void* dest, int nitems, type)','name' => 'PoisonNew'},'op_scope' => {'text' => 'Wraps up an op tree with some additional ops so that at runtime a dynamic
scope will be created.  The original ops run in the new dynamic scope,
and then, provided that they exit normally, the scope will be unwound.
The additional ops used to create and unwind the dynamic scope will
normally be an C<enter>/C<leave> pair, but a C<scope> op may be used
instead if the ops are simple enough to not need the full dynamic scope
structure.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	op_scope(OP *o)','name' => 'op_scope'},'Renewc' => {'text' => 'The XSUB-writer\'s interface to the C C<realloc> function, with
cast.

	void	Renewc(void* ptr, int nitems, type, cast)','name' => 'Renewc'},'sv_nv' => {'text' => 'A private implementation of the C<SvNVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	NV	sv_nv(SV* sv)','name' => 'sv_nv'},'PUSHu' => {'text' => 'Push an unsigned integer onto the stack.  The stack must have room for this
element.  Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG>
should be called to declare it.  Do not call multiple C<TARG>-oriented
macros to return lists from XSUB\'s - see C<mPUSHu> instead.  See also
C<XPUSHu> and C<mXPUSHu>.

	void	PUSHu(UV uv)','name' => 'PUSHu'},'SvPOK_off' => {'text' => 'Unsets the PV status of an SV.

	void	SvPOK_off(SV* sv)','name' => 'SvPOK_off'},'newSVsv' => {'text' => 'Creates a new SV which is an exact duplicate of the original SV.
(Uses C<sv_setsv>.)

	SV*	newSVsv(SV *const old)','name' => 'newSVsv'},'hv_magic' => {'text' => 'Adds magic to a hash.  See C<sv_magic>.

	void	hv_magic(HV *hv, GV *gv, int how)','name' => 'hv_magic'},'deb_nocontext' => {'text' => '','name' => 'deb_nocontext'},'new_stackinfo' => {'text' => '','name' => 'new_stackinfo'},'save_aelem' => {'text' => '','name' => 'save_aelem'},'PerlIO_clearerr' => {'text' => '','name' => 'PerlIO_clearerr'},'cx_dump' => {'text' => '','name' => 'cx_dump'},'SVt_PVIO' => {'text' => 'Type flag for I/O objects.  See L</svtype>.','name' => 'SVt_PVIO'},'hv_placeholders_p' => {'text' => '','name' => 'hv_placeholders_p'},'XCPT_TRY_END' => {'text' => 'Ends a try block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_TRY_END'},'HeKEY' => {'text' => 'Returns the actual pointer stored in the key slot of the hash entry. The
pointer may be either C<char*> or C<SV*>, depending on the value of
C<HeKLEN()>.  Can be assigned to.  The C<HePV()> or C<HeSVKEY()> macros are
usually preferable for finding the value of a key.

	void*	HeKEY(HE* he)','name' => 'HeKEY'},'SvEND' => {'text' => 'Returns a pointer to the spot just after the last character in
the string which is in the SV, where there is usually a trailing
null (even though Perl scalars do not strictly require it).
See C<SvCUR>.  Access the character as *(SvEND(sv)).

Warning: If C<SvCUR> is equal to C<SvLEN>, then C<SvEND> points to
unallocated memory.

	char*	SvEND(SV* sv)','name' => 'SvEND'},'save_delete' => {'text' => '','name' => 'save_delete'},'GIMME_V' => {'text' => 'The XSUB-writer\'s equivalent to Perl\'s C<wantarray>.  Returns C<G_VOID>,
C<G_SCALAR> or C<G_ARRAY> for void, scalar or list context,
respectively. See L<perlcall> for a usage example.

	U32	GIMME_V','name' => 'GIMME_V'},'re_compile' => {'text' => '','name' => 're_compile'},'sv_setsv_flags' => {'text' => 'Copies the contents of the source SV C<ssv> into the destination SV
C<dsv>.  The source SV may be destroyed if it is mortal, so don\'t use this
function if the source SV needs to be reused.  Does not handle \'set\' magic.
Loosely speaking, it performs a copy-by-value, obliterating any previous
content of the destination.
If the C<flags> parameter has the C<SV_GMAGIC> bit set, will C<mg_get> on
C<ssv> if appropriate, else not.  If the C<flags>
parameter has the C<NOSTEAL> bit set then the
buffers of temps will not be stolen.  <sv_setsv>
and C<sv_setsv_nomg> are implemented in terms of this function.

You probably want to use one of the assortment of wrappers, such as
C<SvSetSV>, C<SvSetSV_nosteal>, C<SvSetMagicSV> and
C<SvSetMagicSV_nosteal>.

This is the primary function for copying scalars, and most other
copy-ish functions and macros use this underneath.

	void	sv_setsv_flags(SV *dstr, SV *sstr,
		               const I32 flags)','name' => 'sv_setsv_flags'},'gv_init_pvn' => {'text' => 'Converts a scalar into a typeglob.  This is an incoercible typeglob;
assigning a reference to it will assign to one of its slots, instead of
overwriting it as happens with typeglobs created by SvSetSV.  Converting
any scalar that is SvOK() may produce unpredictable results and is reserved
for perl\'s internal use.

C<gv> is the scalar to be converted.

C<stash> is the parent stash/package, if any.

C<name> and C<len> give the name.  The name must be unqualified;
that is, it must not include the package name.  If C<gv> is a
stash element, it is the caller\'s responsibility to ensure that the name
passed to this function matches the name of the element.  If it does not
match, perl\'s internal bookkeeping will get out of sync.

C<flags> can be set to SVf_UTF8 if C<name> is a UTF8 string, or
the return value of SvUTF8(sv).  It can also take the
GV_ADDMULTI flag, which means to pretend that the GV has been
seen before (i.e., suppress "Used once" warnings).

	void	gv_init_pvn(GV* gv, HV* stash, const char* name,
		            STRLEN len, U32 flags)','name' => 'gv_init_pvn'},'gv_fetchmeth_sv' => {'text' => 'Exactly like L</gv_fetchmeth_pvn>, but takes the name string in the form
of an SV instead of a string/length pair.

	GV*	gv_fetchmeth_sv(HV* stash, SV* namesv,
		                I32 level, U32 flags)','name' => 'gv_fetchmeth_sv'},'newATTRSUB' => {'text' => '','name' => 'newATTRSUB'},'Copy' => {'text' => 'The XSUB-writer\'s interface to the C C<memcpy> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and
C<type> is the type.  May fail on overlapping copies.  See also C<Move>.

	void	Copy(void* src, void* dest, int nitems, type)','name' => 'Copy'},'newSVpv_share' => {'text' => 'Like C<newSVpvn_share>, but takes a nul-terminated string instead of a
string/length pair.

	SV*	newSVpv_share(const char* s, U32 hash)','name' => 'newSVpv_share'},'sv_taint' => {'text' => 'Taint an SV. Use C<SvTAINTED_on> instead.

	void	sv_taint(SV* sv)','name' => 'sv_taint'},'utf16_to_utf8' => {'text' => '','name' => 'utf16_to_utf8'},'SvIOK_notUV' => {'text' => 'Returns a boolean indicating whether the SV contains a signed integer.

	bool	SvIOK_notUV(SV* sv)','name' => 'SvIOK_notUV'},'deb' => {'text' => '','name' => 'deb'},'PL_parser-E<gt>linestart' => {'text' => 'Points to the start of the current line inside the lexer buffer.
This is useful for indicating at which column an error occurred, and
not much else.  This must be updated by any lexing code that consumes
a newline; the function L</lex_read_to> handles this detail.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_parser-E<gt>linestart'},'pad_add_name_pvn' => {'text' => 'Allocates a place in the currently-compiling pad for a named lexical
variable.  Stores the name and other metadata in the name part of the
pad, and makes preparations to manage the variable\'s lexical scoping.
Returns the offset of the allocated pad slot.

I<namepv>/I<namelen> specify the variable\'s name, including leading sigil.
If I<typestash> is non-null, the name is for a typed lexical, and this
identifies the type.  If I<ourstash> is non-null, it\'s a lexical reference
to a package variable, and this identifies the package.  The following
flags can be OR\'ed together:

    padadd_OUR          redundantly specifies if it\'s a package var
    padadd_STATE        variable will retain value persistently
    padadd_NO_DUP_CHECK skip check for lexical shadowing

	PADOFFSET pad_add_name_pvn(const char *namepv,
	                           STRLEN namelen, U32 flags,
	                           HV *typestash, HV *ourstash)','name' => 'pad_add_name_pvn'},'he_dup' => {'text' => '','name' => 'he_dup'},'gv_fullname3' => {'text' => '','name' => 'gv_fullname3'},'SVt_PVNV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_PVNV'},'mPUSHu' => {'text' => 'Push an unsigned integer onto the stack.  The stack must have room for this
element.  Does not use C<TARG>.  See also C<PUSHu>, C<mXPUSHu> and C<XPUSHu>.

	void	mPUSHu(UV uv)','name' => 'mPUSHu'},'gv_fetchmeth_pvn' => {'text' => 'Returns the glob with the given C<name> and a defined subroutine or
C<NULL>.  The glob lives in the given C<stash>, or in the stashes
accessible via @ISA and UNIVERSAL::.

The argument C<level> should be either 0 or -1.  If C<level==0>, as a
side-effect creates a glob with the given C<name> in the given C<stash>
which in the case of success contains an alias for the subroutine, and sets
up caching info for this glob.

The only significant values for C<flags> are GV_SUPER and SVf_UTF8.

GV_SUPER indicates that we want to look up the method in the superclasses
of the C<stash>.

The
GV returned from C<gv_fetchmeth> may be a method cache entry, which is not
visible to Perl code.  So when calling C<call_sv>, you should not use
the GV directly; instead, you should use the method\'s CV, which can be
obtained from the GV with the C<GvCV> macro.

	GV*	gv_fetchmeth_pvn(HV* stash, const char* name,
		                 STRLEN len, I32 level,
		                 U32 flags)','name' => 'gv_fetchmeth_pvn'},'cophh_new_empty' => {'text' => 'Generate and return a fresh cop hints hash containing no entries.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_new_empty()','name' => 'cophh_new_empty'},'sv_derived_from_pvn' => {'text' => 'Returns a boolean indicating whether the SV is derived from the specified class
I<at the C level>.  To check derivation at the Perl level, call C<isa()> as a
normal Perl method.

Currently, the only significant value for C<flags> is SVf_UTF8.

	bool	sv_derived_from_pvn(SV* sv,
		                    const char *const name,
		                    const STRLEN len, U32 flags)','name' => 'sv_derived_from_pvn'},'op_append_list' => {'text' => 'Concatenate the lists of ops contained directly within two list-type ops,
returning the combined list.  I<first> and I<last> are the list-type ops
to concatenate.  I<optype> specifies the intended opcode for the list.
If either I<first> or I<last> is not already a list of the right type,
it will be upgraded into one.  If either I<first> or I<last> is null,
the other is returned unchanged.

	OP *	op_append_list(I32 optype, OP *first, OP *last)','name' => 'op_append_list'},'repeatcpy' => {'text' => '','name' => 'repeatcpy'},'do_spawn_nowait' => {'text' => '','name' => 'do_spawn_nowait'},'sv_setsv_nomg' => {'text' => 'Like C<sv_setsv> but doesn\'t process magic.

	void	sv_setsv_nomg(SV* dsv, SV* ssv)','name' => 'sv_setsv_nomg'},'load_module_nocontext' => {'text' => '','name' => 'load_module_nocontext'},'re_intuit_string' => {'text' => '','name' => 're_intuit_string'},'do_magic_dump' => {'text' => '','name' => 'do_magic_dump'},'HvNAMELEN' => {'text' => 'Returns the length of the stash\'s name.

	STRLEN	HvNAMELEN(HV *stash)','name' => 'HvNAMELEN'},'XPUSHp' => {'text' => 'Push a string onto the stack, extending the stack if necessary.  The C<len>
indicates the length of the string.  Handles \'set\' magic.  Uses C<TARG>, so
C<dTARGET> or C<dXSTARG> should be called to declare it.  Do not call
multiple C<TARG>-oriented macros to return lists from XSUB\'s - see
C<mXPUSHp> instead.  See also C<PUSHp> and C<mPUSHp>.

	void	XPUSHp(char* str, STRLEN len)','name' => 'XPUSHp'},'av_create_and_push' => {'text' => 'Push an SV onto the end of the array, creating the array if necessary.
A small internal helper function to remove a commonly duplicated idiom.

NOTE: this function is experimental and may change or be
removed without notice.

	void	av_create_and_push(AV **const avp,
		                   SV *const val)','name' => 'av_create_and_push'},'sv_utf8_encode' => {'text' => 'Converts the PV of an SV to UTF-8, but then turns the C<SvUTF8>
flag off so that it looks like octets again.

	void	sv_utf8_encode(SV *const sv)','name' => 'sv_utf8_encode'},'SvUTF8_on' => {'text' => 'Turn on the UTF-8 status of an SV (the data is not changed, just the flag).
Do not use frivolously.

	void	SvUTF8_on(SV *sv)','name' => 'SvUTF8_on'},'sv_does_pv' => {'text' => 'Like L</sv_does_sv>, but takes a nul-terminated string instead of an SV.

	bool	sv_does_pv(SV* sv, const char *const name,
		           U32 flags)','name' => 'sv_does_pv'},'sv_setpvn_mg' => {'text' => 'Like C<sv_setpvn>, but also handles \'set\' magic.

	void	sv_setpvn_mg(SV *const sv,
		             const char *const ptr,
		             const STRLEN len)','name' => 'sv_setpvn_mg'},'toLOWER' => {'text' => 'Converts the specified character to lowercase, if possible; otherwise returns
the input character itself.

	char	toLOWER(char ch)','name' => 'toLOWER'},'PadlistNAMESMAX' => {'text' => 'The index of the last pad name.

NOTE: this function is experimental and may change or be
removed without notice.

	SSize_t	PadlistNAMESMAX(PADLIST padlist)','name' => 'PadlistNAMESMAX'},'av_iter_p' => {'text' => '','name' => 'av_iter_p'},'prescan_version' => {'text' => 'Validate that a given string can be parsed as a version object, but doesn\'t
actually perform the parsing.  Can use either strict or lax validation rules.
Can optionally set a number of hint variables to save the parsing code
some time when tokenizing.

	const char* prescan_version(const char *s, bool strict,
	                            const char** errstr,
	                            bool *sqv,
	                            int *ssaw_decimal,
	                            int *swidth, bool *salpha)','name' => 'prescan_version'},'PerlIO_write' => {'text' => '','name' => 'PerlIO_write'},'hv_ksplit' => {'text' => '','name' => 'hv_ksplit'},'new_version' => {'text' => 'Returns a new version object based on the passed in SV:

    SV *sv = new_version(SV *ver);

Does not alter the passed in ver SV.  See "upg_version" if you
want to upgrade the SV.

	SV*	new_version(SV *ver)','name' => 'new_version'},'PerlIO_seek' => {'text' => '','name' => 'PerlIO_seek'},'free_tmps' => {'text' => '','name' => 'free_tmps'},'parse_arithexpr' => {'text' => 'Parse a Perl arithmetic expression.  This may contain operators of precedence
down to the bit shift operators.  The expression must be followed (and thus
terminated) either by a comparison or lower-precedence operator or by
something that would normally terminate an expression such as semicolon.
If I<flags> includes C<PARSE_OPTIONAL> then the expression is optional,
otherwise it is mandatory.  It is up to the caller to ensure that the
dynamic parser state (L</PL_parser> et al) is correctly set to reflect
the source of the code to be parsed and the lexical context for the
expression.

The op tree representing the expression is returned.  If an optional
expression is absent, a null pointer is returned, otherwise the pointer
will be non-null.

If an error occurs in parsing or compilation, in most cases a valid op
tree is returned anyway.  The error is reflected in the parser state,
normally resulting in a single exception at the top level of parsing
which covers all the compilation errors that occurred.  Some compilation
errors, however, will throw an exception immediately.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_arithexpr(U32 flags)','name' => 'parse_arithexpr'},'Nullav' => {'text' => 'Null AV pointer.

(deprecated - use C<(AV *)NULL> instead)','name' => 'Nullav'},'sv_pvbyten' => {'text' => 'A private implementation of the C<SvPVbyte> macro for compilers
which can\'t cope with complex macro expressions. Always use the macro
instead.

	char*	sv_pvbyten(SV *sv, STRLEN *lp)','name' => 'sv_pvbyten'},'isOCTAL' => {'text' => 'Returns a boolean indicating whether the specified character is an
octal digit, [0-7].
The only two variants are C<isOCTAL_A> and C<isOCTAL_L1>; each is identical to
C<isOCTAL>.

	bool	isOCTAL(char ch)','name' => 'isOCTAL'},'rsignal' => {'text' => '','name' => 'rsignal'},'sv_pv' => {'text' => 'Use the C<SvPV_nolen> macro instead

	char*	sv_pv(SV *sv)','name' => 'sv_pv'},'perl_alloc_using' => {'text' => '','name' => 'perl_alloc_using'},'pv_pretty' => {'text' => 'Converts a string into something presentable, handling escaping via
pv_escape() and supporting quoting and ellipses.

If the PERL_PV_PRETTY_QUOTE flag is set then the result will be 
double quoted with any double quotes in the string escaped. Otherwise
if the PERL_PV_PRETTY_LTGT flag is set then the result be wrapped in
angle brackets. 

If the PERL_PV_PRETTY_ELLIPSES flag is set and not all characters in
string were output then an ellipsis C<...> will be appended to the
string. Note that this happens AFTER it has been quoted.

If start_color is non-null then it will be inserted after the opening
quote (if there is one) but before the escaped text. If end_color
is non-null then it will be inserted after the escaped text but before
any quotes or ellipses.

Returns a pointer to the prettified text as held by dsv.

	char*	pv_pretty(SV *dsv, char const * const str,
		          const STRLEN count, const STRLEN max,
		          char const * const start_color,
		          char const * const end_color,
		          const U32 flags)','name' => 'pv_pretty'},'sv_setnv_mg' => {'text' => 'Like C<sv_setnv>, but also handles \'set\' magic.

	void	sv_setnv_mg(SV *const sv, const NV num)','name' => 'sv_setnv_mg'},'utf8_to_bytes' => {'text' => 'Converts a string C<s> of length C<len> from UTF-8 into native byte encoding.
Unlike L</bytes_to_utf8>, this over-writes the original string, and
updates C<len> to contain the new length.
Returns zero on failure, setting C<len> to -1.

If you need a copy of the string, see L</bytes_from_utf8>.

NOTE: this function is experimental and may change or be
removed without notice.

	U8*	utf8_to_bytes(U8 *s, STRLEN *len)','name' => 'utf8_to_bytes'},'sv_setref_pvs' => {'text' => 'Like C<sv_setref_pvn>, but takes a literal string instead of a
string/length pair.

	SV *	sv_setref_pvs(const char* s)','name' => 'sv_setref_pvs'},'re_dup_guts' => {'text' => '','name' => 're_dup_guts'},'si_dup' => {'text' => '','name' => 'si_dup'},'uvuni_to_utf8_flags' => {'text' => 'Adds the UTF-8 representation of the Unicode code point C<uv> to the end
of the string C<d>; C<d> should have at least C<UTF8_MAXBYTES+1> free
bytes available. The return value is the pointer to the byte after the
end of the new character. In other words,

    d = uvuni_to_utf8_flags(d, uv, flags);

or, in most cases,

    d = uvuni_to_utf8(d, uv);

(which is equivalent to)

    d = uvuni_to_utf8_flags(d, uv, 0);

This is the recommended Unicode-aware way of saying

    *(d++) = uv;

where uv is a code point expressed in Latin-1 or above, not the platform\'s
native character set.  B<Almost all code should instead use L</uvchr_to_utf8>
or L</uvchr_to_utf8_flags>>.

This function will convert to UTF-8 (and not warn) even code points that aren\'t
legal Unicode or are problematic, unless C<flags> contains one or more of the
following flags:

If C<uv> is a Unicode surrogate code point and UNICODE_WARN_SURROGATE is set,
the function will raise a warning, provided UTF8 warnings are enabled.  If instead
UNICODE_DISALLOW_SURROGATE is set, the function will fail and return NULL.
If both flags are set, the function will both warn and return NULL.

The UNICODE_WARN_NONCHAR and UNICODE_DISALLOW_NONCHAR flags correspondingly
affect how the function handles a Unicode non-character.  And likewise, the
UNICODE_WARN_SUPER and UNICODE_DISALLOW_SUPER flags, affect the handling of
code points that are
above the Unicode maximum of 0x10FFFF.  Code points above 0x7FFF_FFFF (which are
even less portable) can be warned and/or disallowed even if other above-Unicode
code points are accepted by the UNICODE_WARN_FE_FF and UNICODE_DISALLOW_FE_FF
flags.

And finally, the flag UNICODE_WARN_ILLEGAL_INTERCHANGE selects all four of the
above WARN flags; and UNICODE_DISALLOW_ILLEGAL_INTERCHANGE selects all four
DISALLOW flags.


	U8*	uvuni_to_utf8_flags(U8 *d, UV uv, UV flags)','name' => 'uvuni_to_utf8_flags'},'PL_rpeepp' => {'text' => 'Pointer to the recursive peephole optimiser.  This is a function
that gets called at the end of compilation of a Perl subroutine (or
equivalently independent piece of Perl code) to perform fixups of some
ops and to perform small-scale optimisations.  The function is called
once for each chain of ops linked through their C<op_next> fields;
it is recursively called to handle each side chain.  It is passed, as
sole parameter, a pointer to the op that is at the head of the chain.
It modifies the op tree in place.

The peephole optimiser should never be completely replaced.  Rather,
add code to it by wrapping the existing optimiser.  The basic way to do
this can be seen in L<perlguts/Compile pass 3: peephole optimization>.
If the new code wishes to operate only on ops at a subroutine\'s top level,
rather than throughout the structure, it is likely to be more convenient
to wrap the L</PL_peepp> hook.

	peep_t	PL_rpeepp','name' => 'PL_rpeepp'},'G_DISCARD' => {'text' => 'Indicates that arguments returned from a callback should be discarded.  See
L<perlcall>.','name' => 'G_DISCARD'},'newGVREF' => {'text' => '','name' => 'newGVREF'},'XST_mNV' => {'text' => 'Place a double into the specified position C<pos> on the stack.  The value
is stored in a new mortal SV.

	void	XST_mNV(int pos, NV nv)','name' => 'XST_mNV'},'UNDERBAR' => {'text' => 'The SV* corresponding to the $_ variable. Works even if there
is a lexical $_ in scope.','name' => 'UNDERBAR'},'newSVOP' => {'text' => 'Constructs, checks, and returns an op of any type that involves an
embedded SV.  I<type> is the opcode.  I<flags> gives the eight bits
of C<op_flags>.  I<sv> gives the SV to embed in the op; this function
takes ownership of one reference to it.

	OP *	newSVOP(I32 type, I32 flags, SV *sv)','name' => 'newSVOP'},'cophh_fetch_pvn' => {'text' => 'Look up the entry in the cop hints hash I<cophh> with the key specified by
I<keypv> and I<keylen>.  If I<flags> has the C<COPHH_KEY_UTF8> bit set,
the key octets are interpreted as UTF-8, otherwise they are interpreted
as Latin-1.  I<hash> is a precomputed hash of the key string, or zero if
it has not been precomputed.  Returns a mortal scalar copy of the value
associated with the key, or C<&PL_sv_placeholder> if there is no value
associated with the key.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	cophh_fetch_pvn(const COPHH *cophh,
		                const char *keypv,
		                STRLEN keylen, U32 hash,
		                U32 flags)','name' => 'cophh_fetch_pvn'},'pad_sv' => {'text' => 'Get the value at offset I<po> in the current (compiling or executing) pad.
Use macro PAD_SV instead of calling this function directly.

	SV *	pad_sv(PADOFFSET po)','name' => 'pad_sv'},'amagic_call' => {'text' => '','name' => 'amagic_call'},'op_free' => {'text' => '','name' => 'op_free'},'PadnameLEN' => {'text' => 'The length of the name.

NOTE: this function is experimental and may change or be
removed without notice.

	STRLEN	PadnameLEN(PADNAME pn)','name' => 'PadnameLEN'},'SvPVutf8_force' => {'text' => 'Like C<SvPV_force>, but converts sv to utf8 first if necessary.

	char*	SvPVutf8_force(SV* sv, STRLEN len)','name' => 'SvPVutf8_force'},'gv_AVadd' => {'text' => '','name' => 'gv_AVadd'},'pop_scope' => {'text' => '','name' => 'pop_scope'},'SVt_NV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_NV'},'my_popen_list' => {'text' => '','name' => 'my_popen_list'},'sv_2uv' => {'text' => '','name' => 'sv_2uv'},'PUSHMARK' => {'text' => 'Opening bracket for arguments on a callback.  See C<PUTBACK> and
L<perlcall>.

	void	PUSHMARK(SP)','name' => 'PUSHMARK'},'taint_proper' => {'text' => '','name' => 'taint_proper'},'save_generic_pvref' => {'text' => '','name' => 'save_generic_pvref'},'ST' => {'text' => 'Used to access elements on the XSUB\'s stack.

	SV*	ST(int ix)','name' => 'ST'},'call_pv' => {'text' => 'Performs a callback to the specified Perl sub.  See L<perlcall>.

NOTE: the perl_ form of this function is deprecated.

	I32	call_pv(const char* sub_name, I32 flags)','name' => 'call_pv'},'gv_fetchmeth_autoload' => {'text' => 'This is the old form of L</gv_fetchmeth_pvn_autoload>, which has no flags
parameter.

	GV*	gv_fetchmeth_autoload(HV* stash,
		                      const char* name,
		                      STRLEN len, I32 level)','name' => 'gv_fetchmeth_autoload'},'save_mortalizesv' => {'text' => '','name' => 'save_mortalizesv'},'sv_pos_b2u' => {'text' => 'Converts the value pointed to by offsetp from a count of bytes from the
start of the string, to a count of the equivalent number of UTF-8 chars.
Handles magic and type coercion.

	void	sv_pos_b2u(SV *const sv, I32 *const offsetp)','name' => 'sv_pos_b2u'},'sv_utf8_upgrade_flags_grow' => {'text' => '','name' => 'sv_utf8_upgrade_flags_grow'},'SVt_IV' => {'text' => 'Type flag for scalars.  See L</svtype>.','name' => 'SVt_IV'},'SvIsCOW' => {'text' => 'Returns a boolean indicating whether the SV is Copy-On-Write (either shared
hash key scalars, or full Copy On Write scalars if 5.9.0 is configured for
COW).

	bool	SvIsCOW(SV* sv)','name' => 'SvIsCOW'},'reentrant_size' => {'text' => '','name' => 'reentrant_size'},'printf_nocontext' => {'text' => '','name' => 'printf_nocontext'},'save_freesv' => {'text' => '','name' => 'save_freesv'},'sv_catsv' => {'text' => 'Concatenates the string from SV C<ssv> onto the end of the string in SV
C<dsv>.  If C<ssv> is null, does nothing; otherwise modifies only C<dsv>.
Handles \'get\' magic on both SVs, but no \'set\' magic.  See C<sv_catsv_mg> and
C<sv_catsv_nomg>.

	void	sv_catsv(SV *dstr, SV *sstr)','name' => 'sv_catsv'},'SvPOK_on' => {'text' => 'Tells an SV that it is a string.

	void	SvPOK_on(SV* sv)','name' => 'SvPOK_on'},'ax' => {'text' => 'Variable which is setup by C<xsubpp> to indicate the stack base offset,
used by the C<ST>, C<XSprePUSH> and C<XSRETURN> macros.  The C<dMARK> macro
must be called prior to setup the C<MARK> variable.

	I32	ax','name' => 'ax'},'regexec_flags' => {'text' => '','name' => 'regexec_flags'},'pad_add_name_sv' => {'text' => 'Exactly like L</pad_add_name_pvn>, but takes the name string in the form
of an SV instead of a string/length pair.

	PADOFFSET pad_add_name_sv(SV *name, U32 flags,
	                          HV *typestash, HV *ourstash)','name' => 'pad_add_name_sv'},'to_utf8_upper' => {'text' => 'Convert the UTF-8 encoded character at C<p> to its uppercase version and
store that in UTF-8 in C<ustrp> and its length in bytes in C<lenp>.  Note
that the ustrp needs to be at least UTF8_MAXBYTES_CASE+1 bytes since
the uppercase version may be longer than the original character.

The first character of the uppercased version is returned
(but note, as explained above, that there may be more.)

The character at C<p> is assumed by this routine to be well-formed.

	UV	to_utf8_upper(const U8 *p, U8* ustrp,
		              STRLEN *lenp)','name' => 'to_utf8_upper'},'newSVpadname' => {'text' => 'Creates a new SV containing the pad name.  This is currently identical
to C<newSVsv>, but pad names may cease being SVs at some point, so
C<newSVpadname> is preferable.

NOTE: this function is experimental and may change or be
removed without notice.

	SV*	newSVpadname(PADNAME *pn)','name' => 'newSVpadname'},'SvPVutf8x_force' => {'text' => 'Like C<SvPV_force>, but converts sv to utf8 first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVutf8_force>
otherwise.

	char*	SvPVutf8x_force(SV* sv, STRLEN len)','name' => 'SvPVutf8x_force'},'warner_nocontext' => {'text' => '','name' => 'warner_nocontext'},'sv_eq_flags' => {'text' => 'Returns a boolean indicating whether the strings in the two SVs are
identical.  Is UTF-8 and \'use bytes\' aware and coerces its args to strings
if necessary.  If the flags include SV_GMAGIC, it handles get-magic, too.

	I32	sv_eq_flags(SV* sv1, SV* sv2, const U32 flags)','name' => 'sv_eq_flags'},'my_htonl' => {'text' => '','name' => 'my_htonl'},'PUSHi' => {'text' => 'Push an integer onto the stack.  The stack must have room for this element.
Handles \'set\' magic.  Uses C<TARG>, so C<dTARGET> or C<dXSTARG> should be
called to declare it.  Do not call multiple C<TARG>-oriented macros to 
return lists from XSUB\'s - see C<mPUSHi> instead.  See also C<XPUSHi> and
C<mXPUSHi>.

	void	PUSHi(IV iv)','name' => 'PUSHi'},'SvLEN_set' => {'text' => 'Set the actual length of the string which is in the SV.  See C<SvIV_set>.

	void	SvLEN_set(SV* sv, STRLEN len)','name' => 'SvLEN_set'},'new_numeric' => {'text' => '','name' => 'new_numeric'},'to_utf8_lower' => {'text' => 'Convert the UTF-8 encoded character at C<p> to its lowercase version and
store that in UTF-8 in ustrp and its length in bytes in C<lenp>.  Note
that the C<ustrp> needs to be at least UTF8_MAXBYTES_CASE+1 bytes since the
lowercase version may be longer than the original character.

The first character of the lowercased version is returned
(but note, as explained above, that there may be more.)

The character at C<p> is assumed by this routine to be well-formed.

	UV	to_utf8_lower(const U8 *p, U8* ustrp,
		              STRLEN *lenp)','name' => 'to_utf8_lower'},'gv_init_pv' => {'text' => 'Same as gv_init_pvn(), but takes a nul-terminated string for the name
instead of separate char * and length parameters.

	void	gv_init_pv(GV* gv, HV* stash, const char* name,
		           U32 flags)','name' => 'gv_init_pv'},'newSVpvf' => {'text' => 'Creates a new SV and initializes it with the string formatted like
C<sprintf>.

	SV*	newSVpvf(const char *const pat, ...)','name' => 'newSVpvf'},'doing_taint' => {'text' => '','name' => 'doing_taint'},'save_I8' => {'text' => '','name' => 'save_I8'},'Newxc' => {'text' => 'The XSUB-writer\'s interface to the C C<malloc> function, with
cast.  See also C<Newx>.

	void	Newxc(void* ptr, int nitems, type, cast)','name' => 'Newxc'},'lex_stuff_pvs' => {'text' => 'Like L</lex_stuff_pvn>, but takes a literal string instead of a
string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_stuff_pvs(const char *pv, U32 flags)','name' => 'lex_stuff_pvs'},'perl_destruct' => {'text' => 'Shuts down a Perl interpreter.  See L<perlembed>.

	int	perl_destruct(PerlInterpreter *my_perl)','name' => 'perl_destruct'},'SvIVX' => {'text' => 'Returns the raw value in the SV\'s IV slot, without checks or conversions.
Only use when you are sure SvIOK is true.  See also C<SvIV()>.

	IV	SvIVX(SV* sv)','name' => 'SvIVX'},'custom_op_name' => {'text' => 'Return the name for a given custom op. This was once used by the OP_NAME
macro, but is no longer: it has only been kept for compatibility, and
should not be used.

	const char * custom_op_name(const OP *o)','name' => 'custom_op_name'},'sv_vsetpvf' => {'text' => 'Works like C<sv_vcatpvf> but copies the text into the SV instead of
appending it.  Does not handle \'set\' magic.  See C<sv_vsetpvf_mg>.

Usually used via its frontend C<sv_setpvf>.

	void	sv_vsetpvf(SV *const sv, const char *const pat,
		           va_list *const args)','name' => 'sv_vsetpvf'},'any_dup' => {'text' => '','name' => 'any_dup'},'XCPT_CATCH' => {'text' => 'Introduces a catch block.  See L<perlguts/"Exception Handling">.','name' => 'XCPT_CATCH'},'regclass_swash' => {'text' => '','name' => 'regclass_swash'},'my_dirfd' => {'text' => '','name' => 'my_dirfd'},'XST_mYES' => {'text' => 'Place C<&PL_sv_yes> into the specified position C<pos> on the
stack.

	void	XST_mYES(int pos)','name' => 'XST_mYES'},'SvIOK_off' => {'text' => 'Unsets the IV status of an SV.

	void	SvIOK_off(SV* sv)','name' => 'SvIOK_off'},'sv_setsv' => {'text' => 'Copies the contents of the source SV C<ssv> into the destination SV
C<dsv>.  The source SV may be destroyed if it is mortal, so don\'t use this
function if the source SV needs to be reused.  Does not handle \'set\' magic.
Loosely speaking, it performs a copy-by-value, obliterating any previous
content of the destination.

You probably want to use one of the assortment of wrappers, such as
C<SvSetSV>, C<SvSetSV_nosteal>, C<SvSetMagicSV> and
C<SvSetMagicSV_nosteal>.

	void	sv_setsv(SV *dstr, SV *sstr)','name' => 'sv_setsv'},'PerlIO_stdin' => {'text' => '','name' => 'PerlIO_stdin'},'READ_XDIGIT' => {'text' => 'Returns the value of an ASCII-range hex digit and advances the string pointer.
Behaviour is only well defined when isXDIGIT(*str) is true.

	U8	READ_XDIGIT(char str*)','name' => 'READ_XDIGIT'},'ix' => {'text' => 'Variable which is setup by C<xsubpp> to indicate which of an 
XSUB\'s aliases was used to invoke it.  See L<perlxs/"The ALIAS: Keyword">.

	I32	ix','name' => 'ix'},'XSRETURN_UV' => {'text' => 'Return an integer from an XSUB immediately.  Uses C<XST_mUV>.

	void	XSRETURN_UV(IV uv)','name' => 'XSRETURN_UV'},'SvREFCNT_inc_simple' => {'text' => 'Same as SvREFCNT_inc, but can only be used with expressions without side
effects.  Since we don\'t have to store a temporary value, it\'s faster.

	SV*	SvREFCNT_inc_simple(SV* sv)','name' => 'SvREFCNT_inc_simple'},'my_lstat' => {'text' => '','name' => 'my_lstat'},'my_atof' => {'text' => '','name' => 'my_atof'},'savestack_grow_cnt' => {'text' => '','name' => 'savestack_grow_cnt'},'PL_comppad_name' => {'text' => 'During compilation, this points to the array containing the names part
of the pad for the currently-compiling code.

NOTE: this function is experimental and may change or be
removed without notice.','name' => 'PL_comppad_name'},'SvTRUE_nomg' => {'text' => 'Returns a boolean indicating whether Perl would evaluate the SV as true or
false.  See SvOK() for a defined/undefined test.  Does not handle \'get\' magic.

	bool	SvTRUE_nomg(SV* sv)','name' => 'SvTRUE_nomg'},'vverify' => {'text' => 'Validates that the SV contains valid internal structure for a version object.
It may be passed either the version object (RV) or the hash itself (HV).  If
the structure is valid, it returns the HV.  If the structure is invalid,
it returns NULL.

    SV *hv = vverify(sv);

Note that it only confirms the bare minimum structure (so as not to get
confused by derived classes which may contain additional hash entries):

	SV*	vverify(SV *vs)','name' => 'vverify'},'dXSI32' => {'text' => 'Sets up the C<ix> variable for an XSUB which has aliases.  This is usually
handled automatically by C<xsubpp>.

		dXSI32;','name' => 'dXSI32'},'dXCPT' => {'text' => 'Set up necessary local variables for exception handling.
See L<perlguts/"Exception Handling">.

		dXCPT;','name' => 'dXCPT'},'sv_tainted' => {'text' => 'Test an SV for taintedness.  Use C<SvTAINTED> instead.

	bool	sv_tainted(SV *const sv)','name' => 'sv_tainted'},'mro_set_private_data' => {'text' => '','name' => 'mro_set_private_data'},'do_gv_dump' => {'text' => '','name' => 'do_gv_dump'},'reg_named_buff_nextkey' => {'text' => '','name' => 'reg_named_buff_nextkey'},'hv_fill' => {'text' => 'Returns the number of hash buckets that happen to be in use. This function is
wrapped by the macro C<HvFILL>.

Previously this value was stored in the HV structure, rather than being
calculated on demand.

	STRLEN	hv_fill(HV const *const hv)','name' => 'hv_fill'},'cv_const_sv' => {'text' => 'If C<cv> is a constant sub eligible for inlining. returns the constant
value returned by the sub.  Otherwise, returns NULL.

Constant subs can be created with C<newCONSTSUB> or as described in
L<perlsub/"Constant Functions">.

	SV*	cv_const_sv(const CV *const cv)','name' => 'cv_const_sv'},'pad_add_name_pvs' => {'text' => 'Exactly like L</pad_add_name_pvn>, but takes a literal string instead
of a string/length pair.

	PADOFFSET pad_add_name_pvs(const char *name, U32 flags,
	                           HV *typestash, HV *ourstash)','name' => 'pad_add_name_pvs'},'newSVnv' => {'text' => 'Creates a new SV and copies a floating point value into it.
The reference count for the SV is set to 1.

	SV*	newSVnv(const NV n)','name' => 'newSVnv'},'HeVAL' => {'text' => 'Returns the value slot (type C<SV*>) stored in the hash entry. Can be assigned
to.

  SV *foo= HeVAL(hv);
  HeVAL(hv)= sv;


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

	char*	HePV(HE* he, STRLEN len)','name' => 'HePV'},'hv_free_ent' => {'text' => '','name' => 'hv_free_ent'},'isIDCONT' => {'text' => 'Returns a boolean indicating whether the specified character can be the
second or succeeding character of an identifier.  This is very close to, but
not quite the same as the official Unicode property C<XID_Continue>.  The
difference is that this returns true only if the input character also matches
L</isWORDCHAR>.  See the L<top of this section|/Character classes> for an
explanation of variants C<isIDCONT_A>, C<isIDCONT_L1>, C<isIDCONT_uni>,
C<isIDCONT_utf8>, C<isIDCONT_LC>, C<isIDCONT_LC_uvchr>, and
C<isIDCONT_LC_utf8>.

	bool	isIDCONT(char ch)','name' => 'isIDCONT'},'SvGETMAGIC' => {'text' => 'Invokes C<mg_get> on an SV if it has \'get\' magic.  For example, this
will call C<FETCH> on a tied variable.  This macro evaluates its
argument more than once.

	void	SvGETMAGIC(SV* sv)','name' => 'SvGETMAGIC'},'PL_parser' => {'text' => 'Pointer to a structure encapsulating the state of the parsing operation
currently in progress.  The pointer can be locally changed to perform
a nested parse without interfering with the state of an outer parse.
Individual members of C<PL_parser> have their own documentation.','name' => 'PL_parser'},'pv_uni_display' => {'text' => 'Build to the scalar C<dsv> a displayable version of the string C<spv>,
length C<len>, the displayable version being at most C<pvlim> bytes long
(if longer, the rest is truncated and "..." will be appended).

The C<flags> argument can have UNI_DISPLAY_ISPRINT set to display
isPRINT()able characters as themselves, UNI_DISPLAY_BACKSLASH
to display the \\\\[nrfta\\\\] as the backslashed versions (like \'\\n\')
(UNI_DISPLAY_BACKSLASH is preferred over UNI_DISPLAY_ISPRINT for \\\\).
UNI_DISPLAY_QQ (and its alias UNI_DISPLAY_REGEX) have both
UNI_DISPLAY_BACKSLASH and UNI_DISPLAY_ISPRINT turned on.

The pointer to the PV of the C<dsv> is returned.

	char*	pv_uni_display(SV *dsv, const U8 *spv,
		               STRLEN len, STRLEN pvlim,
		               UV flags)','name' => 'pv_uni_display'},'init_stacks' => {'text' => '','name' => 'init_stacks'},'sv_inc' => {'text' => 'Auto-increment of the value in the SV, doing string to numeric conversion
if necessary.  Handles \'get\' magic and operator overloading.

	void	sv_inc(SV *const sv)','name' => 'sv_inc'},'SvPVbytex_force' => {'text' => 'Like C<SvPV_force>, but converts sv to byte representation first if necessary.
Guarantees to evaluate sv only once; use the more efficient C<SvPVbyte_force>
otherwise.

	char*	SvPVbytex_force(SV* sv, STRLEN len)','name' => 'SvPVbytex_force'},'op_prepend_elem' => {'text' => 'Prepend an item to the list of ops contained directly within a list-type
op, returning the lengthened list.  I<first> is the op to prepend to the
list, and I<last> is the list-type op.  I<optype> specifies the intended
opcode for the list.  If I<last> is not already a list of the right type,
it will be upgraded into one.  If either I<first> or I<last> is null,
the other is returned unchanged.

	OP *	op_prepend_elem(I32 optype, OP *first, OP *last)','name' => 'op_prepend_elem'},'hv_delete' => {'text' => 'Deletes a key/value pair in the hash.  The value\'s SV is removed from
the hash, made mortal, and returned to the caller.  The absolute
value of C<klen> is the length of the key.  If C<klen> is negative the
key is assumed to be in UTF-8-encoded Unicode.  The C<flags> value
will normally be zero; if set to G_DISCARD then NULL will be returned.
NULL will also be returned if the key is not found.

	SV*	hv_delete(HV *hv, const char *key, I32 klen,
		          I32 flags)','name' => 'hv_delete'},'pad_add_name_pv' => {'text' => 'Exactly like L</pad_add_name_pvn>, but takes a nul-terminated string
instead of a string/length pair.

	PADOFFSET pad_add_name_pv(const char *name, U32 flags,
	                          HV *typestash, HV *ourstash)','name' => 'pad_add_name_pv'},'POP_MULTICALL' => {'text' => 'Closing bracket for a lightweight callback.
See L<perlcall/LIGHTWEIGHT CALLBACKS>.

		POP_MULTICALL;','name' => 'POP_MULTICALL'},'sv_cat_decode' => {'text' => 'The encoding is assumed to be an Encode object, the PV of the ssv is
assumed to be octets in that encoding and decoding the input starts
from the position which (PV + *offset) pointed to.  The dsv will be
concatenated the decoded UTF-8 string from ssv.  Decoding will terminate
when the string tstr appears in decoding output or the input ends on
the PV of the ssv.  The value which the offset points will be modified
to the last input position on the ssv.

Returns TRUE if the terminator was found, else returns FALSE.

	bool	sv_cat_decode(SV* dsv, SV *encoding, SV *ssv,
		              int *offset, char* tstr, int tlen)','name' => 'sv_cat_decode'},'SvIV_set' => {'text' => 'Set the value of the IV pointer in sv to val.  It is possible to perform
the same function of this macro with an lvalue assignment to C<SvIVX>.
With future Perls, however, it will be more efficient to use 
C<SvIV_set> instead of the lvalue assignment to C<SvIVX>.

	void	SvIV_set(SV* sv, IV val)','name' => 'SvIV_set'},'sv_setiv' => {'text' => 'Copies an integer into the given SV, upgrading first if necessary.
Does not handle \'set\' magic.  See also C<sv_setiv_mg>.

	void	sv_setiv(SV *const sv, const IV num)','name' => 'sv_setiv'},'gv_efullname' => {'text' => '','name' => 'gv_efullname'},'sv_report_used' => {'text' => 'Dump the contents of all SVs not yet freed (debugging aid).

	void	sv_report_used()','name' => 'sv_report_used'},'save_sptr' => {'text' => '','name' => 'save_sptr'},'sv_vcatpvfn_flags' => {'text' => 'Processes its arguments like C<vsprintf> and appends the formatted output
to an SV.  Uses an array of SVs if the C style variable argument list is
missing (NULL).  When running with taint checks enabled, indicates via
C<maybe_tainted> if results are untrustworthy (often due to the use of
locales).

If called as C<sv_vcatpvfn> or flags include C<SV_GMAGIC>, calls get magic.

Usually used via one of its frontends C<sv_vcatpvf> and C<sv_vcatpvf_mg>.

	void	sv_vcatpvfn_flags(SV *const sv,
		                  const char *const pat,
		                  const STRLEN patlen,
		                  va_list *const args,
		                  SV **const svargs,
		                  const I32 svmax,
		                  bool *const maybe_tainted,
		                  const U32 flags)','name' => 'sv_vcatpvfn_flags'},'SvNVX' => {'text' => 'Returns the raw value in the SV\'s NV slot, without checks or conversions.
Only use when you are sure SvNOK is true.  See also C<SvNV()>.

	NV	SvNVX(SV* sv)','name' => 'SvNVX'},'do_open' => {'text' => '','name' => 'do_open'},'regnext' => {'text' => '','name' => 'regnext'},'HeHASH' => {'text' => 'Returns the computed hash stored in the hash entry.

	U32	HeHASH(HE* he)','name' => 'HeHASH'},'SvIOK' => {'text' => 'Returns a U32 value indicating whether the SV contains an integer.

	U32	SvIOK(SV* sv)','name' => 'SvIOK'},'newANONHASH' => {'text' => '','name' => 'newANONHASH'},'PadnameSV' => {'text' => 'Returns the pad name as an SV.  This is currently just C<pn>.  It will
begin returning a new mortal SV if pad names ever stop being SVs.

NOTE: this function is experimental and may change or be
removed without notice.

	SV *	PadnameSV(PADNAME pn)','name' => 'PadnameSV'},'is_utf8_char_buf' => {'text' => 'Returns the number of bytes that comprise the first UTF-8 encoded character in
buffer C<buf>.  C<buf_end> should point to one position beyond the end of the
buffer.  0 is returned if C<buf> does not point to a complete, valid UTF-8
encoded character.

Note that an INVARIANT character (i.e. ASCII on non-EBCDIC
machines) is a valid UTF-8 character.

	STRLEN	is_utf8_char_buf(const U8 *buf,
		                 const U8 *buf_end)','name' => 'is_utf8_char_buf'},'SvPV_force' => {'text' => 'Like C<SvPV> but will force the SV into containing a string (C<SvPOK>), and
only a string (C<SvPOK_only>), by hook or by crook.  You need force if you are
going to update the C<SvPVX> directly.  Processes get magic.

Note that coercing an arbitrary scalar into a plain PV will potentially
strip useful data from it. For example if the SV was C<SvROK>, then the
referent will have its reference count decremented, and the SV itself may
be converted to an C<SvPOK> scalar with a string buffer containing a value
such as C<"ARRAY(0x1234)">.

	char*	SvPV_force(SV* sv, STRLEN len)','name' => 'SvPV_force'},'HeUTF8' => {'text' => 'Returns whether the C<char *> value returned by C<HePV> is encoded in UTF-8,
doing any necessary dereferencing of possibly C<SV*> keys.  The value returned
will be 0 or non-0, not necessarily 1 (or even a value with any low bits set),
so B<do not> blindly assign this to a C<bool> variable, as C<bool> may be a
typedef for C<char>.

	char*	HeUTF8(HE* he)','name' => 'HeUTF8'},'newRANGE' => {'text' => 'Constructs and returns a C<range> op, with subordinate C<flip> and
C<flop> ops.  I<flags> gives the eight bits of C<op_flags> for the
C<flip> op and, shifted up eight bits, the eight bits of C<op_private>
for both the C<flip> and C<range> ops, except that the bit with value
1 is automatically set.  I<left> and I<right> supply the expressions
controlling the endpoints of the range; they are consumed by this function
and become part of the constructed op tree.

	OP *	newRANGE(I32 flags, OP *left, OP *right)','name' => 'newRANGE'},'isCNTRL' => {'text' => 'Returns a boolean indicating whether the specified character is a
control character, analogous to C<m/[[:cntrl:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isCNTRL_A>, C<isCNTRL_L1>, C<isCNTRL_uni>, C<isCNTRL_utf8>, C<isCNTRL_LC>,
C<isCNTRL_LC_uvchr>, and C<isCNTRL_LC_utf8>
On EBCDIC platforms, you almost always want to use the C<isCNTRL_L1> variant.

	bool	isCNTRL(char ch)','name' => 'isCNTRL'},'PadlistNAMESARRAY' => {'text' => 'The C array of pad names.

NOTE: this function is experimental and may change or be
removed without notice.

	PADNAME ** PadlistNAMESARRAY(PADLIST padlist)','name' => 'PadlistNAMESARRAY'},'cophh_delete_pvn' => {'text' => 'Delete a key and its associated value from the cop hints hash I<cophh>,
and returns the modified hash.  The returned hash pointer is in general
not the same as the hash pointer that was passed in.  The input hash is
consumed by the function, and the pointer to it must not be subsequently
used.  Use L</cophh_copy> if you need both hashes.

The key is specified by I<keypv> and I<keylen>.  If I<flags> has the
C<COPHH_KEY_UTF8> bit set, the key octets are interpreted as UTF-8,
otherwise they are interpreted as Latin-1.  I<hash> is a precomputed
hash of the key string, or zero if it has not been precomputed.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_delete_pvn(COPHH *cophh,
		                 const char *keypv,
		                 STRLEN keylen, U32 hash,
		                 U32 flags)','name' => 'cophh_delete_pvn'},'grok_hex' => {'text' => 'converts a string representing a hex number to numeric form.

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

	UV	grok_hex(const char* start, STRLEN* len_p,
		         I32* flags, NV *result)','name' => 'grok_hex'},'newRV' => {'text' => '','name' => 'newRV'},'SvLOCK' => {'text' => 'Arranges for a mutual exclusion lock to be obtained on sv if a suitable module
has been loaded.

	void	SvLOCK(SV* sv)','name' => 'SvLOCK'},'gv_fetchfile' => {'text' => '','name' => 'gv_fetchfile'},'sv_vsetpvfn' => {'text' => 'Works like C<sv_vcatpvfn> but copies the text into the SV instead of
appending it.

Usually used via one of its frontends C<sv_vsetpvf> and C<sv_vsetpvf_mg>.

	void	sv_vsetpvfn(SV *const sv, const char *const pat,
		            const STRLEN patlen,
		            va_list *const args,
		            SV **const svargs, const I32 svmax,
		            bool *const maybe_tainted)','name' => 'sv_vsetpvfn'},'PerlIO_get_cnt' => {'text' => '','name' => 'PerlIO_get_cnt'},'PerlIO_setlinebuf' => {'text' => '','name' => 'PerlIO_setlinebuf'},'utf16_to_utf8_reversed' => {'text' => '','name' => 'utf16_to_utf8_reversed'},'cast_ulong' => {'text' => '','name' => 'cast_ulong'},'to_utf8_case' => {'text' => 'The C<p> contains the pointer to the UTF-8 string encoding
the character that is being converted.  This routine assumes that the character
at C<p> is well-formed.

The C<ustrp> is a pointer to the character buffer to put the
conversion result to.  The C<lenp> is a pointer to the length
of the result.

The C<swashp> is a pointer to the swash to use.

Both the special and normal mappings are stored in F<lib/unicore/To/Foo.pl>,
and loaded by SWASHNEW, using F<lib/utf8_heavy.pl>.  The C<special> (usually,
but not always, a multicharacter mapping), is tried first.

The C<special> is a string like "utf8::ToSpecLower", which means the
hash %utf8::ToSpecLower.  The access to the hash is through
Perl_to_utf8_case().

The C<normal> is a string like "ToLower" which means the swash
%utf8::ToLower.

	UV	to_utf8_case(const U8 *p, U8* ustrp,
		             STRLEN *lenp, SV **swashp,
		             const char *normal,
		             const char *special)','name' => 'to_utf8_case'},'set_numeric_local' => {'text' => '','name' => 'set_numeric_local'},'calloc' => {'text' => '','name' => 'calloc'},'POPpbytex' => {'text' => 'Pops a string off the stack which must consist of bytes i.e. characters < 256.

	char*	POPpbytex','name' => 'POPpbytex'},'cophh_store_sv' => {'text' => 'Like L</cophh_store_pvn>, but takes a Perl scalar instead of a
string/length pair.

NOTE: this function is experimental and may change or be
removed without notice.

	COPHH *	cophh_store_sv(const COPHH *cophh, SV *key,
		               U32 hash, SV *value, U32 flags)','name' => 'cophh_store_sv'},'newPMOP' => {'text' => 'Constructs, checks, and returns an op of any pattern matching type.
I<type> is the opcode.  I<flags> gives the eight bits of C<op_flags>
and, shifted up eight bits, the eight bits of C<op_private>.

	OP *	newPMOP(I32 type, I32 flags)','name' => 'newPMOP'},'PL_peepp' => {'text' => 'Pointer to the per-subroutine peephole optimiser.  This is a function
that gets called at the end of compilation of a Perl subroutine (or
equivalently independent piece of Perl code) to perform fixups of
some ops and to perform small-scale optimisations.  The function is
called once for each subroutine that is compiled, and is passed, as sole
parameter, a pointer to the op that is the entry point to the subroutine.
It modifies the op tree in place.

The peephole optimiser should never be completely replaced.  Rather,
add code to it by wrapping the existing optimiser.  The basic way to do
this can be seen in L<perlguts/Compile pass 3: peephole optimization>.
If the new code wishes to operate on ops throughout the subroutine\'s
structure, rather than just at the top level, it is likely to be more
convenient to wrap the L</PL_rpeepp> hook.

	peep_t	PL_peepp','name' => 'PL_peepp'},'SvSetMagicSV' => {'text' => 'Like C<SvSetSV>, but does any set magic required afterwards.

	void	SvSetMagicSV(SV* dsb, SV* ssv)','name' => 'SvSetMagicSV'},'isALPHANUMERIC' => {'text' => 'Returns a boolean indicating whether the specified character is a either an
alphabetic character or decimal digit, analogous to C<m/[[:alnum:]]/>.
See the L<top of this section|/Character classes> for an explanation of variants
C<isALPHANUMERIC_A>, C<isALPHANUMERIC_L1>, C<isALPHANUMERIC_uni>,
C<isALPHANUMERIC_utf8>, C<isALPHANUMERIC_LC>, C<isALPHANUMERIC_LC_uvchr>, and
C<isALPHANUMERIC_LC_utf8>.

	bool	isALPHANUMERIC(char ch)','name' => 'isALPHANUMERIC'},'Move' => {'text' => 'The XSUB-writer\'s interface to the C C<memmove> function.  The C<src> is the
source, C<dest> is the destination, C<nitems> is the number of items, and
C<type> is the type.  Can do overlapping moves.  See also C<Copy>.

	void	Move(void* src, void* dest, int nitems, type)','name' => 'Move'},'set_context' => {'text' => '','name' => 'set_context'},'sv_catpvn_flags' => {'text' => 'Concatenates the string onto the end of the string which is in the SV.  The
C<len> indicates number of bytes to copy.  If the SV has the UTF-8
status set, then the bytes appended should be valid UTF-8.
If C<flags> has the C<SV_SMAGIC> bit set, will
C<mg_set> on C<dsv> afterwards if appropriate.
C<sv_catpvn> and C<sv_catpvn_nomg> are implemented
in terms of this function.

	void	sv_catpvn_flags(SV *const dstr,
		                const char *sstr,
		                const STRLEN len,
		                const I32 flags)','name' => 'sv_catpvn_flags'},'PerlIO_flush' => {'text' => '','name' => 'PerlIO_flush'},'sv_2iv_flags' => {'text' => 'Return the integer value of an SV, doing any necessary string
conversion.  If flags includes SV_GMAGIC, does an mg_get() first.
Normally used via the C<SvIV(sv)> and C<SvIVx(sv)> macros.

	IV	sv_2iv_flags(SV *const sv, const I32 flags)','name' => 'sv_2iv_flags'},'runops_standard' => {'text' => '','name' => 'runops_standard'},'gv_efullname3' => {'text' => '','name' => 'gv_efullname3'},'newXS' => {'text' => 'Used by C<xsubpp> to hook up XSUBs as Perl subs.  I<filename> needs to be
static storage, as it is used directly as CvFILE(), without a copy being made.','name' => 'newXS'},'XCPT_RETHROW' => {'text' => 'Rethrows a previously caught exception.  See L<perlguts/"Exception Handling">.

		XCPT_RETHROW;','name' => 'XCPT_RETHROW'},'mg_dup' => {'text' => '','name' => 'mg_dup'},'cop_hints_fetch_pvs' => {'text' => 'Like L</cop_hints_fetch_pvn>, but takes a literal string instead of a
string/length pair, and no precomputed hash.

	SV *	cop_hints_fetch_pvs(const COP *cop,
		                    const char *key, U32 flags)','name' => 'cop_hints_fetch_pvs'},'cop_store_label' => {'text' => 'Save a label into a C<cop_hints_hash>. You need to set flags to C<SVf_UTF8>
for a utf-8 label.

NOTE: this function is experimental and may change or be
removed without notice.

	void	cop_store_label(COP *const cop,
		                const char *label, STRLEN len,
		                U32 flags)','name' => 'cop_store_label'},'PUSHmortal' => {'text' => 'Push a new mortal SV onto the stack.  The stack must have room for this
element.  Does not use C<TARG>.  See also C<PUSHs>, C<XPUSHmortal> and C<XPUSHs>.

	void	PUSHmortal()','name' => 'PUSHmortal'},'XS_EXTERNAL' => {'text' => 'Macro to declare an XSUB and its C parameter list explicitly exporting the symbols.','name' => 'XS_EXTERNAL'},'perl_alloc' => {'text' => 'Allocates a new Perl interpreter.  See L<perlembed>.

	PerlInterpreter* perl_alloc()','name' => 'perl_alloc'},'sv_dump' => {'text' => '','name' => 'sv_dump'},'pad_tidy' => {'text' => 'Tidy up a pad at the end of compilation of the code to which it belongs.
Jobs performed here are: remove most stuff from the pads of anonsub
prototypes; give it a @_; mark temporaries as such.  I<type> indicates
the kind of subroutine:

    padtidy_SUB        ordinary subroutine
    padtidy_SUBCLONE   prototype for lexical closure
    padtidy_FORMAT     format

NOTE: this function is experimental and may change or be
removed without notice.

	void	pad_tidy(padtidy_type type)','name' => 'pad_tidy'},'OP_DESC' => {'text' => 'Return a short description of the provided OP.

	const char * OP_DESC(OP *o)','name' => 'OP_DESC'},'strLE' => {'text' => 'Test two strings to see if the first, C<s1>, is less than or equal to the
second, C<s2>.  Returns true or false.

	bool	strLE(char* s1, char* s2)','name' => 'strLE'},'newSVpvn_flags' => {'text' => 'Creates a new SV and copies a string into it.  The reference count for the
SV is set to 1.  Note that if C<len> is zero, Perl will create a zero length
string.  You are responsible for ensuring that the source string is at least
C<len> bytes long.  If the C<s> argument is NULL the new SV will be undefined.
Currently the only flag bits accepted are C<SVf_UTF8> and C<SVs_TEMP>.
If C<SVs_TEMP> is set, then C<sv_2mortal()> is called on the result before
returning.  If C<SVf_UTF8> is set, C<s>
is considered to be in UTF-8 and the
C<SVf_UTF8> flag will be set on the new SV.
C<newSVpvn_utf8()> is a convenience wrapper for this function, defined as

    #define newSVpvn_utf8(s, len, u)			\\
	newSVpvn_flags((s), (len), (u) ? SVf_UTF8 : 0)

	SV*	newSVpvn_flags(const char *const s,
		               const STRLEN len,
		               const U32 flags)','name' => 'newSVpvn_flags'},'XopFLAGS' => {'text' => 'Return the XOP\'s flags.

	U32	XopFLAGS(XOP *xop)','name' => 'XopFLAGS'},'SvOK' => {'text' => 'Returns a U32 value indicating whether the value is defined. This is
only meaningful for scalars.

	U32	SvOK(SV* sv)','name' => 'SvOK'},'sv_setref_nv' => {'text' => 'Copies a double into a new SV, optionally blessing the SV.  The C<rv>
argument will be upgraded to an RV.  That RV will be modified to point to
the new SV.  The C<classname> argument indicates the package for the
blessing.  Set C<classname> to C<NULL> to avoid the blessing.  The new SV
will have a reference count of 1, and the RV will be returned.

	SV*	sv_setref_nv(SV *const rv,
		             const char *const classname,
		             const NV nv)','name' => 'sv_setref_nv'},'eval_pv' => {'text' => 'Tells Perl to C<eval> the given string and return an SV* result.

NOTE: the perl_ form of this function is deprecated.

	SV*	eval_pv(const char* p, I32 croak_on_error)','name' => 'eval_pv'},'lex_stuff_pvn' => {'text' => 'Insert characters into the lexer buffer (L</PL_parser-E<gt>linestr>),
immediately after the current lexing point (L</PL_parser-E<gt>bufptr>),
reallocating the buffer if necessary.  This means that lexing code that
runs later will see the characters as if they had appeared in the input.
It is not recommended to do this as part of normal parsing, and most
uses of this facility run the risk of the inserted characters being
interpreted in an unintended manner.

The string to be inserted is represented by I<len> octets starting
at I<pv>.  These octets are interpreted as either UTF-8 or Latin-1,
according to whether the C<LEX_STUFF_UTF8> flag is set in I<flags>.
The characters are recoded for the lexer buffer, according to how the
buffer is currently being interpreted (L</lex_bufutf8>).  If a string
to be inserted is available as a Perl scalar, the L</lex_stuff_sv>
function is more convenient.

NOTE: this function is experimental and may change or be
removed without notice.

	void	lex_stuff_pvn(const char *pv, STRLEN len,
		              U32 flags)','name' => 'lex_stuff_pvn'},'sv_usepvn_flags' => {'text' => 'Tells an SV to use C<ptr> to find its string value.  Normally the
string is stored inside the SV but sv_usepvn allows the SV to use an
outside string.  The C<ptr> should point to memory that was allocated
by C<malloc>.  It must be the start of a mallocked block
of memory, and not a pointer to the middle of it.  The
string length, C<len>, must be supplied.  By default
this function will realloc (i.e. move) the memory pointed to by C<ptr>,
so that pointer should not be freed or used by the programmer after
giving it to sv_usepvn, and neither should any pointers from "behind"
that pointer (e.g. ptr + 1) be used.

If C<flags> & SV_SMAGIC is true, will call SvSETMAGIC.  If C<flags> &
SV_HAS_TRAILING_NUL is true, then C<ptr[len]> must be NUL, and the realloc
will be skipped (i.e. the buffer is actually at least 1 byte longer than
C<len>, and already meets the requirements for storing in C<SvPVX>).

	void	sv_usepvn_flags(SV *const sv, char* ptr,
		                const STRLEN len,
		                const U32 flags)','name' => 'sv_usepvn_flags'},'hv_assert' => {'text' => 'Check that a hash is in an internally consistent state.

	void	hv_assert(HV *hv)','name' => 'hv_assert'},'my_vsnprintf' => {'text' => 'The C library C<vsnprintf> if available and standards-compliant.
However, if if the C<vsnprintf> is not available, will unfortunately
use the unsafe C<vsprintf> which can overrun the buffer (there is an
overrun check, but that may be too late).  Consider using
C<sv_vcatpvf> instead, or getting C<vsnprintf>.

	int	my_vsnprintf(char *buffer, const Size_t len,
		             const char *format, va_list ap)','name' => 'my_vsnprintf'},'sv_free' => {'text' => 'Decrement an SV\'s reference count, and if it drops to zero, call
C<sv_clear> to invoke destructors and free up any memory used by
the body; finally, deallocate the SV\'s head itself.
Normally called via a wrapper macro C<SvREFCNT_dec>.

	void	sv_free(SV *const sv)','name' => 'sv_free'},'die_nocontext' => {'text' => '','name' => 'die_nocontext'},'hv_eiter_p' => {'text' => '','name' => 'hv_eiter_p'},'SvPVbyte_force' => {'text' => 'Like C<SvPV_force>, but converts sv to byte representation first if necessary.

	char*	SvPVbyte_force(SV* sv, STRLEN len)','name' => 'SvPVbyte_force'},'av_pop' => {'text' => 'Removes one SV from the end of the array, reducing its size by one and
returning the SV (transferring control of one reference count) to the
caller.  Returns C<&PL_sv_undef> if the array is empty.

Perl equivalent: C<pop(@myarray);>

	SV*	av_pop(AV *av)','name' => 'av_pop'},'reg_named_buff_exists' => {'text' => '','name' => 'reg_named_buff_exists'},'save_bool' => {'text' => '','name' => 'save_bool'},'ckwarn_d' => {'text' => '','name' => 'ckwarn_d'},'croak' => {'text' => 'This is an XS interface to Perl\'s C<die> function.

Take a sprintf-style format pattern and argument list.  These are used to
generate a string message.  If the message does not end with a newline,
then it will be extended with some indication of the current location
in the code, as described for L</mess_sv>.

The error message will be used as an exception, by default
returning control to the nearest enclosing C<eval>, but subject to
modification by a C<$SIG{__DIE__}> handler.  In any case, the C<croak>
function never returns normally.

For historical reasons, if C<pat> is null then the contents of C<ERRSV>
(C<$@>) will be used as an error message or object instead of building an
error message from arguments.  If you want to throw a non-string object,
or build an error message in an SV yourself, it is preferable to use
the L</croak_sv> function, which does not involve clobbering C<ERRSV>.

	void	croak(const char *pat, ...)','name' => 'croak'},'save_freepv' => {'text' => '','name' => 'save_freepv'},'THIS' => {'text' => 'Variable which is setup by C<xsubpp> to designate the object in a C++ 
XSUB.  This is always the proper type for the C++ object.  See C<CLASS> and 
L<perlxs/"Using XS With C++">.

	(whatever)	THIS','name' => 'THIS'},'XSRETURN' => {'text' => 'Return from XSUB, indicating number of items on the stack.  This is usually
handled by C<xsubpp>.

	void	XSRETURN(int nitems)','name' => 'XSRETURN'},'dump_indent' => {'text' => '','name' => 'dump_indent'},'screaminstr' => {'text' => '','name' => 'screaminstr'},'op_append_elem' => {'text' => 'Append an item to the list of ops contained directly within a list-type
op, returning the lengthened list.  I<first> is the list-type op,
and I<last> is the op to append to the list.  I<optype> specifies the
intended opcode for the list.  If I<first> is not already a list of the
right type, it will be upgraded into one.  If either I<first> or I<last>
is null, the other is returned unchanged.

	OP *	op_append_elem(I32 optype, OP *first, OP *last)','name' => 'op_append_elem'},'lex_read_unichar' => {'text' => 'Reads the next (Unicode) character in the text currently being lexed.
Returns the codepoint (unsigned integer value) of the character read,
and moves L</PL_parser-E<gt>bufptr> past the character, or returns -1
if lexing has reached the end of the input text.  To non-destructively
examine the next character, use L</lex_peek_unichar> instead.

If the next character is in (or extends into) the next chunk of input
text, the next chunk will be read in.  Normally the current chunk will be
discarded at the same time, but if I<flags> includes C<LEX_KEEP_PREVIOUS>
then the current chunk will not be discarded.

If the input is being interpreted as UTF-8 and a UTF-8 encoding error
is encountered, an exception is generated.

NOTE: this function is experimental and may change or be
removed without notice.

	I32	lex_read_unichar(U32 flags)','name' => 'lex_read_unichar'},'reginitcolors' => {'text' => '','name' => 'reginitcolors'},'get_av' => {'text' => 'Returns the AV of the specified Perl global or package array with the given
name (so it won\'t work on lexical variables).  C<flags> are passed 
to C<gv_fetchpv>. If C<GV_ADD> is set and the
Perl variable does not exist then it will be created.  If C<flags> is zero
and the variable does not exist then NULL is returned.

Perl equivalent: C<@{"$name"}>.

NOTE: the perl_ form of this function is deprecated.

	AV*	get_av(const char *name, I32 flags)','name' => 'get_av'},'sv_2pv_nolen' => {'text' => 'Like C<sv_2pv()>, but doesn\'t return the length too. You should usually
use the macro wrapper C<SvPV_nolen(sv)> instead.

	char*	sv_2pv_nolen(SV* sv)','name' => 'sv_2pv_nolen'},'op_contextualize' => {'text' => 'Applies a syntactic context to an op tree representing an expression.
I<o> is the op tree, and I<context> must be C<G_SCALAR>, C<G_ARRAY>,
or C<G_VOID> to specify the context to apply.  The modified op tree
is returned.

	OP *	op_contextualize(OP *o, I32 context)','name' => 'op_contextualize'},'PoisonFree' => {'text' => 'PoisonWith(0xEF) for catching access to freed memory.

	void	PoisonFree(void* dest, int nitems, type)','name' => 'PoisonFree'},'gv_SVadd' => {'text' => '','name' => 'gv_SVadd'},'hv_common' => {'text' => '','name' => 'hv_common'},'XopENTRY' => {'text' => 'Return a member of the XOP structure. I<which> is a cpp token indicating
which entry to return. If the member is not set this will return a
default value. The return type depends on I<which>.

		XopENTRY(XOP *xop, which)','name' => 'XopENTRY'},'newSVREF' => {'text' => '','name' => 'newSVREF'},'toUPPER' => {'text' => 'Converts the specified character to uppercase, if possible; otherwise returns
the input character itself.

	char	toUPPER(char ch)','name' => 'toUPPER'},'sv_catpvs_flags' => {'text' => 'Like C<sv_catpvn_flags>, but takes a literal string instead of a
string/length pair.

	void	sv_catpvs_flags(SV* sv, const char* s,
		                I32 flags)','name' => 'sv_catpvs_flags'},'is_lvalue_sub' => {'text' => '','name' => 'is_lvalue_sub'},'is_utf8_string_loc' => {'text' => 'Like L</is_utf8_string> but stores the location of the failure (in the
case of "utf8ness failure") or the location C<s>+C<len> (in the case of
"utf8ness success") in the C<ep>.

See also L</is_utf8_string_loclen>() and L</is_utf8_string>().

	bool	is_utf8_string_loc(const U8 *s, STRLEN len,
		                   const U8 **ep)','name' => 'is_utf8_string_loc'},'sv_gets' => {'text' => 'Get a line from the filehandle and store it into the SV, optionally
appending to the currently-stored string. If C<append> is not 0, the
line is appended to the SV instead of overwriting it. C<append> should
be set to the byte offset that the appended string should start at
in the SV (typically, C<SvCUR(sv)> is a suitable choice).

	char*	sv_gets(SV *const sv, PerlIO *const fp,
		        I32 append)','name' => 'sv_gets'},'GvAV' => {'text' => 'Return the AV from the GV.

	AV*	GvAV(GV* gv)','name' => 'GvAV'},'SvSetSV_nosteal' => {'text' => 'Calls a non-destructive version of C<sv_setsv> if dsv is not the same as
ssv.  May evaluate arguments more than once.

	void	SvSetSV_nosteal(SV* dsv, SV* ssv)','name' => 'SvSetSV_nosteal'},'pad_add_anon' => {'text' => 'Allocates a place in the currently-compiling pad (via L</pad_alloc>)
for an anonymous function that is lexically scoped inside the
currently-compiling function.
The function I<func> is linked into the pad, and its C<CvOUTSIDE> link
to the outer scope is weakened to avoid a reference loop.

One reference count is stolen, so you may need to do C<SvREFCNT_inc(func)>.

I<optype> should be an opcode indicating the type of operation that the
pad entry is to support.  This doesn\'t affect operational semantics,
but is used for debugging.

	PADOFFSET pad_add_anon(CV *func, I32 optype)','name' => 'pad_add_anon'},'dUNDERBAR' => {'text' => 'Sets up any variable needed by the C<UNDERBAR> macro. It used to define
C<padoff_du>, but it is currently a noop. However, it is strongly advised
to still use it for ensuring past and future compatibility.

		dUNDERBAR;','name' => 'dUNDERBAR'},'sv_uv' => {'text' => 'A private implementation of the C<SvUVx> macro for compilers which can\'t
cope with complex macro expressions. Always use the macro instead.

	UV	sv_uv(SV* sv)','name' => 'sv_uv'},'ptr_table_split' => {'text' => '','name' => 'ptr_table_split'},'foldEQ_utf8' => {'text' => 'Returns true if the leading portions of the strings C<s1> and C<s2> (either or both
of which may be in UTF-8) are the same case-insensitively; false otherwise.
How far into the strings to compare is determined by other input parameters.

If C<u1> is true, the string C<s1> is assumed to be in UTF-8-encoded Unicode;
otherwise it is assumed to be in native 8-bit encoding.  Correspondingly for C<u2>
with respect to C<s2>.

If the byte length C<l1> is non-zero, it says how far into C<s1> to check for fold
equality.  In other words, C<s1>+C<l1> will be used as a goal to reach.  The
scan will not be considered to be a match unless the goal is reached, and
scanning won\'t continue past that goal.  Correspondingly for C<l2> with respect to
C<s2>.

If C<pe1> is non-NULL and the pointer it points to is not NULL, that pointer is
considered an end pointer to the position 1 byte past the maximum point
in C<s1> beyond which scanning will not continue under any circumstances.
(This routine assumes that UTF-8 encoded input strings are not malformed;
malformed input can cause it to read past C<pe1>).
This means that if both C<l1> and C<pe1> are specified, and C<pe1>
is less than C<s1>+C<l1>, the match will never be successful because it can
never
get as far as its goal (and in fact is asserted against).  Correspondingly for
C<pe2> with respect to C<s2>.

At least one of C<s1> and C<s2> must have a goal (at least one of C<l1> and
C<l2> must be non-zero), and if both do, both have to be
reached for a successful match.   Also, if the fold of a character is multiple
characters, all of them must be matched (see tr21 reference below for
\'folding\').

Upon a successful match, if C<pe1> is non-NULL,
it will be set to point to the beginning of the I<next> character of C<s1>
beyond what was matched.  Correspondingly for C<pe2> and C<s2>.

For case-insensitiveness, the "casefolding" of Unicode is used
instead of upper/lowercasing both the characters, see
L<http://www.unicode.org/unicode/reports/tr21/> (Case Mappings).

	I32	foldEQ_utf8(const char *s1, char **pe1, UV l1,
		            bool u1, const char *s2, char **pe2,
		            UV l2, bool u2)','name' => 'foldEQ_utf8'},'Nullch' => {'text' => 'Null character pointer. (No longer available when C<PERL_CORE> is defined.)','name' => 'Nullch'},'sv_copypv_nomg' => {'text' => 'Like sv_copypv, but doesn\'t invoke get magic first.

	void	sv_copypv_nomg(SV *const dsv, SV *const ssv)','name' => 'sv_copypv_nomg'},'get_context' => {'text' => '','name' => 'get_context'},'vcroak' => {'text' => 'This is an XS interface to Perl\'s C<die> function.

C<pat> and C<args> are a sprintf-style format pattern and encapsulated
argument list.  These are used to generate a string message.  If the
message does not end with a newline, then it will be extended with
some indication of the current location in the code, as described for
L</mess_sv>.

The error message will be used as an exception, by default
returning control to the nearest enclosing C<eval>, but subject to
modification by a C<$SIG{__DIE__}> handler.  In any case, the C<croak>
function never returns normally.

For historical reasons, if C<pat> is null then the contents of C<ERRSV>
(C<$@>) will be used as an error message or object instead of building an
error message from arguments.  If you want to throw a non-string object,
or build an error message in an SV yourself, it is preferable to use
the L</croak_sv> function, which does not involve clobbering C<ERRSV>.

	void	vcroak(const char *pat, va_list *args)','name' => 'vcroak'},'parse_fullexpr' => {'text' => 'Parse a single complete Perl expression.  This allows the full
expression grammar, including the lowest-precedence operators such
as C<or>.  The expression must be followed (and thus terminated) by a
token that an expression would normally be terminated by: end-of-file,
closing bracketing punctuation, semicolon, or one of the keywords that
signals a postfix expression-statement modifier.  If I<flags> includes
C<PARSE_OPTIONAL> then the expression is optional, otherwise it is
mandatory.  It is up to the caller to ensure that the dynamic parser
state (L</PL_parser> et al) is correctly set to reflect the source of
the code to be parsed and the lexical context for the expression.

The op tree representing the expression is returned.  If an optional
expression is absent, a null pointer is returned, otherwise the pointer
will be non-null.

If an error occurs in parsing or compilation, in most cases a valid op
tree is returned anyway.  The error is reflected in the parser state,
normally resulting in a single exception at the top level of parsing
which covers all the compilation errors that occurred.  Some compilation
errors, however, will throw an exception immediately.

NOTE: this function is experimental and may change or be
removed without notice.

	OP *	parse_fullexpr(U32 flags)','name' => 'parse_fullexpr'},'sv_magicext' => {'text' => 'Adds magic to an SV, upgrading it if necessary.  Applies the
supplied vtable and returns a pointer to the magic added.

Note that C<sv_magicext> will allow things that C<sv_magic> will not.
In particular, you can add magic to SvREADONLY SVs, and add more than
one instance of the same \'how\'.

If C<namlen> is greater than zero then a C<savepvn> I<copy> of C<name> is
stored, if C<namlen> is zero then C<name> is stored as-is and - as another
special case - if C<(name && namlen == HEf_SVKEY)> then C<name> is assumed
to contain an C<SV*> and is stored as-is with its REFCNT incremented.

(This is now used as a subroutine by C<sv_magic>.)

	MAGIC *	sv_magicext(SV *const sv, SV *const obj,
		            const int how,
		            const MGVTBL *const vtbl,
		            const char *const name,
		            const I32 namlen)','name' => 'sv_magicext'},'gv_fullname4' => {'text' => '','name' => 'gv_fullname4'},'av_push' => {'text' => 'Pushes an SV onto the end of the array.  The array will grow automatically
to accommodate the addition.  This takes ownership of one reference count.

Perl equivalent: C<push @myarray, $elem;>.

	void	av_push(AV *av, SV *val)','name' => 'av_push'},'XSRETURN_NO' => {'text' => 'Return C<&PL_sv_no> from an XSUB immediately.  Uses C<XST_mNO>.

		XSRETURN_NO;','name' => 'XSRETURN_NO'},'POPn' => {'text' => 'Pops a double off the stack.

	NV	POPn','name' => 'POPn'},'newRV_noinc' => {'text' => 'Creates an RV wrapper for an SV.  The reference count for the original
SV is B<not> incremented.

	SV*	newRV_noinc(SV *const sv)','name' => 'newRV_noinc'},'unsharepvn' => {'text' => '','name' => 'unsharepvn'},'my_memcmp' => {'text' => '','name' => 'my_memcmp'},'newSLICEOP' => {'text' => 'Constructs, checks, and returns an C<lslice> (list slice) op.  I<flags>
gives the eight bits of C<op_flags>, except that C<OPf_KIDS> will
be set automatically, and, shifted up eight bits, the eight bits of
C<op_private>, except that the bit with value 1 or 2 is automatically
set as required.  I<listval> and I<subscript> supply the parameters of
the slice; they are consumed by this function and become part of the
constructed op tree.

	OP *	newSLICEOP(I32 flags, OP *subscript,
		           OP *listval)','name' => 'newSLICEOP'},'mfree' => {'text' => '','name' => 'mfree'},'save_re_context' => {'text' => '','name' => 'save_re_context'},'hv_iterinit' => {'text' => 'Prepares a starting point to traverse a hash table.  Returns the number of
keys in the hash (i.e. the same as C<HvUSEDKEYS(hv)>).  The return value is
currently only meaningful for hashes without tie magic.

NOTE: Before version 5.004_65, C<hv_iterinit> used to return the number of
hash buckets that happen to be in use.  If you still need that esoteric
value, you can get it through the macro C<HvFILL(hv)>.


	I32	hv_iterinit(HV *hv)','name' => 'hv_iterinit'}};};

  my $self = bless({
    'index' => $VAR1,
    perl_version => '5.018000',
  } => $class);
  return $self;
}

1;
