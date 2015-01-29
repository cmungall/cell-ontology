---
comments: true
layout: post
title: "/releases/2014-07-08/cl.owl"
date: 2014-07-08
summary: ""
categories: release
image: '/anatomy/images/u-logo.jpg'
tags:
 - release
---

# Ontology Diff Report


## Original Ontology

 * IRI: http://purl.obolibrary.org/obo/cl.owl
 * VersionIRI: http://purl.obolibrary.org/obo/cl/releases/2014-06-25/cl.owl

## New Ontology

 * IRI: http://purl.obolibrary.org/obo/cl.owl
 * VersionIRI: http://purl.obolibrary.org/obo/cl/releases/2014-07-08/cl.owl

# Report for classes


## Class objects lost from source: 0


## Class objects new in target: 9


### New Class : [quiescent skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008012)

 * [quiescent skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008012) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A skeletal muscle satellite cell that is mitotically quiescent.  Satellite cells typically remain in this state until activated following muscle damage. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:21849021 , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:23303905 } 
 * [quiescent skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008012) **SubClassOf** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594)
 * [quiescent skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008012) *[label](http://www.w3.org/2000/01/rdf-schema#label)* quiescent skeletal muscle satellite cell

### New Class : [skeletal muscle satellite stem cell](http://purl.obolibrary.org/obo/CL_0008011)

 * [skeletal muscle satellite stem cell](http://purl.obolibrary.org/obo/CL_0008011) *[label](http://www.w3.org/2000/01/rdf-schema#label)* skeletal muscle satellite stem cell
 * [skeletal muscle satellite stem cell](http://purl.obolibrary.org/obo/CL_0008011) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A skeletal muscle satellite cell that undergoes asymetric division - retaining its identity while budding off a daughter cell that differentiate into components of a skeletal muscle fiber. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:23303905 } 
 * [skeletal muscle satellite stem cell](http://purl.obolibrary.org/obo/CL_0008011) **SubClassOf** [single fate stem cell](http://purl.obolibrary.org/obo/CL_0000035)
 * [skeletal muscle satellite stem cell](http://purl.obolibrary.org/obo/CL_0008011) **SubClassOf** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594)

### New Class : [activated skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008016)

 * [activated skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008016) **SubClassOf** [develops from](http://purl.obolibrary.org/obo/RO_0002202) **some** [quiescent skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008012) { [comment](http://www.w3.org/2000/01/rdf-schema#comment)=More accurately - transformation_of ? } 
 * [activated skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008016) *[label](http://www.w3.org/2000/01/rdf-schema#label)* activated skeletal muscle satellite cell
 * [activated skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008016) **SubClassOf** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594)
 * [activated skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0008016) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A skeletal muscle cell that has become mitotically active - typically following muscle damage. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:21849021 , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:23303905 } 

### New Class : [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017)

 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [skeletal muscle tissue](http://purl.obolibrary.org/obo/UBERON_0001134)
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) **SubClassOf** [skeletal muscle myoblast](http://purl.obolibrary.org/obo/CL_0000515)
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) **SubClassOf** [develops into](http://purl.obolibrary.org/obo/RO_0002203) **some** [skeletal muscle fiber](http://purl.obolibrary.org/obo/CL_0008002)
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) **EquivalentTo** [myoblast](http://purl.obolibrary.org/obo/CL_0000056) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [skeletal muscle tissue](http://purl.obolibrary.org/obo/UBERON_0001134) **and** [develops into](http://purl.obolibrary.org/obo/RO_0002203) **some** [skeletal muscle fiber](http://purl.obolibrary.org/obo/CL_0008002)
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A skeletal muscle myoblast that is part of a skeletal mucle.  These cells are formed following acivation and division of skeletal muscle satellite cells. They form a transient population that is lost when they fuse as to form skeletal muscle fibers.
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) *[label](http://www.w3.org/2000/01/rdf-schema#label)* skeletal muscle myoblast in skeletal muscle
 * [skeletal muscle myoblast in skeletal muscle](http://purl.obolibrary.org/obo/CL_0008017) **SubClassOf** [cell of skeletal muscle](http://purl.obolibrary.org/obo/CL_0000188)

### New Class : [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018)

 * [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018) **SubClassOf** [develops into](http://purl.obolibrary.org/obo/RO_0002203) **some** [somatic muscle myotube](http://purl.obolibrary.org/obo/CL_0008003)
 * [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018) **EquivalentTo** [myoblast](http://purl.obolibrary.org/obo/CL_0000056) **and** [develops into](http://purl.obolibrary.org/obo/RO_0002203) **some** [somatic muscle myotube](http://purl.obolibrary.org/obo/CL_0008003)
 * [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018) *[label](http://www.w3.org/2000/01/rdf-schema#label)* somatic muscle myoblast
 * [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018) **SubClassOf** [myoblast](http://purl.obolibrary.org/obo/CL_0000056)
 * [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A myoblast that is commited to developing into a somatic muscle.

### New Class : [olfactory system](http://purl.obolibrary.org/obo/UBERON_0005725)

 * [olfactory system](http://purl.obolibrary.org/obo/UBERON_0005725) *[label](http://www.w3.org/2000/01/rdf-schema#label)* olfactory system
 * [olfactory system](http://purl.obolibrary.org/obo/UBERON_0005725) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A sensory system that is capable of olfacttion (the sensory perception of smell).
 * [olfactory system](http://purl.obolibrary.org/obo/UBERON_0005725) **SubClassOf** [chemosensory system](http://purl.obolibrary.org/obo/UBERON_0005726)

### New Class : [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214)

 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* utriculus (labyrinthus vestibularis) macula
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* utricle macula
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula utricle
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0001853)
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* utricular macula
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula utriculi
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of membranous labyrinth utricle
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[label](http://www.w3.org/2000/01/rdf-schema#label)* macula of utricle of membranous labyrinth
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of utricle
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of utriculus (labyrinthus vestibularis)
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* utricle of membranous labyrinth macula
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) **EquivalentTo** [macula](http://purl.obolibrary.org/obo/UBERON_0000054) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0001853)
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* The portion of the utricle which is lodged in the recess forms a sort of pouch or cul-de-sac, the floor and anterior wall of which are thickened, and form the macula of utricle (or utricular macula), which receives the utricular filaments of the vestibulocochlear nerve. [WP,unvetted].
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* macula utriculi
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* membranous labyrinth utricle macula
 * [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214) **SubClassOf** [macula](http://purl.obolibrary.org/obo/UBERON_0000054)

### New Class : [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212)

 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of membranous labyrinth saccule
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of sacculus (labyrinthus vestibularis)
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) **EquivalentTo** [macula](http://purl.obolibrary.org/obo/UBERON_0000054) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0001854)
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* The saccule is the smaller of the two vestibular sacs; it is globular in form, and lies in the recessus sphæricus near the opening of the scala vestibuli of the cochlea. Its anterior part exhibits an oval thickening, the macula of saccule (or saccular macula), to which are distributed the saccular filaments of the acoustic nerve. [WP,unvetted].
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* saccular macula
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula saccule
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0001854)
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* sacculus (labyrinthus vestibularis) macula
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) **SubClassOf** [macula](http://purl.obolibrary.org/obo/UBERON_0000054)
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula of saccule
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* macula sacculi
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* saccular maculs
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* saccule macula
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* macula sacculi
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* saccule of membranous labyrinth macula
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* saccular macula of membranous labyrinth
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[label](http://www.w3.org/2000/01/rdf-schema#label)* macula of saccule of membranous labyrinth
 * [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* membranous labyrinth saccule macula

### New Class : [null](http://purl.obolibrary.org/obo/GO_0009399)


## Changed Class objects: 33


### Changes for: [multi-potent skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355)

 * _Deleted_
    *  **-** [skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A multifate stem cell found in skeletal muscle than can differentiate into many different cell types. Distinct cell type from satellite cell. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:18282570 } 
    *  **-** [skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355) *[label](http://www.w3.org/2000/01/rdf-schema#label)* skeletal muscle stem cell
 * _Added_
    *  **+** [multi-potent skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355) *[comment](http://www.w3.org/2000/01/rdf-schema#comment)* Multi-potency demonstrated ex vivo.  At the time of writing, it is unclear whether the endogenous population differentiates into multiple cell types in vivo.
    *  **+** [multi-potent skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A multifate stem cell found in skeletal muscle than can differentiate into many different cell types, including muscle. Distinct cell type from satellite cell. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:18282570 } 
    *  **+** [multi-potent skeletal muscle stem cell](http://purl.obolibrary.org/obo/CL_0000355) *[label](http://www.w3.org/2000/01/rdf-schema#label)* multi-potent skeletal muscle stem cell

### Changes for: [principal gastric gland goblet cell](http://purl.obolibrary.org/obo/CL_1000315)

 * _Deleted_
    *  **-** [endocardial cushion cell](http://purl.obolibrary.org/obo/CL_1000315) *[label](http://www.w3.org/2000/01/rdf-schema#label)* endocardial cushion cell
 * _Added_
    *  **+** [principal gastric gland goblet cell](http://purl.obolibrary.org/obo/CL_1000315) *[label](http://www.w3.org/2000/01/rdf-schema#label)* principal gastric gland goblet cell

### Changes for: [large intestine goblet cell](http://purl.obolibrary.org/obo/CL_1000320)

 * _Deleted_
    *  **-** [axial mesoderm cell](http://purl.obolibrary.org/obo/CL_1000320) *[label](http://www.w3.org/2000/01/rdf-schema#label)* axial mesoderm cell
 * _Added_
    *  **+** [large intestine goblet cell](http://purl.obolibrary.org/obo/CL_1000320) *[label](http://www.w3.org/2000/01/rdf-schema#label)* large intestine goblet cell

### Changes for: [type 1 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000378)

 * _Deleted_
    *  **-** [type 1 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000378) **SubClassOf** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070) { [is inferred](http://www.geneontology.org/formats/oboInOwl#is_inferred)=true } 
 * _Added_
    *  **+** [type 1 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000378) **SubClassOf** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070)

### Changes for: [type 1 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000379)

 * _Added_
    *  **+** [type 1 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000379) **EquivalentTo** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214)
    *  **+** [type 1 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000379) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214)

### Changes for: [type 1 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000380)

 * _Added_
    *  **+** [type 1 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000380) **EquivalentTo** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212)
    *  **+** [type 1 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000380) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212)

### Changes for: [type 2 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000382)

 * _Deleted_
    *  **-** [type 2 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000382) **SubClassOf** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069) { [is inferred](http://www.geneontology.org/formats/oboInOwl#is_inferred)=true } 
 * _Added_
    *  **+** [type 2 vestibular sensory cell of stato-acoustic epithelium](http://purl.obolibrary.org/obo/CL_1000382) **SubClassOf** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069)

### Changes for: [type 1 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000381)

 * _Deleted_
    *  **-** [type 1 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000381) **SubClassOf** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070) { [is inferred](http://www.geneontology.org/formats/oboInOwl#is_inferred)=true } 
 * _Added_
    *  **+** [type 1 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000381) **SubClassOf** [type I vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002070)

### Changes for: [type 2 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000384)

 * _Added_
    *  **+** [type 2 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000384) **EquivalentTo** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212)
    *  **+** [type 2 vestibular sensory cell of epithelium of macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000384) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of saccule of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002212)

### Changes for: [type 2 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000383)

 * _Added_
    *  **+** [type 2 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000383) **EquivalentTo** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214)
    *  **+** [type 2 vestibular sensory cell of epithelium of macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000383) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [macula of utricle of membranous labyrinth](http://purl.obolibrary.org/obo/UBERON_0002214)

### Changes for: [type 2 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000385)

 * _Deleted_
    *  **-** [type 2 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000385) **SubClassOf** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069) { [is inferred](http://www.geneontology.org/formats/oboInOwl#is_inferred)=true } 
 * _Added_
    *  **+** [type 2 vestibular sensory cell of epithelium of crista of ampulla of semicircular duct of membranous labyrinth](http://purl.obolibrary.org/obo/CL_1000385) **SubClassOf** [type II vestibular sensory cell](http://purl.obolibrary.org/obo/CL_0002069)

### Changes for: [noradrenergic cell](http://purl.obolibrary.org/obo/CL_0000459)

 * _Deleted_
    *  **-** [norepinephrin secreting cell](http://purl.obolibrary.org/obo/CL_0000459) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* noradrenalin secreting cell
    *  **-** [norepinephrin secreting cell](http://purl.obolibrary.org/obo/CL_0000459) *[label](http://www.w3.org/2000/01/rdf-schema#label)* norepinephrin secreting cell
 * _Added_
    *  **+** [noradrenergic cell](http://purl.obolibrary.org/obo/CL_0000459) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* noradrenaline secreting cell
    *  **+** [noradrenergic cell](http://purl.obolibrary.org/obo/CL_0000459) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* norepinephrin secreting cell
    *  **+** [noradrenergic cell](http://purl.obolibrary.org/obo/CL_0000459) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* norepinephrine secreting cell
    *  **+** [noradrenergic cell](http://purl.obolibrary.org/obo/CL_0000459) *[label](http://www.w3.org/2000/01/rdf-schema#label)* noradrenergic cell

### Changes for: [compound eye retinal cell](http://purl.obolibrary.org/obo/CL_0009001)

 * _Deleted_
    *  **-** [compound eye retinal cell](http://purl.obolibrary.org/obo/CL_0009001) **SubClassOf** [somatic cell](http://purl.obolibrary.org/obo/CL_0002371)
 * _Added_
    *  **+** [compound eye retinal cell](http://purl.obolibrary.org/obo/CL_0009001) **SubClassOf** [retinal cell](http://purl.obolibrary.org/obo/CL_0009004)

### Changes for: [retinal cell](http://purl.obolibrary.org/obo/CL_0009004)

 * _Deleted_
    *  **-** [retinal cell](http://purl.obolibrary.org/obo/CL_0009004) **EquivalentTo** [cell](http://purl.obolibrary.org/obo/CL_0000000) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [retina](http://purl.obolibrary.org/obo/UBERON_0000966)
    *  **-** [retinal cell](http://purl.obolibrary.org/obo/CL_0009004) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [retina](http://purl.obolibrary.org/obo/UBERON_0000966)
 * _Added_
    *  **+** [retinal cell](http://purl.obolibrary.org/obo/CL_0009004) **EquivalentTo** [cell](http://purl.obolibrary.org/obo/GO_0005623) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [photoreceptor array](http://purl.obolibrary.org/obo/UBERON_0005388)
    *  **+** [retinal cell](http://purl.obolibrary.org/obo/CL_0009004) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [photoreceptor array](http://purl.obolibrary.org/obo/UBERON_0005388)

### Changes for: [muscle founder cell](http://purl.obolibrary.org/obo/CL_0008006)

 * _Deleted_
    *  **-** [muscle founder cell](http://purl.obolibrary.org/obo/CL_0008006) **SubClassOf** [myoblast](http://purl.obolibrary.org/obo/CL_0000056)
 * _Added_
    *  **+** [muscle founder cell](http://purl.obolibrary.org/obo/CL_0008006) **SubClassOf** [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018)

### Changes for: [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594)

 * _Deleted_
    *  **-** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594) **SubClassOf** [single fate stem cell](http://purl.obolibrary.org/obo/CL_0000035)
    *  **-** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* An elongated, spindle-shaped, quiescent myoblast that are located between the basal lamina and the plasmalemma of the muscle fibres. They are thought to play a role in muscle repair and regeneration. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GOC:tfm , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=MESH:A11.635.500.700 } 
 * _Added_
    *  **+** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [skeletal muscle tissue](http://purl.obolibrary.org/obo/UBERON_0001134)
    *  **+** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594) *[comment](http://www.w3.org/2000/01/rdf-schema#comment)* Skeletal muscle satellite cells are not traditionally referred to as myoblasts.  They are a heterogeneous population whose division, following activiation, contributes to the formation of skeletal muscle fibers and to maintenance of the satellite muscle cell population.
    *  **+** [skeletal muscle satellite cell](http://purl.obolibrary.org/obo/CL_0000594) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* An elongated, spindle-shaped, cell that is located between the basal lamina and the plasmalemma of a muscle fiber. These cells are mostly quiescent, but upon activation they divide to produce cells that generate new muscle fibers. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GOC:tfm , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=MESH:A11.635.500.700 , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:21849021 , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:23303905 } 

### Changes for: [primary sensory neuron](http://purl.obolibrary.org/obo/CL_0000531)

 * _Added_
    *  **+** [primary sensory neuron](http://purl.obolibrary.org/obo/CL_0000531) **EquivalentTo** [sensory neuron](http://purl.obolibrary.org/obo/CL_0000101) **and** [primary neuron](http://purl.obolibrary.org/obo/CL_0000530)

### Changes for: [secondary motor neuron](http://purl.obolibrary.org/obo/CL_0000536)

 * _Added_
    *  **+** [secondary motor neuron](http://purl.obolibrary.org/obo/CL_0000536) **EquivalentTo** [motor neuron](http://purl.obolibrary.org/obo/CL_0000100) **and** [secondary neuron](http://purl.obolibrary.org/obo/CL_0000535)

### Changes for: [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155)

 * _Deleted_
    *  **-** [malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) **EquivalentTo** [stellate cell](http://purl.obolibrary.org/obo/CL_0000122) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [Malpighian tubule](http://purl.obolibrary.org/obo/UBERON_0001054)
    *  **-** [malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) **SubClassOf** [stellate cell](http://purl.obolibrary.org/obo/CL_0000122)
    *  **-** [malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) *[label](http://www.w3.org/2000/01/rdf-schema#label)* malpighian tubule stellate cell
 * _Added_
    *  **+** [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) **SubClassOf** [secretory cell](http://purl.obolibrary.org/obo/CL_0000151)
    *  **+** [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) *[database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)* FBbt:00005797
    *  **+** [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A specialized epithelial secretory cell that moves chloride ions and water across the tubule epithelium. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GO:0061330 } 
    *  **+** [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* Malpighian tubule Type II cell { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=FBbt:00005797 } 
    *  **+** [Malpighian tubule stellate cell](http://purl.obolibrary.org/obo/CL_1000155) *[label](http://www.w3.org/2000/01/rdf-schema#label)* Malpighian tubule stellate cell

### Changes for: [lugaro cell](http://purl.obolibrary.org/obo/CL_0011006)

 * _Added_
    *  **+** [lugaro cell](http://purl.obolibrary.org/obo/CL_0011006) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* Lugaro cell

### Changes for: [astrocyte of the spinal cord](http://purl.obolibrary.org/obo/CL_0002606)

 * _Deleted_
    *  **-** [astrocyte of the spinal cord](http://purl.obolibrary.org/obo/CL_0002606) **SubClassOf** [spinal cord oligodendrocyte](http://purl.obolibrary.org/obo/CL_2000025)

### Changes for: [fusion competent myoblast](http://purl.obolibrary.org/obo/CL_0000621)

 * _Deleted_
    *  **-** [fusion competent myoblast](http://purl.obolibrary.org/obo/CL_0000621) **SubClassOf** [myoblast](http://purl.obolibrary.org/obo/CL_0000056)
 * _Added_
    *  **+** [fusion competent myoblast](http://purl.obolibrary.org/obo/CL_0000621) **SubClassOf** [somatic muscle myoblast](http://purl.obolibrary.org/obo/CL_0008018)

### Changes for: [precursor B cell](http://purl.obolibrary.org/obo/CL_0000817)

 * _Deleted_
    *  **-** [precursor B cell](http://purl.obolibrary.org/obo/CL_0000817) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* pre-B cell
 * _Added_
    *  **+** [precursor B cell](http://purl.obolibrary.org/obo/CL_0000817) *[comment](http://www.w3.org/2000/01/rdf-schema#comment)* Representation needs to be aligned with GO
    *  **+** [precursor B cell](http://purl.obolibrary.org/obo/CL_0000817) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* pre-B cell

### Changes for: [myoblast](http://purl.obolibrary.org/obo/CL_0000056)

 * _Deleted_
    *  **-** [myoblast](http://purl.obolibrary.org/obo/CL_0000056) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A precursor cell of the myogenic lineage that develops from the mesoderm. They undergo proliferation, migrate to their various sites, and then differentiate into the appropriate form of myocytes. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GOC:tfm , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=MESH:A11.635 } 
 * _Added_
    *  **+** [myoblast](http://purl.obolibrary.org/obo/CL_0000056) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* A cell that is commited to differentiating into a muscle cell.  Embryonic myoblasts develop from the mesoderm. They undergo proliferation, migrate to their various sites, and then differentiate into the appropriate form of myocytes.  Myoblasts also occur as transient populations of cells in muscles undergoing repair. { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GOC:tfm , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=MESH:A11.635 , [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=PMID:21849021 } 

### Changes for: [nitrogen fixing cell](http://purl.obolibrary.org/obo/CL_0000725)

 * _Added_
    *  **+** [nitrogen fixing cell](http://purl.obolibrary.org/obo/CL_0000725) **EquivalentTo** [native cell](http://purl.obolibrary.org/obo/CL_0000003) **and** [capable of](http://purl.obolibrary.org/obo/RO_0002215) **some** [http://purl.obolibrary.org/obo/GO_0009399](http://purl.obolibrary.org/obo/GO_0009399)
    *  **+** [nitrogen fixing cell](http://purl.obolibrary.org/obo/CL_0000725) **SubClassOf** [capable of](http://purl.obolibrary.org/obo/RO_0002215) **some** [http://purl.obolibrary.org/obo/GO_0009399](http://purl.obolibrary.org/obo/GO_0009399)

### Changes for: [obsolete cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026)

 * _Deleted_
    *  **-** [cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) **EquivalentTo** [Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [cerebellum](http://purl.obolibrary.org/obo/UBERON_0002037)
    *  **-** [cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) **SubClassOf** [Golgi cell](http://purl.obolibrary.org/obo/CL_0000119)
    *  **-** [cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) **SubClassOf** [cerebellar neuron](http://purl.obolibrary.org/obo/CL_1001611)
    *  **-** [cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [cerebellum](http://purl.obolibrary.org/obo/UBERON_0002037)
    *  **-** [cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) *[label](http://www.w3.org/2000/01/rdf-schema#label)* cerebellum Golgi cell
 * _Added_
    *  **+** [obsolete cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) *[deprecated](http://www.w3.org/2002/07/owl#deprecated)* true
    *  **+** [obsolete cerebellum Golgi cell](http://purl.obolibrary.org/obo/CL_2000026) *[label](http://www.w3.org/2000/01/rdf-schema#label)* obsolete cerebellum Golgi cell

### Changes for: [brain macroglial cell](http://purl.obolibrary.org/obo/CL_2000005)

 * _Deleted_
    *  **-** [brain macroglial cell](http://purl.obolibrary.org/obo/CL_2000005) **SubClassOf** [oligodendrocyte](http://purl.obolibrary.org/obo/CL_0000128)
 * _Added_
    *  **+** [brain macroglial cell](http://purl.obolibrary.org/obo/CL_2000005) **SubClassOf** [macroglial cell](http://purl.obolibrary.org/obo/CL_0000126)

### Changes for: [auditory hair cell](http://purl.obolibrary.org/obo/CL_0000202)

 * _Deleted_
    *  **-** [auditory hair cell](http://purl.obolibrary.org/obo/CL_0000202) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* inner ear hair cell { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GO:0060119 } 
    *  **-** [auditory hair cell](http://purl.obolibrary.org/obo/CL_0000202) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* inner ear receptor cell { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GO:0060119 } 
 * _Added_
    *  **+** [auditory hair cell](http://purl.obolibrary.org/obo/CL_0000202) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* inner ear hair cell { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GO:0060119 } 
    *  **+** [auditory hair cell](http://purl.obolibrary.org/obo/CL_0000202) *[has related synonym](http://www.geneontology.org/formats/oboInOwl#hasRelatedSynonym)* inner ear receptor cell { [database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)=GO:0060119 } 

### Changes for: [olfactory receptor cell](http://purl.obolibrary.org/obo/CL_0000207)

 * _Added_
    *  **+** [olfactory receptor cell](http://purl.obolibrary.org/obo/CL_0000207) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [olfactory system](http://purl.obolibrary.org/obo/UBERON_0005725)
    *  **+** [olfactory receptor cell](http://purl.obolibrary.org/obo/CL_0000207) *[database cross reference](http://www.geneontology.org/formats/oboInOwl#hasDbXref)* Wikipedia:Olfactory_receptor_neuron
    *  **+** [olfactory receptor cell](http://purl.obolibrary.org/obo/CL_0000207) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* odorant receptor cell

### Changes for: [oligodendrocyte](http://purl.obolibrary.org/obo/CL_0000128)

 * _Deleted_
    *  **-** [oligodendrocyte](http://purl.obolibrary.org/obo/CL_0000128) **EquivalentTo** [macroglial cell](http://purl.obolibrary.org/obo/CL_0000126) **and** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [central nervous system](http://purl.obolibrary.org/obo/UBERON_0001017)

### Changes for: [Purkinje cell](http://purl.obolibrary.org/obo/CL_0000121)

 * _Added_
    *  **+** [Purkinje cell](http://purl.obolibrary.org/obo/CL_0000121) **SubClassOf** [cerebellar neuron](http://purl.obolibrary.org/obo/CL_1001611)
    *  **+** [Purkinje cell](http://purl.obolibrary.org/obo/CL_0000121) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [cerebellar cortex](http://purl.obolibrary.org/obo/UBERON_0002129)

### Changes for: [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119)

 * _Deleted_
    *  **-** [Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **SubClassOf** [CNS neuron (sensu Vertebrata)](http://purl.obolibrary.org/obo/CL_0000117)
    *  **-** [Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[label](http://www.w3.org/2000/01/rdf-schema#label)* Golgi cell
 * _Added_
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **SubClassOf** [CNS interneuron](http://purl.obolibrary.org/obo/CL_0000402)
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **SubClassOf** [GABAergic interneuron](http://purl.obolibrary.org/obo/CL_0011005)
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **SubClassOf** [cerebellar neuron](http://purl.obolibrary.org/obo/CL_1001611)
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) **SubClassOf** [part of](http://purl.obolibrary.org/obo/BFO_0000050) **some** [cerebellar cortex](http://purl.obolibrary.org/obo/UBERON_0002129)
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[definition](http://purl.obolibrary.org/obo/IAO_0000115)* Large intrinsic neuron located in the granule layer of the cerebellar cortex that extends its dendrites into the molecular layer where they receive contact from parallel fibers. The axon of the Golgi cell enters ramifies densely in the granule layer and enters into a complex arrangement with mossy fiber terminals and granule cell dendrites to form the cerebellar glomerulus. Llinas, Walton and Lang. In The Synaptic Organization of the Brain. 5th ed. 2004. { [comment](http://www.w3.org/2000/01/rdf-schema#comment)=NIF_Cell:sao1415726815 } 
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* Golgi cell
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* Golgi neuron
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* cerebellar Golgi neuron
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[has exact synonym](http://www.geneontology.org/formats/oboInOwl#hasExactSynonym)* cerebellum Golgi cell
    *  **+** [cerebellar Golgi cell](http://purl.obolibrary.org/obo/CL_0000119) *[label](http://www.w3.org/2000/01/rdf-schema#label)* cerebellar Golgi cell

### Changes for: [cell of skeletal muscle](http://purl.obolibrary.org/obo/CL_0000188)

 * _Deleted_
    *  **-** [skeletal muscle cell](http://purl.obolibrary.org/obo/CL_0000188) *[label](http://www.w3.org/2000/01/rdf-schema#label)* skeletal muscle cell
 * _Added_
    *  **+** [cell of skeletal muscle](http://purl.obolibrary.org/obo/CL_0000188) *[label](http://www.w3.org/2000/01/rdf-schema#label)* cell of skeletal muscle

# Report for properties


## ObjectProperty objects lost from source: 0


## ObjectProperty objects new in target: 0


## Changed ObjectProperty objects: 0

