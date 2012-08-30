#!/usr/bin/env perl
use strict; use warnings;
use File::Temp qw(tempfile);
use File::Basename;
use Test::More;
use English;

chdir dirname(__FILE__);
my @args = ("$EXECUTABLE_NAME", '-I../lib', '-MPerl::Syntax', 
	    basename(__FILE__));
# print "args are: ", join(', ', @args), "\n";
system(@args);
is($?>>8, 0, __FILE__ . " is syntactically valid Perl" );
@args = ("$EXECUTABLE_NAME", '-I../lib', '-MPerl::Syntax', 'bad.pl');
system(@args);
isnt(0, $?, "bad.pl is syntactically invalid" );
done_testing();
