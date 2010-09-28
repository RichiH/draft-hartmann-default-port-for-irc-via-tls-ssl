draft: $(wildcard draft*.txt)

%.toc:  %.nroff
	./draft-get-inhalt.pl $< > $@
	./draft-get-inhalt.pl $< > $@

%.txt:  %.nroff %.toc
	nroff -ms -Tascii $< | ./draft-fix-pages.pl > $@
