(defsystem "clack-prometheus-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/clack-prometheus/"
  :class :package-inferred-system
  :description "Provides documentation for clack-prometheus."
  :source-control (:git "https://github.com/40ants/clack-prometheus")
  :bug-tracker "https://github.com/40ants/clack-prometheus/issues"
  :pathname "docs"
  :depends-on ("clack-prometheus"
               "clack-prometheus-docs/index"))
