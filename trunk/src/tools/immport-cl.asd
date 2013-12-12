;;;; -*- Mode: LISP -*-

(in-package :asdf)

(defsystem :immport-cl
  :name "cell type curation for the Immport project"
  :author "Alan Ruttenberg"
  :components
  ((:file "merge-dougall")
   (:file "spreadsheets"))
  :depends-on (owl2 read-ms-docs))

;;;; eof
