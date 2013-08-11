OBO=http://purl.obolibrary.org/obo
SRC = ../cl-basic.obo
TGTS = html text rss

TXTS = cl-obo-diff.txt cl-def-diff.txt

all: cl-obo-diff.html cl-def-diff.html cl-combined-diff.txt

cl-obo-diff.html: cl-lastbuild.obo $(SRC)
	compare-obo-files.pl --config 'html/ontology_name=Cell Ontology' --rss-path . -f1 $< -f2 $(SRC) -m $(TGTS) -o cl-obo-diff
cl-def-diff.html: cl-lastbuild.obo $(SRC)
	compare-defs.pl --config 'html/ontology_name=Cell Ontology' --rss-path . -f1 $< -f2 $(SRC) -m $(TGTS) -o cl-def-diff

cl-obo-diff.txt: cl-obo-diff.html
cl-def-diff.txt: cl-def-diff.html

cl-combined-diff.txt:  $(TXTS)
	cat $(TXTS) > $@

cl-lastbuild.obo: $(SRC)
	wget $(OBO)/cl-basic.obo -O $@
