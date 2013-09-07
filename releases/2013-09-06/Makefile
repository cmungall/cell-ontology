OBO=http://purl.obolibrary.org/obo
USECAT= --catalog-xml catalog-v001.xml

all: release

release: cl.obo cl.owl cl-basic.obo cl-basic.owl cl-obocheck cl-basic-obocheck diff

# ----------------------------------------
# BUILD
# ----------------------------------------

# This is a standard OORT build
# We add a custom step to unfold the import closure in the obo version, because obo does not handle imports well

# TODO: allow-equivalent-pairs is there for the CL:cell vs GO:cell
build/cl.owl: cl-edit.owl
	ontology-release-runner $(USECAT) --allow-equivalent-pairs --repair-cardinality --outdir build --no-subsets --allow-overwrite --ignoreLock --reasoner elk --asserted --simple $<
cl.owl: build/cl.owl
	cp $< $@
cl.obo: build/cl.owl
	owltools $(USECAT) $< --merge-imports-closure -o -f obo $@
cl-basic.owl: build/cl-simple.owl
	owltools $< --set-ontology-id $(OBO)/cl/$@ -o $@
cl-basic.obo: cl-basic.owl
	owltools $< -o -f obo $@

%-obocheck: %.obo
	obo2obo $< -o $@

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
CL_IMPORTS_BASE_URI = $(OBO)/cl/imports

# Ontology dependencies
# We don't include clo, as this is currently not working
IMPORTS = pato uberon chebi pr go

# Make this target to regenerate ALL
all_imports: $(patsubst %, imports/%_import.owl,$(IMPORTS))

KEEPRELS = BFO:0000050 BFO:0000051 RO:0002202 immediate_transformation_of

# Create an import module using the OWLAPI module extraction code via OWLTools.
# We use the standard catalog, but rewrite the import to X to be a local mirror of ALL of X.
# After extraction, we further reduce the ontology by creating a "mingraph" (removes all annotations except label) and by 
imports/%_import.owl: cl-edit.owl mirror/%.owl
	owltools  $(USECAT) --map-ontology-iri $(CL_IMPORTS_BASE_URI)/$*_import.owl mirror/$*.owl $<  --extract-module -s $(OBO)/$*.owl -c --remove-axiom-annotations --make-subset-by-properties $(KEEPRELS) --set-ontology-id $(CL_IMPORTS_BASE_URI)/$@ -o file://`pwd`/$@

# clone remote ontology locally, perfoming some excision of relations and annotations
mirror/%.owl:
	owltools $(OBO)/$*.owl --remove-annotation-assertions -l --remove-dangling-annotations --make-subset-by-properties $(KEEPRELS) --set-ontology-id $(OBO)/$*.owl -o $@
mirror/uberon.owl:
	owltools $(OBO)/uberon/basic.owl --remove-annotation-assertions -l --remove-dangling-annotations --make-subset-by-properties $(KEEPRELS) --set-ontology-id $(OBO)/uberon.owl -o $@
mirror/pr.obo:
	wget $(OBO)/pr.obo -O $@.tmp && obo-grep.pl -r 'id: PR:' $@.tmp > $@
mirror/pr.owl: mirror/pr.obo
	owltools $< --remove-dangling --set-ontology-id $(OBO)/pr.owl -o $@
mirror/clo.owl:
	owltools $(OBO)/clo.owl --remove-imports-declarations --set-ontology-id $(OBO)/clo.owl -o $@
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

cl-to-pr.txt: cl.obo
	blip-findall -i $< "parent(X,R,Y),id_idspace(X,'CL'),id_idspace(Y,'PR')" -select "p(X,R,Y)" -label -no_pred > $@

# ----------------------------------------
# EXPERIMENTAL
# ----------------------------------------

bridge/cl-bridge-to-uberon.owl: cl.owl
	owltools $< --extract-bridge-ontologies -d $* -s cl -x -o -f obo $@/no-bridge.obo
bridge/cl-bridge-to-uberon.obo: bridge/cl-bridge-to-uberon.owl
	owltools $< -o -f obo $@

# ----------------------------------------
# Legacy copy to cvs
# ----------------------------------------

CVS_DIR = ../../../obo/ontology/anatomy/cell_type/
publish_to_cvs: release re-sync
	 cd $(CVS_DIR) && cvs commit -m 'new release' cell.obo

re-sync:
	cp cl-basic.obo $(CVS_DIR)/cell.obo && cp cl-merged.obo $(CVS_DIR)/cell.edit.obo

