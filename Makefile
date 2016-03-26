SHELL := /bin/bash

CC = gcc 

CFLAGS = -O2 
LATEX=pdflatex
LATEXOPT=--shell-escape
LATEXMK=latexmk
LATEXMKOPT=-pdf
LATEXMKBIBTEX=-bibtex
#all: doc compress clean



all: relatorio.pdf 


clean:
	@echo "A eliminar PDF de relatório anterior ...."
	rm -fr relatorio.pdf 

############################# - Documentação - #########################################

relatorio.pdf:  report/rel.tex 
	$(LATEXMK) $(LATEXMKBIBTEX) $(LATEXMKOPT) \
		$(LATEXMKBIBTEX) $(CONTINUOUS) \
		            -pdflatex="$(LATEX) $(LATEXOPT) %O %S" \
			    report/rel.tex 
	mv rel.pdf relatorio.pdf 
	rm -fr rel.* 
	rm -fr report/chapters/*.aux 
	rm -fr _minted-rel


