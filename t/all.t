

# = HISTORY SECTION =====================================================================

# ---------------------------------------------------------------------------------------
# version | date     | author   | changes
# ---------------------------------------------------------------------------------------
# 0.03    |29.05.2004| JSTENZEL | adapted to module version 0.04;
# 0.02    |03.01.2003| JSTENZEL | adapted to module version 0.03;
# 0.01    |10.12.2002| JSTENZEL | new.
# ---------------------------------------------------------------------------------------

# a Pod::PerlPoint test script

# pragmata
use strict;

# load modules
use Carp;
use Pod::PerlPoint;
use Test::More qw(no_plan);




# prepare the POD string
my $pod=<<'EOPOD';


Text that should not be treated as POD.

=pod

=head1 A first headline

This is C<I<B<POD>>>.

  This is verbatim
  text.

  Continued.

  And I<tagged>.


=head2 And a 2nd chapter

=over 4

=item * This is the explanation.

=item * Another oneZ<>.

=back

=over 4

=item 1

This is a X<numbered>I<numbered> point.

=back

Plain text again. A F<filename>.

=over 4

=item 1

 A verbatim block
 in a list point.

=item 2

 And its successor.

=back

Links: L<http://use.perl.org>, L</A first headline>.

Embedded PerlPoint:

=for perlpoint
A \I<perlpoint> text.

And I<POD> again.

=begin perlpoint

@|
column 1   | column 2
cell 1     | cell 2
cell \I<3> | cell 4

=end perlpoint

=cut

Arbitrary text.

EOPOD


# declare what we expect
my $expected=<<'EOPP';


$__pod2pp__empty__=



=A first headline

${__pod2pp__empty__}This is \C<\I<\B<POD>>>.

<<___EOVPPB__

  This is verbatim
  text.

  Continued.

  And I<tagged>.

___EOVPPB__



==And a 2nd chapter

* This is the explanation.

* Another one.

# This is a \X{mode=index_only}<numbered>\I<numbered> point.

${__pod2pp__empty__}Plain text again. A \C<filename>.

# ${__pod2pp__empty__}

<<___EOVPPB__

 A verbatim block
 in a list point.

___EOVPPB__

## ${__pod2pp__empty__}

<<___EOVPPB__

 And its successor.

___EOVPPB__

${__pod2pp__empty__}Links: \L{url="http://use.perl.org"}<http://use.perl.org>, \REF{type=linked occasion=1 name="A first headline"}<"A first headline">.

${__pod2pp__empty__}Embedded PerlPoint:


A \I<perlpoint> text.

${__pod2pp__empty__}And \I<POD> again.

@|
column 1   | column 2
cell 1     | cell 2
cell \I<3> | cell 4

EOPP






# build a translator
my $translator=new Pod::PerlPoint;


# configure it
my $result;
$translator->output_string(\$result);

# transform this POD text into another text
$translator->parse_string_document($pod);

# compare
is($result, $expected);





