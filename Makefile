FILE := main
DIAGRAMS_DIR := ./diagrams
IMG_DIR := ../img
PLANTUML_JAR := plantuml.jar
SOURCES := $(wildcard $(DIAGRAMS_DIR)/*.txt)
TARGETS := $(patsubst $(DIAGRAMS_DIR)/%.txt,$(IMG_DIR)/%.png,$(SOURCES))

all: $(TARGETS)
	xelatex $(FILE)
	bibtex $(FILE)
	xelatex $(FILE)
	xelatex $(FILE)

$(IMG_DIR)/%.png: $(DIAGRAMS_DIR)/%.txt
	@mkdir -p $(IMG_DIR)
	java -jar $(PLANTUML_JAR) -o ../$(IMG_DIR) $<

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
