
# Makefile.PL -- Makefile template for Pod::PerlPoint
#
# Pod::PerlPoint is free software, you can redistribute it
# and/or modify it under the terms of the Artistic License.

# load module
use ExtUtils::MakeMaker;

# perl requirements
require 5.00503;

# write makefile
$ok=WriteMakefile(
                  NAME         => 'Pod::PerlPoint',
                  ABSTRACT     => 'A module to build Pod to PerlPoint translators.',
                  VERSION_FROM => 'lib/Pod/PerlPoint.pm',
                  PREREQ_PM    => {
                                   # for Pod::PerlPoint
		                   Pod::Simple       => 0.96,
                                   Test::Harness     => 1.25,
                                   Test::More        => 0.11,

                                   # for pod2pp
		                   Getopt::ArgvFile  => 1.06,
		                   Getopt::Long      => 2.32,
		                   Pod::Usage        => 1.14,
                                  },
                  dist         => {
                                   COMPRESS     => 'gzip -9',
                                   SUFFIX       => 'tgz',
                                  },
		  EXE_FILES    => [qw(pod2pp)] 		  
                 );

