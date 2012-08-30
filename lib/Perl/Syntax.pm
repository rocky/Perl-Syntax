package Perl::Syntax;
our $VERSION = '1.00';
use B qw(minus_c save_BEGINs);
sub import {
    my ($class, @options) = @_;
    my $filename = $options[0] if @options;
    open (SAVE_ERR, '>&STDERR');
    eval q[
        BEGIN {
            minus_c;
            save_BEGINs;
            close STDERR;
            if (defined($filename)) {
               open (STDERR, ">", $filename);
            } else {
               open (STDERR, ">", \$Perl::Syntax::stderr);
            }
        }
    ];
    die $@ if $@
}
1;
