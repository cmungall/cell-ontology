OBO=http://purl.obolibrary.org/obo

release: cl.obo cl.owl cl-basic.obo cl-basic.owl

# PR mireots CHEBI, but is not always in sync, which causes problems for Oort (e.g. different defs in two version).
# only use core PR info
# (todo: make thispart of Oort)
#extsubset/pr-core.obo: extsubset/pr.obo
#	obo-grep.pl  -r 'id: PR:' $< > $@
extsubset/pr-simple.obo:
	cd extsubset && ontology-release-runner --force --no-subsets --reasoner elk --simple  http://purl.obolibrary.org/obo/pr.obo
#	wget $(OBO)/pr.obo -O $@

build/cl.obo: cl-edit.obo
	ontology-release-runner --outdir build --no-subsets --allow-overwrite --repair-cardinality --reasoner elk --asserted --simple --re-mireot $< $(OBO)/uberon/basic.owl $(OBO)/go.owl $(OBO)/pato.owl extsubset/chebi_lite.obo extsubset/pr-simple.obo
#	ontology-release-runner --outdir releases --reasoner elk --asserted --simple --re-mireot --allow-overwrite --prefix $(OBO)/CL_ --prefix $(OBO)/CP_ cl-edit.obo $(OBO)/uberon/basic.owl pr-core.obo $(OBO)/go.owl $(OBO)/pato.owl chebi_lite.obo
.PRECIOUS: build/cl.obo

cl.obo: build/cl.obo
	../tools/fix-synsubsetdef.pl $< > $@.tmp && mv $@.tmp $@

cl.owl: build/cl.owl
	cp $< $@

cl-basic.obo: build/cl-simple.obo
	../tools/fix-synsubsetdef.pl $< > $@.tmp && mv $@.tmp $@

cl-basic.owl: build/cl-simple.owl
	cp $< $@

cl-edit.owl: cl-edit.obo
	obolib-obo2owl -o $@ $<


bridge/cl-bridge-to-uberon.obo: cl.obo
	blip-findall -i $< "parent(X,part_of,Y),id_idspace(X,'CL'),id_idspace(Y,'UBERON')" -select X-Y -label -use_tabs -no_pred | sort -u | tbl2obolinks.pl --rel part_of - > $@.tmp && cat $@.tmp part_of.obo > $@
bridge/cl-bridge-to-%.owl: bridge/cl-bridge-to-%.obo
	owltools $< -o file://`pwd`/$@

fix-%: %
	../tools/fix-synsubsetdef.pl $< > $@.tmp && mv $@.tmp $@

# ----------------------------------------
# Legacy copy to cvs
# ----------------------------------------

CVS_DIR = ../../../obo/ontology/anatomy/cell_type/
publish_to_cvs: release re-sync
	 cd $(CVS_DIR) && cvs commit -m 'new release' cell.obo

re-sync:
	cp cl-basic.obo $(CVS_DIR)/cell.obo && cp cl-merged.obo $(CVS_DIR)/cell.edit.obo

# ----------------------------------------
# Sync with main repo in CVS (temporary)
# ----------------------------------------

# the primary editors version
# (todo - make this live) DONE!!
#cl-edit.obo:
#	wget http://obo.cvs.sourceforge.net/viewvc/obo/obo/ontology/anatomy/cell_type/cell.edit.obo -O $@ && perl -i ../tools/fix-obo-header.pl cl-edit.obo $@
#	cp cell.edit.obo $@
