(uiop:define-package #:clack-prometheus
  (:use #:cl)
  (:nicknames #:clack-prometheus/core)
  (:import-from #:lack.middleware.mount)
  (:import-from #:prometheus
                #:collector
                #:make-registry)
  (:import-from #:prometheus.formats.text
                #:marshal)
  #+sbcl
  (:import-from #:prometheus.sbcl
                #:make-memory-collector
                #:make-threads-collector)
  (:import-from #:prometheus.process
                #:make-process-collector)
  (:import-from #:prometheus-gc
                #:make-gc-collector)
  
  (:export
   #:with-prometheus-stats))
(in-package #:clack-prometheus)


(defun mount (main-app path sub-app)
  (funcall lack.middleware.mount:*lack-middleware-mount*
           main-app
           path
           sub-app))


(defun make-prometheus-app (&key registry
                                 ;; Disabled because SBCL hangs from time to time:
                                 ;; https://github.com/deadtrickster/prometheus.cl/issues/13
                                 (memory-collector-p nil)
                                 (threads-collector-p t)
                                 (gc-collector-p t)
                                 (process-collector-p t))
  (declare (ignorable memory-collector-p
                      threads-collector-p
                      gc-collector-p))
  (let* ((registry (or registry
                       (make-registry))))
    #+sbcl
    (progn 
      (when memory-collector-p
        (make-memory-collector :registry registry))
      (when threads-collector-p
        (make-threads-collector :registry registry))
      (when gc-collector-p
        (make-gc-collector :registry registry)))
  
    (when process-collector-p
      (make-process-collector :registry registry))

    (flet ((metrics-handler (env)
             (declare (ignore env))
             (list 200
                   (list :content-type "text/plain")
                   (list (marshal registry)))))
      #'metrics-handler)))


(defun with-prometheus-stats (app &key (path (or (uiop:getenv "PROMETHEUS_URI")
                                                 "/metrics"))
                                       (registry nil)
                                       ;; Disabled because SBCL hangs from time to time:
                                       ;; https://github.com/deadtrickster/prometheus.cl/issues/13
                                       (memory-collector-p nil)
                                       (threads-collector-p t)
                                       (gc-collector-p t)
                                       (process-collector-p t))
  "Mounts a Clack sub-application to serve stats in Prometheus format.

   By default, app will respons on `/metrics` path but you can provide an alternative
   either directly as PATH argument or via PROMETHEUS_URI environment variable.

   To customize metrics provided by the application, you can manually create
   a prometheus registry by calling to PROMETHEUS:MAKE-REGISTRY, add necessary
   counters, gauges, etc and then pass this registry as REGISTRY argument to
   the WITH-PROMETHEUS-STATS function.

   Note: by default, memory collector is turned off, because it causes SBCL hanging."
  (check-type path string)
  (check-type registry (or null
                           prometheus:registry))
  (mount app path
         (make-prometheus-app :registry registry
                              :memory-collector-p memory-collector-p
                              :threads-collector-p threads-collector-p
                              :gc-collector-p gc-collector-p
                              :process-collector-p process-collector-p)))
