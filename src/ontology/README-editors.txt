PRE-EDIT CHECKLIST
------------------

Do you have an ID range in the idranges file (cl-idranges.owl),
in this directory). If not, get one from the head curator.

Ensure that you have Protege configured to generate new IRIs in your
own range. Note that if you edit multiple files, you need to check this every time to ensure that the proper settings are in place.

A word of caution about protege auto-id functionality. Protege will allow reuse of a URI in your range according to the numbering scheme. It will keep track of what you did during last session, but *does not check* for use of the URI before assigning it (doh!!). Therefore, if you added any IDs in your range prior to the switch to OWL, protege will not know not to start from the beginning. Some tips to check to see where you are in your range: Go to the view menu, click "render by label (rdf:id)", and then use the search box to search for things starting within your range, such as CL_0007 for Melissa's range. If you have IDs in your range already, you may wish to set Protege at the next unused ID in your range rather than the beginning of the range. It should then remember it for next time, though you should double check.

(You can ignore this if you do not intend to create new classes)

Get Jim's awesome obsolescence plugin here:
https://github.com/balhoff/obo-actions/downloads
To add plugins to Protege, navigate to the application, open the application contents, navigate to contents/Resources/Java/plugins and put the jar file in there. Your plugin should be installed next time you start protege.

Get Elk here:
http://code.google.com/p/elk-reasoner/downloads/list
perform same operation as above to install.

Setting up: Obtain ontology from svn (one time only):

See instructions here:
https://code.google.com/p/cell-ontology/source/checkout

  svn checkout https://cell-ontology.googlecode.com/svn/trunk/ cell-ontology --username <USERNAME>


GETTING STARTED
---------------

Always start by doing:

Email google group at cl_edit@googlegroups.com to lock the files  
Example  “[LOCKING] cl-edit..owl for editing”

svn update

Then, open the file cl-edit.owl in Protege

NOTE: If you get an error in the opening that says "org.xml.sax.SAXParseException: XML document structures must start and end within the same entity." this is an error in reading files from SourceForge. Don't worry about it, just simply wait a few minutes and try again with a fresh opening of Protege.

Switch on the Elk reasoner (see how to get plugins above). If you are making changes, be sure to
synchronize the reasoner.

Edit the ontology in protege:

Find parent term in Protégé by searching (at top of screen)
Double check that term is not already there
Add subclass
Add label (URI should be auto-generated)
Under annotations, add definition, click OK
Annotation on definition (see below)
database_cross_reference
GOC:initials
Under annotations, add synonyms, if necessary (has_exact_synonym, etc)

Save

**do not edit any other files!!!**

Commit your changes

  svn commit -m "COMMIT MESSAGE" cl-edit.owl


OBSOLETING
---------------

1. Find the  class you wish to obsolete, and compare it with the class you wish to replace (or consider) it with. You need to check that both the text definition and the logical axioms have the same intent, and that nothing desired is lost in the obsolescence.

2. Copy any subClass axioms that you intend to keep for historical purposes (e.g. those that are not replicated on the target class) into a comment annotation property. If you do this, please ensure to add to any exisiting comments rather than adding a new COMMENT. There can be only one COMMENT in obo format and Jenkins will throw an error. If there are equivalence axioms, you may wish to consult with an expert to make sure the axioms are retained properly in the file.

3. Go to the obsolescenc plugin by going to the edit menu and scroll to the bottom, to "Make Entity Obsolete". This will perform the following for you:
	Relabel the class as "obsolete your old term label here". 
	Add an annotation property, "deprecated", value "true", of type "boolean". 
	Delete subClassOf axioms
You should see the class crossed out after you do this. 

4. Add an annotation property "term replaced by". Navigate to the term by clicking on the "entity IRI" and either browse or control F to find the term that is replacing the one being obsoleted.

6. You may wish to add a comment regarding the reason for obsolescence or so as to include reference to why the term was replaced with whatever is indicated. Again, do not add more than one comment annotation on a class.

ABOUT DEFINITION CITATIONS AND DBXREFS
---------------
In order to properly display definition sources, you should add citations to the end of the definition text (make sure string is chosen in the bottom left type selector). Some examples include:
definition "Paired long bones of endochondral origin that extend from the pectoral girdle to the elbows[AAO, modified]."^^string
definition "The major postaxial endochondral bone in the posterior zeugopod[Phenoscape]."^^string
definition "Paired cartilaginous element forming the posterior portion of the pelvic girdle. [D.F. Markle, BULLETIN OF MARINE SCIENCE. 30(1): 45-53. 1980]"^^string
definition "A midventral endochondral skeletal element which represents the origin site of the pectoral muscles[PHENOSCAPE:ad]."^^string

Note that this is *different* than making a dbxref. The dbxref field should be used only for xref to another ontology class, database ID, or URL. dbxrefs can be made on the definition as an annotation on the definition or on the class directly, depending on the nature of the xref. To make an annotation on the definition, click the little "a" symbol (this works similarly on any axiom or annotation).

SEARCHING BY URI
----------------
To view IDs instead of labels:
View -> Render by name (rdf: id)
search for ID
View -> Render by label
click on parent in description
click back button to get back to your term
(stupid, eh?)

SAVING and COMMITTING
---------------

Save and commit regularly. Always describe the changes you have made
at a high level in the svn commit messages. It is a good idea to type
"svn diff" before committing (although the output can be hard to
decipher, it can sometimes show you egregious errors, sometimes Protege's fault).

**Important: make sure you save in functional syntax, using the same
  prefixes as in the source file. This SHOULD be automatic (but Protege sometimes gets it wrong - one reason to do the diff).
  
**Important: there is currently a bug in Protege that is being investigated (well, there are many, but this one concerns editing ext). If protege asks you to name your merged file when you save and gives you no other option, DON'T DO IT. Quit Protege and start over. You will lose your work - another reason to save and commit in small increments. 

Example session from view of command line:

  svn update
  # [open in protege]
  # [edit in Protege]
  # [save in Protege]
  # ...
  # [edit in Protege]
  # [save in Protege]
  svn diff cl-edit.owl
  svn commit -m "polished up skull" cl-edit.owl
  svn update

It is always a good idea to svn update immediately after an svn
commit. If there are changes, Protege will ask you to reload. You may wish not to trust the reload and simply reopen Protege.

After an svn commit, Jenkins will check your changes to make sure they
conform to guidelines and do not introduce any inconsistencies - an
email will be sent to the curators list.

You can check on the build here:
  http://build.berkeleybop.org/job/build-cl/
  
Check for errors in the report, send an email to curators if you cannot determine what the error is.

CHECKLIST
---------

Always synchronize the reasoner before committing. Did your changes
introduce unsatisfiable classes? If so, investigate them.

For any classes you have created, are they in your ID range? Did you
add text definitions, adding provenance information? Is the reasoner finding unintended inferred equivalent classes? Subclasses? 

Check the jenkins report after your commits. This should alert you to
any of the following:

 * consistency problems with anatomy ontologies
 * consistency problems with other ontologies
 * violation of obo-format (e.g. two labels for a class; two text
   definitions; etc)


Test-CVS
testing-ymb