#!/usr/bin/perl
$DATE=`date "+%Y-%m-%d"`;
chomp $DATE;
while(<>) {
    $p = 1;
    s/^ontology:.*/ontology: cl/;
    s/^data-version:.*/data-version: $DATE/;
    if (/^\[/) {
        $in_body = 1;
    }
    if (!$in_body) {
        if ($seen{$_}) {
            $p=0;
        }
        else {
            $seen{$_} = 1;
        }
    }
    print if $p;
}
