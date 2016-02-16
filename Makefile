OS := $(shell uname)
MAIN := bachelor

ifeq ($(OS),Linux)
	PDFLATEX := /usr/texlive/2013/bin/x86_64-linux/pdflatex
	BIBTEX := /usr/texlive/2013/bin/x86_64-linux/bibtex
	OPEN := xdg-open
else
	PDFLATEX := pdflatex
	BIBTEX := bibtex
	OPEN := open
endif

open: all
	$(OPEN) bachelor.pdf

.PHONY:

spell:
	aspell --lang=no -c tekst.tex

all:
	$(PDFLATEX) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(PDFLATEX) $(MAIN).tex
	$(PDFLATEX) $(MAIN).tex

clean:
	rm -f *.aux *.log $(MAIN).pdf *.toc *.bbl *.blg *.out
