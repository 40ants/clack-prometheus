(uiop:define-package #:clack-prometheus-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:clack-prometheus-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"))
  (0.2.0 2025-02-11
         "
Backward incompatible
=====================

* Memory collector now disabled by default.

Changes
=======

* You can enable or disable collectors by arguments to CLACK-PROMETHEUS:WITH-PROMETHEUS-STATS function.
")
  (0.1.0 2023-05-06
         "* Initial version."))
