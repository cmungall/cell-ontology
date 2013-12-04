cl ontology repository
======================

To find out more, visit

 * The website - http://cellontology.org
 * The google code site - http://cell-ontology.googlecode.com

ontology/
  cl           Core public ontology release
                * pre-reasoned
                * subsets of external ontologies MIREOTed in

  cl-basic     Simple basic version of the ontology
                * pre-reasoned
                * NO external ontology terms and all inter-ontology links REMOVED

               Note that cl-basic.obo corresponds exactly with
               cell.obo in obo sourceforge CVS.

  cl-edit      Editors version of the ontology
               Currently this corresponds to the primary cell.edit.obo in obo sourceforge CVS
                * NOT pre-reasoned
                * subsets of external ontologies MIREOTed in

Note that .obo and .owl files are provided for each alternate
version. These should be semantically equivalent, and use the new
obo2owl translation

URLs
====

The following URLs should be used for the two release versions:

http://purl.obolibrary.org/obo/cl.owl
http://purl.obolibrary.org/obo/cl.obo
http://purl.obolibrary.org/obo/cl-basic.owl
http://purl.obolibrary.org/obo/cl-basic.obo

RUNNING THE RELEASE PIPELINE
============================

You will need:

* obo-scripts
  http://github.com/cmungall/obo-scripts

  make sure the directory is in your PATH. E.g. if you cloned the above repo in your home dir, do this:

  export PATH="$PATH:$HOME/obo-scripts/"

  or for some shells:

  setenv PATH "$PATH:$HOME/obo-scripts/"

* obo2obo
  available as part of the OboEdit distribution.
  On OS X this will be in your Applications dir, so you would type:

  export PATH="$PATH:/Applications/OBO-Edit2"


