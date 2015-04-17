OBO=http://purl.obolibrary.org/obo
USECAT= --catalog-xml catalog-v001.xml

all: all_imports release

release: bridge-checks cl.obo cl.owl cl-basic.obo cl-basic.owl cl-obocheck cl-basic-obocheck diff

# ----------------------------------------
# BUILD
# ----------------------------------------

# This is a standard OORT build
# We add a custom step to unfold the import closure in the obo version, because obo does not handle imports well

# TODO: allow-equivalent-pairs is there for the CL:cell vs GO:cell
build/cl.owl: cl-edit.owl
	ontology-release-runner $(USECAT) --ignore-selected-equivalent-pairs 'CL:0000000'  --outdir build --no-subsets --allow-overwrite --ignoreLock --reasoner elk --asserted --simple $<
build/%: build/cl.owl
cl.owl: build/cl.owl
	cp $< $@
cl.obo: build/cl.owl
	owltools $(USECAT) $< --add-obo-shorthand-to-properties --merge-imports-closure -o -f obo $@
cl-basic.owl: build/cl-simple.owl
	owltools $< --remove-axioms -t DisjointClasses --set-ontology-id $(OBO)/cl/$@ -o $@
cl-basic.obo: cl-basic.owl
	owltools $< -o -f obo $@

%-obocheck: %.obo
	obo2obo $< -o $@

SSAOS= zfa xao
#SSAOS= zfa xao fbbt
#SSAOS= zfa
#SSAOS= xao fbbt
bridge-checks: $(patsubst %,cl-bridge-to-%-check.txt,$(SSAOS))

# TIP: to include explanations, do this:
#    make bridge-checks REASONER_ARGS="-e"
# WARNING: even with Elk, this can sometimes take an inordinate amount of time.
#          it is recommended that this is only set in test environments, never in production/Jenkins.
#          you may want to ctrl-C to quit the process after a while and look at the first few issues with "grep UNSAT"
REASONER_ARGS =

# do 'grep UNSAT' to check for success
# use cl-plus-zfa.owl to check for errors
cl-bridge-to-%-check.txt: cl-edit.owl
	owltools --use-catalog $< $(OBO)/$*.owl $(OBO)/uberon/bridge/cl-bridge-to-$*.owl --merge-support-ontologies --run-reasoner -r elk -u $(REASONER_ARGS) > $@.fail && mv $@.fail $@

cl-bridge-to-%-explanations.txt: cl-edit.owl
	owltools --use-catalog $< $(OBO)/$*.owl $(OBO)/uberon/bridge/cl-bridge-to-$*.owl --merge-support-ontologies --run-reasoner -r elk -u -e $(REASONER_ARGS) > $@

# ----------------------------------------
# Regenerate imports
# ----------------------------------------
# Uses OWLAPI Module Extraction code

# Type 'make imports/X_import.owl' whenever you wish to refresh the import for an ontology X. This is when:
#
#  1. X has changed and we want to include these changes
#  2. We have added onr or more new IRI from X into cl-edit.owl
#  3. We have removed references to one or more IRIs in X from cl-edit.owl
#
# You should NOT edit these files directly, changes will be overwritten.
#
# If you want to add something to these, edit cl-edit.owl and add an axiom with a IRI from X. You don't need to add any information about X.

# Base URI for local subset imports
CL_IMPORTS_BASE_URI = $(OBO)/cl

# Ontology dependencies
# We don't include clo, as this is currently not working
IMPORTS = pato uberon chebi pr go

# Make this target to regenerate ALL
all_imports: $(patsubst %, imports/%_import.owl,$(IMPORTS)) $(patsubst %, imports/%_import.obo,$(IMPORTS))

KEEPRELS = BFO:0000050 BFO:0000051 RO:0002202 immediate_transformation_of

# Create an import module using the OWLAPI module extraction code via OWLTools.
# We use the standard catalog, but rewrite the import to X to be a local mirror of ALL of X.
# After extraction, we further reduce the ontology by creating a "mingraph" (removes all annotations except label) and by 
imports/%_import.owl: cl-edit.owl mirror/%.owl imports/%_seed.owl
	OWLTOOLS_MEMORY=12G owltools  $(USECAT) --map-ontology-iri $(CL_IMPORTS_BASE_URI)/imports/$*_import.owl mirror/$*.owl $< imports/$*_seed.owl --merge-support-ontologies  --extract-module -s $(OBO)/$*.owl -c --remove-axiom-annotations --make-subset-by-properties -f $(KEEPRELS)  --remove-annotation-assertions -l -s --set-ontology-id $(CL_IMPORTS_BASE_URI)/$@ -o $@

imports/%_import.obo: imports/%_import.owl
	owltools $(USECAT) $< -o -f obo $@

# clone remote ontology locally, perfoming some excision of relations and annotations
mirror/%.owl: cl-edit.owl
	owltools $(OBO)/$*.owl --remove-annotation-assertions -l --remove-dangling-annotations --make-subset-by-properties -f $(KEEPRELS)  -o $@
mirror/uberon.owl: cl-edit.owl
	owltools $(OBO)/uberon/basic.owl --remove-annotation-assertions -l -s -d --remove-axiom-annotations --remove-dangling-annotations --make-subset-by-properties -f $(KEEPRELS) --set-ontology-id $(OBO)/uberon.owl -o $@
mirror/pr.obo: cl-edit.owl
	wget $(OBO)/pr.obo -O $@.tmp && ./util/obo-grep.pl -r 'id: PR:' $@.tmp > $@
mirror/pr.owl: mirror/pr.obo
	owltools $< --remove-dangling --set-ontology-id $(OBO)/pr.owl -o $@
mirror/clo.owl:
	owltools $(OBO)/clo.owl --remove-imports-declarations --set-ontology-id $(OBO)/clo.owl -o $@
mirror/ncbitaxon.owl:
	wget $(OBO)/ncbitaxon.owl -O $@
.PRECIOUS: mirror/%.owl

# ----------------------------------------
# Diffs
# ----------------------------------------

# full diff makes RSS as well
diff: cl-basic.obo
	cd diffs && rm cl-*diff* && make

# TESTING: emailing self, will change to list
minidiff: build/cl.obo
	cd diffs && rm cl-*diff* && make TGTS='html txt' SRC=../build/cl-simple.obo

#diffs: cl-obo-diff.html cl-def-diff.html cl-lastbuild.obo

#cl-obo-diff.html: cl-basic.obo
#	compare-obo-files.pl --config 'html/ontology_name=Cell Ontology' --rss-path ./rss -f1 cl-lastbuild.obo -f2 $< -m html text rss -o cl-obo-diff
#cl-def-diff.html: cl-basic.obo
#	compare-defs.pl --rss-path ./rss -f1 cl-lastbuild.obo -f2 $< -m html text -o cl-def-diff

#cl-lastbuild.obo: cl-basic.obo
#	cp $< $@



# ----------------------------------------
# REPORTING
# ----------------------------------------

# TODO: replace with SPARQL
cl-to-pr.txt: cl.obo
	blip-findall -i $< "parent(X,R,Y),id_idspace(X,'CL'),id_idspace(Y,'PR')" -select "p(X,R,Y)" -label -no_pred > $@

reports/cl-%.csv: cl.owl sparql/%.sparql
	arq --data $< --query sparql/$*.sparql --results csv > $@.tmp && mv $@.tmp $@

#reports/part-of-cl-to-ma.csv: cl-plus-ma-merged.owl sparql/multispecies-part-of.sparql
#	arq --data $< --query $(word 2,$^) --results csv > $@.tmp && mv $@.tmp $@

reports/direct-part-of-cl-to-ma.tsv: cl-plus-ma-merged.obo
	blip-findall -i $< "parent(C,part_of,U),id_idspace(C,'CL'),genus(A,U),id_idspace(A,'MA')" -select "p(C,U,A)" -label -use_tabs -no_pred > $@.tmp && sort -u $@.tmp > $@ && rm $@.tmp


%-merged.owl: %.owl
	owltools $(USECAT) $< --merge-imports-closure -o $@
%-merged.obo: %-merged.owl
	owltools $< -o -f obo --no-check $@

# ----------------------------------------
# EXPERIMENTAL
# ----------------------------------------

bridge/cl-bridge-to-uberon.owl: cl.owl
	owltools $< --extract-bridge-ontologies -d $* -s cl -x -o -f obo $@/no-bridge.obo
bridge/cl-bridge-to-uberon.obo: bridge/cl-bridge-to-uberon.owl
	owltools $< -o -f obo $@

# ----------------------------------------
# NIF
# ----------------------------------------

# Note: there is a distinction between NIF_Cell, an OWL Ontology that
# was part of NIFSTD, and the cell types in Neurolex.  NIF_Cell is no
# longer maintained; the cell types in Neurolex appear to have been
# seeded from NIF_Cell, with subsequent edits done on NIF_Cell.
#
# For ongoing work in translating Neurolex into OWL, see:
# https://github.com/cmungall/nlx-pl

NIF = http://ontology.neuinfo.org/NIF
NIFBM = $(NIF)/BiomaterialEntities

## A module that consists of all portions of other NIFSTD ontologies depended on by NIF-Cell
imports/nif_import.owl:
	owltools $(NIFBM)/NIF-Cell.owl $(NIF)/nif.owl --extract-module -s $(NIFBM)/NIF-Cell.owl -c --set-ontology-id $(OBO)/cl/imports/nif_import.owl -o -f ofn $@

## A rewritten version of NIF-Cell that uses the importer above
mirror/NIF-Cell.owl:
	owltools  $(NIFBM)/NIF-Cell.owl  --remove-imports-declarations --add-imports-declarations $(OBO)/cl/imports/nif_import.owl -o -f ofn $@

mirror/NIF-Cell-Merged.owl: mirror/NIF-Cell.owl
	owltools --use-catalog $< --merge-imports-closure -o -f ofn $@  

imports/nif_cell.owl: mirror/NIF-Cell-Merged.owl
	./util/fix-nif-uris.pl $< > $@.tmp && mv $@.tmp $@

neuro-cl.owl: cl-plus-nif.owl imports/nif_cell.owl
	owltools --use-catalog $< --merge-imports-closure --remove-axioms -t DisjointClasses --reasoner elk --merge-equivalence-sets -s UBERON 10 -s GO 9 -s CL 9 -s PR 8 -l UBERON 10 -l GO 9 -l CL 9 -d UBERON 10 -d GO 9 -d CL 9 --set-ontology-id $(OBO)/cl/$@ -o -f ofn $@ >& $@.LOG

# ----------------------------------------
# Legacy copy to cvs
# ----------------------------------------

CVS_DIR = ../../../obo/ontology/anatomy/cell_type/
publish_to_cvs: release re-sync
	 cd $(CVS_DIR) && cvs commit -m 'new release' cell.obo

re-sync:
	cp cl-basic.obo $(CVS_DIR)/cell.obo && cp cl-merged.obo $(CVS_DIR)/cell.edit.obo

