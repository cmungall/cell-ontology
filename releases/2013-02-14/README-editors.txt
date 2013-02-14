
Setting up: Obtain ontology from svn (one time only):

See instructions here:
https://code.google.com/p/cell-ontology/source/checkout

  svn checkout https://cell-ontology.googlecode.com/svn/trunk/ cell-ontology --username <USERNAME>

Set up your ID ranges in OBO-Edit. See cl-idranges.owl

Step 1: Preparing to edit

  cd cell-ontology/src/ontology/
  svn update

Step 2: Edit the ontology in oboedit and save

  Open: 

     cl-edit.obo

  **do not edit any other files!!!**

Step 3: Commit your changes

  svn commit -m "COMMIT MESSAGE" cl-edit.obo

Step 4: Make a release (OPTIONAL)

  For now:

   make release
   svn commit

 Note this is the responsibility of the release manager


