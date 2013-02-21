#!/usr/bin/perl
my @x=();
my $last='';
while(<>) {
    if (/^s\S+def:\s+(\S+)\s+\"(.*)\"/) {
        if ($last eq $1) {
            my $pop = pop(@x);
            printf STDERR "pop: $pop";
        }
        $last = $1;
    }
    else {
        $last = '';
    }
    push(@x,$_);
}
foreach (@x) {
    print $_;
}
