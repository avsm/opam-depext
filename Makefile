all: shell/build.sh
	sh -ex shell/build.sh

shell/build.sh: shell/build.ml
	ocaml $< byte > $@
	chmod a+x $@

clean:
	git clean -dxf

install:
	opam-installer --prefix=$(PREFIX)
