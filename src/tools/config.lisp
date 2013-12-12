;; override these for your environment

(defvar *cell-ontology-trunk* "/Users/alanr/repos/cell-ontology/trunk/")
(defvar *ontology-cache* "/Users/alanr/desktop/ontology-cache/")
(defvar *wget-command* "/sw/bin/wget")
(defvar *obo-sparql-endpoint* "http://sparql.obodev.neurocommons.org/sparql")

(defun obolibrary-ontology-iri (namespace)
  (format nil "http://purl.obolibrary.org/obo/~a.owl" (string-downcase (string namespace))))

;;; These are derived

(defvar *dougall-work-dir*
  (merge-pathnames
   (make-pathname :directory '(:relative "doc" "dave-dougall-immport")
		  :type "xlsx")
   *cell-ontology-trunk*))

(defvar *dougall-phenotype-book-path*
  (merge-pathnames "immport_phenotype_v1.3.xlsx" *dougall-work-dir*))

(defvar *diehl-curated-transcription-factor-book-path*
  (merge-pathnames "diehl_transcription_factors_curated.xlsx"
   *dougall-work-dir*))

(defvar *diehl-curated-cytokines-book-path*
  (merge-pathnames "diehl_cytokines_curated.xlsx"
		   *dougall-work-dir*))







