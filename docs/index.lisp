(uiop:define-package #:clack-prometheus-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:clack-prometheus-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:import-from #:40ants-doc/autodoc
                #:defautodoc)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:clack-prometheus-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "clack-prometheus-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS"))))


(defsection @index (:title "clack-prometheus - Clack middleware to serve stats in Prometheus format."
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "PROMETHEUS"
                                   "URI"
                                   "PROMETHEUS:MAKE-REGISTRY"
                                   "TODO"
                                   "Unlicense"
                                   "REPL"
                                   "SBCL"
                                   "JSON-RPC"
                                   "GIT")
                    :external-docs ("https://40ants.com/40ants-openrpc/"
                                    "https://40ants.com/prometheus-gc/")
                    :external-links (("Prometheus" . "https://prometheus.io/")
                                     ("prometheus.cl" . "https://github.com/deadtrickster/prometheus.cl")))
  (clack-prometheus system)
  "
[![](https://github-actions.40ants.com/40ants/clack-prometheus/matrix.svg?only=ci.run-tests)](https://github.com/40ants/clack-prometheus/actions)

![Quicklisp](http://quickdocs.org/badge/clack-prometheus.svg)

This library provides a way to collect metrics in [Prometheus][Prometheus]. In addition to system metrics collected by [prometheus.cl][prometheus.cl], it also collects metrics on SBCL's garbage collection, using PROMETHEUS-GC system.

This library is used in 40ANTS-OPENRPC system to collect stats from JSON-RPC microservices.
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :clack-prometheus)
```
""")


(defsection @usage (:title "Usage"
                    :ignore-words ("ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"))
  "
Here is a minimal example which creates a \"hello-world\" clack application
and adds a `/metrics` route to it:

```lisp
CL-USER> (defparameter *handler*
           (flet ((main-app (env)
                    (declare (ignore env))
                    '(200
                      (:content-type \"text/plain\")
                      (\"Hello, Clack!\"))))
             (clack:clackup
              (clack-prometheus:with-prometheus-stats
                #'main-app)
              :port 9090)))
```

When you run this code, go to another terminal tab and run `curl`. On `/` path our hello world app will respond:

```bash
$ curl -s 'http://localhost:9090/'
Hello, Clack!
```

and on `/metrics` we'll see output in [Prometheus][Prometheus] format:

```bash
$ curl -s 'http://localhost:9090/metrics'
# TYPE sbcl_read_only_bytes gauge
# HELP sbcl_read_only_bytes SBCL Read-only space usage
sbcl_read_only_bytes 0
# TYPE sbcl_static_bytes gauge
# HELP sbcl_static_bytes SBCL Static space usage
sbcl_static_bytes 1744
# TYPE sbcl_dynamic_bytes gauge
# HELP sbcl_dynamic_bytes SBCL Dynamic space usage
sbcl_dynamic_bytes{object_type=\"other\"} 27705408
sbcl_dynamic_bytes{object_type=\"instance\"} 24370256
...
# TYPE process_resident_memory_bytes gauge
# HELP process_resident_memory_bytes Resident memory size in bytes.
process_resident_memory_bytes 244039680
# TYPE process_cpu_seconds counter
# HELP process_cpu_seconds Process CPU seconds.
process_cpu_seconds{time=\"stime\"} 121.2
process_cpu_seconds{time=\"utime\"} 300.51
# TYPE process_cpu_seconds_total counter
# HELP process_cpu_seconds_total Process CPU seconds total.
process_cpu_seconds_total 421.71
```
")


(defautodoc @api (:system "clack-prometheus"))
