FILE := main

all:
	xelatex $(FILE)
	bibtex $(FILE)
	xelatex $(FILE)
	xelatex $(FILE)

clean:
	rm -f *.out *.aux *.bbl *.blg *.log *toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.vrb *.nav *.snm *.bcf *.bak

spellcheck:
	aspell --lang=cs --home-dir=. --personal=./dictionary.txt -t -c $(FILE) || true; \

compile:
	xelatex $(FILE)
	biber $(FILE)
	xelatex $(FILE)
	xelatex $(FILE)

all: spellcheck compile
