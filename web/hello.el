(require 'elnode)
(defun my-elnode-hello-world-handler (httpcon)
  (elnode-http-start httpcon 200 '("Content-Type" . "text/html"))
  (elnode-http-return 
   httpcon 
   "<html><body><h1>Hello Emacs Club!</h1><p>Powered by elnode</p></body></html>"))
(elnode-start 'my-elnode-hello-world-handler 80 "0.0.0.0")


