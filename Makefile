OUT = out/
TEX = tex/
THESIS = $(TEX)thesis.tex
BIB = $(TEX)bibliography.bib
LATEX = xelatex -shell-escape -halt-on-error -output-directory $(OUT)
TEX_HOME = $(shell kpsewhich -var-value=TEXMFHOME)/tex/latex

.PHONY: init clean

all: thesis.pdf

thesis.pdf: init $(TEX)*.tex $(TEX)*.bib
	$(LATEX) $(THESIS)
	bibtex $(OUT)/thesis.aux
	$(LATEX) $(THESIS)
	$(LATEX) $(THESIS)
	mv $(OUT)/thesis.pdf ./

init:
	mkdir -p $(OUT)
	mkdir -p $(TEX_HOME)
	cp -f libraries/* $(TEX_HOME)

clean:
	rm -rf $(OUT)
	rm -f thesis.pdf
