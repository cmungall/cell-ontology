(defclass dougall-book (parsed-book))

(defclass dougall-phenotype-book (dougall-book))
(defclass diehl-term-curation-book (dougall-book))

(defclass dougall-phenotype-block (parsed-block))
(defclass diehl-term-curation-block (parsed-block))

(defmethod block-headers ((foo (eql 'dougall-phenotype-block)))
  '("CL_id" "term_id" "term_name" "expression_level" "sub_category" "phenotype" "References" "Method"))

(defmethod block-types ((b dougall-phenotype-book))
  `((dougall-phenotype-block ,(block-headers 'dougall-phenotype-block))))

(defmethod block-headers ((foo (eql 'diehl-term-curation-block)))
  '("term_id" "term_name" "display_name" "sub_category" "true transcription factor" "Notes"))

(defmethod block-types ((b diehl-term-curation-book))
  `((diehl-term-curation-block ,(block-headers 'diehl-term-curation-block))))

(defun get-dougall-phenotype-sheet ()
  (let ((book (make-instance 'dougall-phenotype-book
			     :book-path  *dougall-phenotype-book-path*)))
    (parse-book book 'dougall-phenotype-block)
    book))

(defun get-diehl-transcription-factors-sheet ()
  (let ((book (make-instance 'diehl-term-curation-book
			     :book-path  *diehl-curated-transcription-factor-book-path*)))
    (parse-book book 'diehl-term-curation-block)
    book))

(defun get-diehl-cytokines-sheet ()
  (let ((book (make-instance 'diehl-term-curation-book
			     :book-path  *diehl-curated-cytokines-book-path*)))
    (parse-book book 'diehl-term-curation-block)
    book))
  
(defmethod parse-book ((book dougall-book) type &key &allow-other-keys )
  (destructuring-bind (sheet-name java-sheet) (car (list-sheets :file (book-path book)))
    (let ((sheet (make-instance 'parsed-sheet
				:sheet-rows (get-sheet java-sheet sheet-name :with-style? t)
				:sheet-book book
				:sheet-name sheet-name
				:java-sheet java-sheet)))
      (setf (parsed-sheets book) (list sheet))
      (let ((block (make-instance
		    'dougall-phenotype-block
		    :in-sheet sheet :first-row 2
		    :start-column 1
		    :end-column (1- (length (block-headers type)))
		    :block-rows (sheet-rows sheet))))
	(setf (parsed-blocks sheet)
	      (list block))
	(setf (parsed-blocks book) (parsed-blocks sheet))))))
