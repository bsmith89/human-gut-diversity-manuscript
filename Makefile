all: manuscript.pdf

manuscript.pdf: manuscript.tex masterstyle.sty manuscriptstyle.sty \
                myplainnat.bst master.bib \

%.pdf:
	-pdflatex -interaction=batchmode $*
	-bibtex $*
	-pdflatex -interaction=batchmode $*
	-pdflatex -interaction=nonstopmode $*

%.chk: %.tex
	chktex $^ >$@ 2>&1
	@cat $@

clean:
	rm -f *.log *.aux *-blx.bib *.bcf \
		  *.blg *.run.xml *.bbl \
		  *.out *.chk *.dvi *.toc \
		  *.nav *.snm

-include extra.mk
