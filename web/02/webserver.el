
(require 'elnode)

;;; New request handler with path logic

(defun on-request (httpcon)
  
  (let ((path 
	 (elnode-http-pathinfo 
	   httpcon)))
    
    (elnode-error 
     "Got request with path '%s'."
     path)
    
    (elnode-http-start 
     httpcon 
     "200" 
     '("Content-type" . "text/html"))
    
    (elnode-http-return 
     httpcon
     "Hello, World")))

(defun webserver-start ()
  
  ;;(elnode-start 'hello-handler 8080 "0.0.0.0")
  (elnode-start 'on-request 8080 "0.0.0.0")
  
  (elnode-error "Server started"))
