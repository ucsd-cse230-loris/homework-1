COQMFFLAGS := -Q . LF  

ALLVFILES := Basics.v BasicsTest.v

build: Makefile.coq
	$(MAKE) -f Makefile.coq

clean::
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq cleanall; fi
	$(RM) $(wildcard Makefile.coq Makefile.coq.conf) imp.ml imp.mli imp1.ml imp1.mli imp2.ml imp2.mli

Makefile.coq:
	coq_makefile $(COQMFFLAGS) -o Makefile.coq $(ALLVFILES)

autograde: Basics.vo
	coqc -Q . LF BasicsTest.v

turnin:
	git add .
	git commit -m "turnin"
	git push -u origin main

-include Makefile.coq

.PHONY: build clean turnin autograde
