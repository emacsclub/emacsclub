
;;;; This collection of files will attempt to re-implement the
;;;; tutorial provided by nodebeginner.org in elisp

;;; The http stack is implemented in the elnode package

(require 'elnode)

;;; We'll start the server module with elnode-start

(elnode-start
 ;; The first argument is the top-level handler, here
 ;; as an anonymous function
 (lambda (httpcon)
   ;; First, the response header is written
   (elnode-http-start 
    httpcon 200 
    ;; Note how this argument is given in dotted Pair notation
    `("Content-type" . "text/html"))
   ;; Second, write the text of the document to the connection, and return
   (elnode-http-return
    httpcon
    "<html><h1>HEADER</h1><p>Paragraph.</p></html>"))
 ;; finally the port and address range
 8080 "0.0.0.0")

;;; That's it, now simply eval the buffer, and the server will run