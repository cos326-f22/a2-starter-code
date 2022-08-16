all: boxoffice

boxoffice: query.ml io.ml main.ml
	ocamlbuild -lib str main.byte
	mv main.byte boxoffice

check: boxoffice
	./boxoffice -echo < data/trial1.txt

topG: boxoffice
	./boxoffice -sort-gross < data/G.txt | ./boxoffice -take 1

part1.byte: part1.ml
	ocamlbuild part1.byte

clean:
	ocamlbuild -clean
