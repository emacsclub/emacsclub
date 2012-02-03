
;;;; This collection of files will attempt to re-implement the
;;;; tutorial provided by nodebeginner.org in elisp

;;; The http stack is implemented in the elnode package

(require 'elnode)

;;; We'll start the server module with elnode-start
;;; specifying the handler, port, and address range

(elnode-start 
 
 ;; The handler will be anonymous this time
 (lambda (httpcon)
   
   ;; First, the response header is written
   (elnode-http-start 
    httpcon 
    "200" 
    ;; Note how this argument is given in dotted Pair notation
    '("Content-type" . "text/html"))
   
   ;; Second, write the text of the document to the connection
   (elnode-http-return 
    httpcon
    "<html><h1>HEADER</h1><p>Paragraph.</p></html>"))
 
 8080 
 "0.0.0.0")


;;; Just like in node, program control continues,
;;; but the server continues to wait on the event loop

(elnode-error "Server started")
