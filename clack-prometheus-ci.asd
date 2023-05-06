(defsystem "clack-prometheus-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/clack-prometheus/"
  :class :package-inferred-system
  :description "Provides CI settings for clack-prometheus."
  :source-control (:git "https://github.com/40ants/clack-prometheus")
  :bug-tracker "https://github.com/40ants/clack-prometheus/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "clack-prometheus-ci/ci"))
