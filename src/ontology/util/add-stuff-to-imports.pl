#!/usr/bin/perl
my $OBO=http://purl.obolibrary.org/obo
my $ont = shift @ARGV;
my $cmd = "owltools imports/$ont"."_import.owl $OBO/$ont".".owl --extract-module -s $OBO/$ont".".owl '@ARGV' --merge-support-ontologies -o imports/$ont"."_import-staged.owl";
print `$cmd`;
