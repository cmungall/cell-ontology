;; Code to check and incorporate work by David Dougall for the Immport
;; project. We'll primarily work with one of the files he created:
;; immport_phenotype_v1.3.xlsx , which we need to interpret and
;; translate into assertions for incorporation into the cell ontology.

;; object to hold everything

(defclass dougall-merge () 
  ((cell-ontology :accessor cell-ontology )
   (gene-ontology :accessor gene-ontology )
   (chebi-ontology :accessor chebi-ontology)
   (pro-ontology :accessor pro-ontology  )
   (phenotype-workbook :accessor phenotype-workbook)
   (transcription-factor-workbook :accessor transcription-factor-workbook)
   (cytokine-workbook :accessor cytokine-workbook)
   (subclass-lookup-cache :accessor subclass-lookup-cache :initform (make-hash-table) :allocation :class)
   ))

(defun load-ontology-local-or-cache (name)
  (let ((cached-path (namestring (merge-pathnames
				  *ontology-cache*
				  (make-pathname :name (string-downcase (string name)) :type "owl")))))
    (if (probe-file cached-path)
	(load-ontology cached-path)
	(progn 
	  (save-ontology-and-imports-locally (obolibrary-ontology-iri name) *ontology-cache* :wget-command *wget-command*)
	  (load-ontology cached-path)))))

(defmethod initialize-instance ((m dougall-merge) &key)
  (setf (cell-ontology m) (load-ontology-local-or-cache 'cl))
  (make-instance 'label-source :key :cl :sources (list (cell-ontology m)))
  (setf (phenotype-workbook m) (get-dougall-phenotype-sheet))
  (setf (transcription-factor-workbook m) (get-diehl-transcription-factors-sheet))
  (setf (cytokine-workbook m) (get-diehl-cytokines-sheet))
;  (run-reasoner m)
  )

(defmethod cache-subclass-lookup ((m dougall-merge) key term-iri)
  (unless (gethash key (subclass-lookup-cache m))
    (let ((table (make-hash-table)))
      (loop for sub in  (sparql `(:select (?subclass) ()
					  (?subclass !rdfs:subClassOf ,term-iri))
				:endpoint *obo-sparql-endpoint* :flatten t)
	 do (setf (gethash sub table) t))
      (setf (gethash key (subclass-lookup-cache m)) table))))
	
(defmethod cache-subclasses ((m dougall-merge))
  (cache-subclass-lookup m :biological-process !obo:GO_0008150)
  (cache-subclass-lookup m :molecular-function !obo:GO_0003674)
  (cache-subclass-lookup m :cellular-component !obo:GO_0006928)
  (cache-subclass-lookup m :amino-acid-chain !obo:PR_000018263)
  (cache-subclass-lookup m :molecular-entity !obo:CHEBI_23367)
  (cache-subclass-lookup m :polynucleotide !obo:CHEBI_15986) 
  (cache-subclass-lookup m :complex !obo:GO_0032991) 
  )

(defmethod top-entity-type ((m dougall-merge) term-iri)
  (maphash (lambda(type table)
	     (when (member type '(:biological-process :molecular-function :cellular-component
				  :amino-acid-chain :molecular-entity :polynucleotide))
	     (when (gethash term-iri table)
	       (return-from top-entity-type type))))))

(defmethod run-reasoner ((m dougall-merge) &key which)
  (instantiate-reasoner (cell-ontology m) :hermit)
  (check-ontology (cell-ontology m) :classify t)
  )

;(setq m (make-instance 'dougall-merge))

(defmacro each-dougall-row (spreadsheet &body body)
  (let  ((spreadsheet-sym (make-symbol "spreadsheet")))
    `(let* ((,spreadsheet-sym ,spreadsheet)
	    (rows (sheet-rows (first (parsed-sheets (workbook m)))))
	    (marked (make-hash-table)))
       (labels ((column (label row) 
		  (let ((raw (second (assoc label row))))
		    (if (and (listp raw) (eq (first raw) :with-style))
			(second raw)
			raw)))
		(to-iri (id)
		  (make-uri nil (concatenate 'string "obo:" (#"replaceFirst" id ":" "_"))))
		(seen (thing)
		  (or (gethash thing marked) (progn (setf (gethash thing marked) t) nil)))
		(sanity-check (rowcount row )
		  (or (and (column :cl_id row) (column :term_id row))
		      (when (some 'second (cddr row)) ; only complain if something isn't
					; nil, otherwise be silent about blank row.
			(warn "Something amiss in row ~a: ~a" rowcount row)
			nil)
		      nil)))
	 (loop with cell-ontology = (cell-ontology m)
	    for row in rows
	    for rowcount from 1
	    do
	    ,@body
	    )))))

(defmethod entity-statistics ((m dougall-merge))
  (let ((already-have 0)
	(dont-have  0)
	cell-type-id second-entity-id cell-type-iri second-entity-iri)
    (each-dougall-row (workbook m)
      (when (sanity-check rowcount row)
	(setq cell-type-iri (to-iri (column :CL_ID row))
	      second-entity-iri  (to-iri (column :TERM_ID row)))
	(if (not (seen second-entity-iri))
	    (if (get-entity second-entity-iri :class cell-ontology)
		(incf already-have)
		(incf dont-have)))))
    (format t "~a entities were already mentioned in CL, ~a entities have not yet.~%"  already-have dont-have)))

(defmethod classify-for-assertions ((m dougall-merge))
  (let ((biological-process !obo:GO_0008150)
	(cl (cell-ontology m))
	(go (gene-ontology m))
	(pro (pro-ontology m)))
    (each-dougall-row (workbook m)
      (when (sanity-check rowcount row)
	(let ((second-entity-iri (to-iri (column :TERM_ID row))))
	  (princ ".")
	  (unless (seen second-entity-iri)
	    (cond ((equalp (column :sub_category row) "GO")
		   (unless (is-subclass-of? second-entity-iri biological-process go)
		     (warn "In row ~a, ~a(~a) is not a process even though it is listed as sub_category GO"
			   rowcount (column :term_name row) (column :TERM_ID row)))))))))))

;;		  ((and  (equalp (column :sub_category row) "surface marker"))

;; !obo:CHEBI_36080 biological macromolecule
;; !obo:CHEBI_16541 protein polypetide chain
;; CHEBI:24433 group
;; CHEBI:24431 chemical entity

;;  !obo:PR_000000001 !obo:GO_0032991  !obo:PR_000018263

;; 		   (unless (or (is-subclass-of? second-entity-iri !obo:PR_000018263 pro-ontology)
;; 			       (is-subclass-of? second-entity-iri !obo:GO_0032991 go-ontology)
;; 					;(is-subclass-of? second-entity-iri (protein-or-complex-expression) chebi-ontology))
;; 			       (warn "In row ~a, ~a(~a) is not a protein or complex even though it is listed as a surface marker"
;; 				     rowcount (column :term_name row) (column :TERM_ID row))))))))))))
      


(defmethod check-for-satisfiability ((m dougall-merge))
  (each-dougall-row (workbook m)
    (when (sanity-check rowcount row)
      (let ((cell-type-iri (to-iri cell-type-id (column :CL_ID row)))
	    (second-entity-iri  (to-iri (column :TERM_ID row)))
	    (category (column :sub_category row)))
	(let ((expression (dougall-assertion-for m category cell-type-iri second-entity-iri :justifiable)))
	  (unless (satisfiable? expression cell-ontology)
	    (format t "row ~a, asserting ~s about ~a isn't satisfiable!"
		    rowcount expression (entity-label cell-type-iri cell-ontology ))))))))

(defmethod expression-level-categories ((m dougall-merge))
  (let ((them nil))
    (each-dougall-row (workbook m)
      (pushnew (column :expression_level row) them :test 'equalp))
    (remove nil them)))

#|
Here's where the "business logic" is we need to know whether the term represents a
protein or complex, another molecule, a process.

The justifiable assertions are:

If :it's category is transcription factor and type is protein or complex 
   cell has_part :it
   :it bears (nucleic acid binding transcription factor activity OR protein-binding transcription factor activity)

If :it's category is GO and type is process then 
   cell capable_of :it 

If :it's category is cytokine and type is protein or complex
   cell has_part :it

If :it's category is surface marker and type is protein or complex
    if expression_level is "low" "low/negative" "negative/low"  -> has low plasma membrane amount :it
      cell has low plasma membrane amount :it
    if  expression_level is high
      cell has high plasma membrane amount :it
    if expression_level is negative
      cell lacks plasma membrane part :it
    if expression_level is positive 
      cell has plasma membrane part :it
|#

(defun protein-or-complex-expression ()
  '(object-union-of !obo:CHEBI_36080 !obo:PR_000000001 !obo:GO_0032991 !obo:CHEBI_16541 !obo:PR_000018263))

;; ; elk doesn't like union of - would rather sequentially check each and then do an or
;; CHEBI:24431 - Chemical entity (not a protein)
;; PR:000000001 - Protein
;; GO:0032991 - macromolecular complex
;; CHEBI:16541 protein polypeptide chain
;; PR:000018263 - amino acid chain



(defmethod dougall-assertion-for-category ((m dougall-merge) category expression
					   cell-type-iri second-entity-iri (strength (eql :justifiable)))
  (flet ((to-iri (id)
	   (make-uri nil (concatenate 'string "obo:" (#"replaceFirst" id ":" "_")))))
    (cond ((and (equalp category "go")
	   `(object-some-values-from !'capable_of'@cl second-entity-iri)))
	  ((and (equalp category "surface marker")
		(member expression '("low" "low/negative" "negative/low") :test 'equalp))
	   `(object-some-values-from !'has_low_plasma_membrane_amount'@cl second-entity-iri))
	  ((and (equalp category "surface marker")
		(member expression '("high") :test 'equalp))
	   `(object-some-values-from !'has_high_plasma_membrane_amount'@cl second-entity-iri))
	  ((and (equalp category "cytokine")
		`(object-some-values-from !'has_part'@cl second-entity-iri))))))

	  ;; "high" -> has high plasma membrane amount

	  

;; report

;; is the entity not already present - then new
;; if present do we know what the assertion is?
;; If we know assertion 
;;    is the cell type subclass of it?
;;    how many other cell types are it true of
;;    is it true of any of the superclasses?
;;    is it directly asserted?
;; if we don't know the assertion, but we know what it doesn't mean, is something we mean entailed?


;; extra assertions

;; cytokines are only proteins
;; peroxidases are not cytokines

;; "low/negative" -> has low plasma membrane amount
;; "negative/low" -> has low plasma membrane amount
;; "low"  -> has low plasma membrane amount
;; "high" -> has high plasma membrane amount
;; "positive" -> lacks plasma membrane part
;; "negative" -> has plasma membrane part


;; neither  has plasma membrane part
;; nor lacks plasma membrane part

;; "subset"
;; "small subset"
;; "positivenegativeactivated" 
;; "negative/positive"
;; "positive/negative"
;; "negative/subset" 
;; "MM"

