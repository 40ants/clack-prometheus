#-asdf3.1 (error "clack-prometheus requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "clack-prometheus"
  :description "Clack middleware to serve stats in Prometheus format."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/clack-prometheus/"
  :source-control (:git "https://github.com/40ants/clack-prometheus")
  :bug-tracker "https://github.com/40ants/clack-prometheus/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system"
                         ;; We need this until
                         ;; this PR will be merged into prometheus.cl
                         ;; https://github.com/deadtrickster/prometheus.cl/pull/12
                         "cffi-grovel")
  :pathname "src"
  :depends-on ("clack-prometheus/core")
  :in-order-to ((test-op (test-op "clack-prometheus-tests"))))


(register-system-packages "lack-middleware-mount" '("LACK.MIDDLEWARE.MOUNT"))

#+sbcl
(register-system-packages "prometheus.collectors.sbcl" '("PROMETHEUS.SBCL"))

(register-system-packages "prometheus.collectors.process" '("PROMETHEUS.PROCESS"))
