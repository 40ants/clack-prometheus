<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# clack-prometheus - Clack middleware to serve stats in Prometheus format.

<a id="clack-prometheus-asdf-system-details"></a>

## CLACK-PROMETHEUS ASDF System Details

* Version: 0.1.0

* Description: Clack middleware to serve stats in Prometheus format.

* Licence: Unlicense

* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>

* Homepage: [https://40ants.com/clack-prometheus/][1dee]

* Bug tracker: [https://github.com/40ants/clack-prometheus/issues][22ac]

* Source control: [GIT][1e60]

* Depends on: [lack-middleware-mount][7e24], [prometheus][14fa], [prometheus-gc][8b12], [prometheus.collectors.process][563a], [prometheus.collectors.sbcl][a01b], [prometheus.formats.text][b66b]

[![](https://github-actions.40ants.com/40ants/clack-prometheus/matrix.svg?only=ci.run-tests)][c78f]

![](http://quickdocs.org/badge/clack-prometheus.svg)

This library provides a way to collect metrics in [Prometheus][df56]. In addition to system metrics collected by [prometheus.cl][67af], it also collects metrics on `SBCL`'s garbage collection, using [`prometheus-gc`][7e1e] system.

This library is used in [`40ants-openrpc`][c095] system to collect stats from `JSON-RPC` microservices.

<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :clack-prometheus)
```
<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

Here is a minimal example which creates a "hello-world" clack application
and adds a `/metrics` route to it:

```lisp
CL-USER> (defparameter *handler*
           (flet ((main-app (env)
                    (declare (ignore env))
                    '(200
                      (:content-type "text/plain")
                      ("Hello, Clack!"))))
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
and on `/metrics` we'll see output in `Prometheus` format:

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
sbcl_dynamic_bytes{object_type="other"} 27705408
sbcl_dynamic_bytes{object_type="instance"} 24370256
...
# TYPE process_resident_memory_bytes gauge
# HELP process_resident_memory_bytes Resident memory size in bytes.
process_resident_memory_bytes 244039680
# TYPE process_cpu_seconds counter
# HELP process_cpu_seconds Process CPU seconds.
process_cpu_seconds{time="stime"} 121.2
process_cpu_seconds{time="utime"} 300.51
# TYPE process_cpu_seconds_total counter
# HELP process_cpu_seconds_total Process CPU seconds total.
process_cpu_seconds_total 421.71
```
<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-3A-40API-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## API

<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-3A-40CLACK-PROMETHEUS-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CLACK-PROMETHEUS

<a id="x-28-23A-28-2816-29-20BASE-CHAR-20-2E-20-22CLACK-PROMETHEUS-22-29-20PACKAGE-29"></a>

#### [package](f5d6) `clack-prometheus`

<a id="x-28CLACK-PROMETHEUS-DOCS-2FINDEX-3A-3A-7C-40CLACK-PROMETHEUS-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-28CLACK-PROMETHEUS-3AWITH-PROMETHEUS-STATS-20FUNCTION-29"></a>

##### [function](f4b8) `clack-prometheus:with-prometheus-stats` APP &KEY (PATH (OR (UIOP/OS:GETENV "PROMETHEUS\_URI") "/metrics")) (REGISTRY NIL)

Mounts a Clack sub-application to serve stats in Prometheus format.

By default, app will respons on `/metrics` path but you can provide an alternative
either directly as `PATH` argument or via `PROMETHEUS`_`URI` environment variable.

To customize metrics provided by the application, you can manually create
a prometheus registry by calling to `PROMETHEUS:MAKE-REGISTRY`, add necessary
counters, gauges, etc and then pass this registry as `REGISTRY` argument to
the [`with-prometheus-stats`][15f2] function.


[7e1e]: /home/runner/work/prometheus-gc/prometheus-gc/docs/build/#x-28-23A-28-2813-29-20BASE-CHAR-20-2E-20-22prometheus-gc-22-29-20ASDF-2FSYSTEM-3ASYSTEM-29
[c095]: https://40ants.com/40ants-openrpc/#x-28-23A-28-2814-29-20BASE-CHAR-20-2E-20-2240ants-openrpc-22-29-20ASDF-2FSYSTEM-3ASYSTEM-29
[1dee]: https://40ants.com/clack-prometheus/
[15f2]: https://40ants.com/clack-prometheus/#x-28CLACK-PROMETHEUS-3AWITH-PROMETHEUS-STATS-20FUNCTION-29
[1e60]: https://github.com/40ants/clack-prometheus
[c78f]: https://github.com/40ants/clack-prometheus/actions
[f5d6]: https://github.com/40ants/clack-prometheus/blob/292646744b0bf3773d62995250838dd32279715a/src/core.lisp#L1
[f4b8]: https://github.com/40ants/clack-prometheus/blob/292646744b0bf3773d62995250838dd32279715a/src/core.lisp#L50
[22ac]: https://github.com/40ants/clack-prometheus/issues
[67af]: https://github.com/deadtrickster/prometheus.cl
[df56]: https://prometheus.io/
[7e24]: https://quickdocs.org/lack-middleware-mount
[14fa]: https://quickdocs.org/prometheus
[8b12]: https://quickdocs.org/prometheus-gc
[563a]: https://quickdocs.org/prometheus.collectors.process
[a01b]: https://quickdocs.org/prometheus.collectors.sbcl
[b66b]: https://quickdocs.org/prometheus.formats.text

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
