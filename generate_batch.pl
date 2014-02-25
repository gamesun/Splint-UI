#!/usr/bin/env perl
#

use strict;
use warnings;
use File::Find;
use File::Basename;


if ( ($#ARGV + 1) != 2 ){
    print "\n";
    print "USAGE\n";
    print "       perl generate_batch.pl <dir> <options>\n";
    print "OPTIONS\n";
    print "       <dir>\n";
    print "           Directory of source code to replace.\n";
    print "       <options>\n";
    print "           A file listing strings of the options for splint.exe\n";
    print "EXAMPLES\n";
    print "       perl generate_batch.pl c:\\project\\source\ -I\"c:\\project\\source\\inc\"\n";
    print "\n";
    print "generate_batch v1.0\n";
    exit;
}


my $dir = $ARGV[0];
my $file_options = $ARGV[1];
my $options = "";

STDOUT->autoflush;


init();
parse($dir);
exit 0;


sub init {
    
    open MYFILE, $file_options or die "$!";
    $options = <MYFILE>;
    close (MYFILE);
    
}


sub parse {
    my $dir = $_[0];
    my $cmd = "";
    
    opendir my $DIR, $dir or die "$!";
    while (my $file = readdir($DIR)) {
        if (-f "$dir\\$file") {
            if ( $file =~ /\.(c|h)$/ ) {
                $cmd = join(" ", "splint", "$dir\\$file", "$options");
                print "$cmd\n";
            }
        } elsif ( $file ne "." and $file ne ".." ) {
            parse("$dir\\$file");
        }
    }
    closedir($DIR);
}
