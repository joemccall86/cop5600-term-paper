DOT=dot
PANDOC=pandoc

all: term_paper.pdf

%.pdf: %.md
	$(PANDOC) -N --filter pandoc-crossref --filter pandoc-citeproc -o $@ $<

clean:
	rm -f term_paper.pdf
