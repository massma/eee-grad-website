.PHONY: all clean

S = source

T = public_html

NEEDS = $(T)/index.html \
        $(T)/current-student-resources.html \
        $(T)/ta-resources.html \
        $(T)/prospective-student-resources.html \
        $(T)/seminar-series.html \
        $(T)/.htaccess \
        $(T)/.htpasswd

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "http://www.columbia.edu/~akm2203/pandoc.css" --from markdown --to html5

LINK_HEADER = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Home}](index.html) **|** [{Ph.D. student resources}](current-student-resources.md) **|** [{TA resources (password protected)}](ta-resources.md)\n/'

all : public_html $(NEEDS)

public_html :
	mkdir -p public_html

$(T)/index.html : $(S)/index.md Makefile
	cat $< | $(PANDOC) > $@

$(T)/prospective-student-resources.html : $(S)/prospective-student-resources.md Makefile
	cat $< | $(PANDOC) > $@

$(T)/%.html : $(S)/%.md Makefile
	cat $< | $(LINK_HEADER) | $(PANDOC) > $@

$(T)/.htaccess : $(S)/.htaccess
	cp -f $< $@

$(T)/.htpasswd : $(S)/.htpasswd
	cp -f $< $@

clean :
	rm -rf $(NEEDS)
