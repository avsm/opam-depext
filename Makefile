all: shell/build.sh
	sh -ex shell/build.sh

shell/build.sh: shell/build.ml
	ocaml $< byte > $@
	chmod a+x $@

clean:
	rm -f opam-depext shell/build.sh *.cmi *.cma *.cmo *.cmx

install:
	opam-installer --prefix=$(PREFIX)
