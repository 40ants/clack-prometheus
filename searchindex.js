Search.setIndex({"docnames":["../index","../changelog"],"filenames":["../","../changelog/"],"objects":{"":{"CLACK-PROMETHEUS":[0,14,2,"x-28-23A-28-2816-29-20BASE-CHAR-20-2E-20-22CLACK-PROMETHEUS-22-29-20PACKAGE-29"]},"CLACK-PROMETHEUS":{"WITH-PROMETHEUS-STATS":[0,6,2,"x-28CLACK-PROMETHEUS-3AWITH-PROMETHEUS-STATS-20FUNCTION-29"]}},"objnames":[["lisp","symbol","Symbol"],["lisp","argument","Argument"],["lisp","system","ASDF System"],["lisp","class","Class"],["lisp","compiler-macro","Compiler Macro"],["lisp","constant","Constant"],["lisp","function","Function"],["lisp","generic-function","Generic Function"],["lisp","glossary-term","Glossary Term"],["lisp","include","Included Block"],["lisp","stdout-of","Stdout of Code"],["lisp","locative","Locative"],["lisp","macro","Macro"],["lisp","method","Method"],["lisp","package","Package"],["lisp","restart","Restart"],["lisp","section","Section"],["lisp","accessor","Accessor"],["lisp","reader","Slot Reader"],["lisp","writer","Slot Write"],["lisp","structure-accessor","Structure Accessor"],["lisp","type","Type"],["lisp","variable","Variable"]],"objtypes":["lisp:symbol","lisp:argument","lisp:system","lisp:class","lisp:compiler-macro","lisp:constant","lisp:function","lisp:generic-function","lisp:glossary-term","lisp:include","lisp:stdout-of","lisp:locative","lisp:macro","lisp:method","lisp:package","lisp:restart","lisp:section","lisp:accessor","lisp:reader","lisp:writer","lisp:structure-accessor","lisp:type","lisp:variable"],"terms":{"Description:":[0],"Clack":[0],"middlewar":[0],"to":[1,0],"serv":[0],"stat":[0],"in":[0],"Prometheu":[0],"format.":[0],"Licence:":[0],"Unlicens":[0],"Author:":[0],"Alexand":[0],"Artemenko":[0],"<svetlyak.40wt@gmail.com>":[0],"Homepage:":[0],"https://40ants.com/clack-prometheus/":[0],"Bug":[0],"tracker:":[0],"https://github.com/40ants/clack-prometheus/issu":[0],"Sourc":[0],"control:":[0],"GIT":[0],"Depend":[0],"on:":[0],"lack-middleware-mount":[0],",":[0],"prometheu":[0],"prometheus-gc":[0],"prometheus.collectors.process":[0],"prometheus.collectors.sbcl":[0],"prometheus.formats.text":[0],"CLACK-PROMETHEUS":[0],"ASDF":[0],"System":[0],"Detail":[0],"Thi":[0],"librari":[0],"provid":[0],"a":[0],"wai":[0],"collect":[0],"metric":[0],".":[0],"In":[0],"addit":[0],"system":[0],"by":[1,0],"prometheus.cl":[0],"it":[0],"also":[0],"on":[0],"SBCL":[0],"'s":[0],"garbag":[0],"collection,":[0],"us":[0],"system.":[0],"is":[0],"40ants-openrpc":[0],"from":[0],"JSON-RPC":[0],"microservices.":[0],"You":[1,0],"can":[1,0],"instal":[0],"thi":[0],"Quicklisp,":[0],"but":[0],"you":[0],"want":[0],"receiv":[0],"updat":[0],"quickly,":[0],"then":[0],"Ultralisp.org:":[0],"(ql-dist:install-dist":[0],"\"http://dist.ultralisp.org/\"\n":[0],":prompt":[0],"nil)\n(ql:quickload":[0],":clack-prometheus)":[0],"Installat":[0],"Here":[0],"minim":[0],"exampl":[0],"which":[0],"creat":[0],"\"hello-world\"":[0],"clack":[0],"application\nand":[0],"add":[0],"/metric":[0],"rout":[0],"it:":[0],"CL-USER>":[0],"(defparamet":[0],"*handler*\n":[0],"(flet":[0],"((main-app":[0],"(env)\n":[0],"(declar":[0],"(ignor":[0],"env))\n":[0],"'(200\n":[0],"(:content-typ":[0],"\"text/plain\")\n":[0],"(\"Hello,":[0],"Clack!\"))))\n":[0],"(clack:clackup\n":[0],"(clack-prometheus:with-prometheus-stats\n":[0],"#'main-app)\n":[0],":port":[0],"9090)))":[0],"When":[0],"run":[0],"code,":[0],"go":[0],"anoth":[0],"termin":[0],"tab":[0],"and":[0],"curl":[0],"On":[0],"/":[0],"path":[0],"our":[0],"hello":[0],"world":[0],"app":[0],"will":[0],"respond:":[0],"$":[0],"-s":[0],"'http://localhost:9090/'\nHello,":[0],"Clack!":[0],"we'll":[0],"see":[0],"output":[0],"format:":[0],"'http://localhost:9090/metrics'\n#":[0],"TYPE":[0],"sbcl_read_only_byt":[0],"gauge\n#":[0],"HELP":[0],"Read-onli":[0],"space":[0],"usage\nsbcl_read_only_byt":[0],"0\n#":[0],"sbcl_static_byt":[0],"Static":[0],"usage\nsbcl_static_byt":[0],"1744\n#":[0],"sbcl_dynamic_byt":[0],"Dynam":[0],"usage\nsbcl_dynamic_bytes{object_type=\"other\"}":[0],"27705408\nsbcl_dynamic_bytes{object_type=\"instance\"}":[0],"24370256\n...\n#":[0],"process_resident_memory_byt":[0],"Resid":[0],"memori":[0],"size":[0],"bytes.\nprocess_resident_memory_byt":[0],"244039680\n#":[0],"process_cpu_second":[0],"counter\n#":[0],"Process":[0],"CPU":[0],"seconds.\nprocess_cpu_seconds{time=\"stime\"}":[0],"121.2\nprocess_cpu_seconds{time=\"utime\"}":[0],"300.51\n#":[0],"process_cpu_seconds_tot":[0],"second":[0],"total.\nprocess_cpu_seconds_tot":[0],"421.71":[0],"Usage":[0],"Mount":[0],"sub-appl":[0],"By":[0],"default,":[0],"respon":[0],"an":[0],"alternative\neith":[0],"directli":[0],"as":[0],"PATH":[0],"argument":[1,0],"or":[1,0],"via":[0],"PROMETHEUS":[0],"_":[0],"URI":[0],"environ":[0],"variable.":[0],"To":[0],"custom":[0],"the":[0],"application,":[0],"manual":[0],"create\na":[0],"registri":[0],"call":[0],"PROMETHEUS:MAKE-REGISTRY":[0],"necessary\ncounters,":[0],"gauges,":[0],"etc":[0],"pass":[0],"REGISTRY":[0],"to\nth":[0],"with-prometheus-stat":[0],"function.":[1,0],"Note:":[0],"collector":[1,0],"turn":[0],"off,":[0],"becaus":[0],"caus":[0],"hanging.":[0],"Function":[0],"API":[0],"clack-prometheu":[0],"-":[0],"Memori":[1],"now":[1],"disabl":[1],"default.":[1],"Backward":[1],"incompat":[1],"enabl":[1],"clack-prometheus:with-prometheus-stat":[1],"Chang":[1],"0.2.0":[1],"(2025-02-11)":[1],"Initial":[1],"version.":[1],"0.1.0":[1],"(2023-05-06)":[1],"ChangeLog":[1]},"titles":["clack-prometheus - Clack middleware to serve stats in Prometheus format.","ChangeLog"],"titleterms":[]})
