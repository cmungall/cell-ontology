OBO=http://purl.obolibrary.org/obo
USECAT= --catalog-xml catalog-v001.xml

all: release

release: cl.obo cl.owl cl-basic.obo cl-basic.owl diff

# ----------------------------------------
# BUILD
# ----------------------------------------

build/cl.owl: cl-edit.owl
	ontology-release-runner $(USECAT) --repair-cardinality --outdir build --no-subsets --allow-overwrite --ignoreLock --reasoner elk --asserted --simple $<
cl.owl: build/cl.owl
	cp $< $@
cl.obo: build/cl.owl
	owltools $(USECAT) $< --merge-imports-closure -o -f obo $@
cl-basic.obo: build/cl-simple.obo
	cp $< $@
cl-basic.owl: build/cl-simple.owl
	cp $< $@

# ----------------------------------------
# Regenerate imports
# ----------------------------------------

CL_IMPORTS_BASE_URI = $(OBO)/cl/imports
IMPORTS = pato uberon chebi pr go

all_imports: $(patsubst %, imports/%_import.owl,$(IMPORTS))
t: 
	echo $(patsubst %, imports/%_import.owl,$(IMPORTS))

imports/%_import.owl: cl-edit.owl mirror/%.owl
	owltools  $(USECAT) --map-ontology-iri $(CL_IMPORTS_BASE_URI)/$*_import.owl mirror/$*.owl $<  --extract-module -s $(OBO)/$*.owl -c --extract-mingraph --make-subset-by-properties  BFO:0000050 BFO:0000051 RO:0002202 immediate_transformation_of --set-ontology-id $(CL_IMPORTS_BASE_URI)/$@ -o file://`pwd`/$@

# clone remote ontology locally
mirror/%.owl:
	wget $(OBO)/$*.owl -O $@

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

