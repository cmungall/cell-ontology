#!/usr/bin/perl
while(<>){
    s@http://ontology.neuinfo.org/NIF/\S+#@http://uri.neuinfo.org/nif/nifstd/@g;
    print;
}
