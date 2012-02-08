
;;;; As the code became more complex, the 
;;;; structure needed to be changed to align
;;;; more with elisp standards. In particular
;;;; dependency injection will be left out:
;;;; nodejs require function works by representing
;;;; modules as javascript objects; of which
;;;; no equivalent is immediately apparent to me

(require 'elnode)

;;; some placeholder constants

(defvar port 80)
(defvar host "*")

;;; Specific request handlers

(defun start ()

  (elnode-error
   "Handler 'start' was called"))

(defun upload ()

  (elnode-error
   "Handler 'upload' was called"))

;;; Routing

(defun route-request (pathname)
  
    (elnode-error
     "About to route request for '%s'."
     pathname))

;;; Top-level server

(defun on-request (httpcon)
  
  (let ((path 
	 (elnode-http-pathinfo 
	  httpcon)))
    
    (route-request path)
    
    (elnode-http-start 
     httpcon 
     "200" 
     '("Content-type" . "text/html"))
    
    (elnode-http-return 
     httpcon
     "Hello, World")))

(defun webserver-start ()
  
  (elnode-start 'on-request port host)
  
  (elnode-error "Server started"))

;;; Start

(webserver-start)
