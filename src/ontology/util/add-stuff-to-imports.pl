#!/usr/bin/perl
my $OBO="http://purl.obolibrary.org/obo";
my $ont = shift @ARGV;
my $import_ont = "imports/$ont"."_import.owl";
my $import_ont_staged = "imports/$ont"."_import-staged.owl";
my $owl = "$OBO/$ont.owl";

#my $cmd = "owltools $import_ont $owl --extract-module -s $owl @ARGV --merge-support-ontologies --extract-mingraph -o $import_ont_staged";
runcmd("owltools  $owl --extract-module -s $owl @ARGV --extract-mingraph -o $import_ont_staged");
runcmd("owltools $import_ont $import_ont_staged --merge-support-ontologies -o $import_ont_staged");
exit 0;

sub runcmd {
    my $cmd = shift;
    print STDERR "CMD = $cmd\n";
    if (system($cmd)) 
        {
            die "Cannot execute $cmd";
        }
}

