.PHONY: all clean

S = source

T = public_html

NEEDS = $(T)/index.html \
        $(T)/current-student-resources.html \
        $(T)/ta-resources.html \
        $(T)/prospective-student-resources.html \
        $(T)/seminar-series.html

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "http://www.columbia.edu/~akm2203/pandoc.css" --from markdown --to html5

LINK_HEADER = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Home}](index.html) **|** [{Current student resources}](current-student-resources.md) **|** [{TA resources}](ta-resources.md) **|**\n[{Prospective student resources}](prospective-student-resources.md) **|** [{2021 Summer Seminar Series}](seminar-series.md)\n/'

all : public_html $(NEEDS)

public_html :
	mkdir -p public_html

$(T)/index.html : $(S)/index.md Makefile # still working here
	cat $< | $(PANDOC) > $@

$(T)/%.html : $(S)/%.md Makefile
	cat $< | $(LINK_HEADER) | $(PANDOC) > $@

clean :
	rm -rf $(NEEDS)
