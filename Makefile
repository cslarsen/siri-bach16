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

ord:
	@annet/ord.sh

annet/antallord.tex: [1-9]-*.tex tabell-artikler.tex
	annet/ord.sh > $@

spell:
	aspell --lang=no -c [0-9]-*.tex tabell*.tex vedlegg*.tex

all: annet/antallord.tex
	$(PDFLATEX) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(PDFLATEX) $(MAIN).tex
	$(PDFLATEX) $(MAIN).tex

clean:
	rm -f annet/antallord.tex *.aux *.log $(MAIN).pdf *.toc *.bbl *.blg *.out *.idx *.ilg *.ind GRTAGS GPATH GTAGS
