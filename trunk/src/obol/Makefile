
cell-new.owl: ../ontology/cl-edit.owl
	owljs-obol -r cell -p label,has_exact_synonym -u -o $@ -t ofn -C cfg_cl.js -m anatomy $< > $@.LOG

cell-gen.owl: ../ontology/cl-edit.owl
	owljs-obol -F "whole" -R "part of whole" -r cell -p label,has_exact_synonym -u -o $@ -t ofn -C cfg_cl_uberon.js -m anatomy $< > $@.LOG

neuron-new.owl: ../ontology/cl-edit.owl
	owljs-obol -r neuron -p label,has_exact_synonym -u -o $@ -t ofn -C cfg_cl_uberon.js -m anatomy $< > $@.LOG

neuron-gen.owl: ../ontology/cl-edit.owl
	owljs-obol -F "whole" -R "part of whole" -r neuron -p label,has_exact_synonym -u -o $@ -t ofn -C cfg_cl_uberon.js -m anatomy $< > $@.LOG

neuron-zfa.owl: ../ontology/cl-plus-zfa.owl
	owljs-obol -u -r neuron -o $@ -t ofn -C cfg_cl.js -m equiv $< > $@.LOG

cell-zfa.owl: ../ontology/cl-plus-zfa.owl
	owljs-obol -u -r cell -o $@ -t ofn -C cfg_cl.js -m equiv $< > $@.LOG


all.owl: ../ontology/cl-edit.owl
	owljs-obol -u -o $@ -t ofn -C cfg_cl.js -m anatomy $< > $@.LOG

%.obo: %.owl
	owltools --catalog-xml ../ontology/catalog-v001.xml $< ../ontology/cl-edit.owl -o -f obo $@
