.PHONY: all clean

S = source

T = public_html

NEEDS = $(T)/index.html \
        $(T)/current-student-resources.html \
        $(T)/ta-resources.html \
        $(T)/prospective-student-resources.html \
        $(T)/seminar-series.html \
        $(T)/.htaccess \
        $(T)/.htpasswd \
        $(T)/week-01-zhu-electrochemical.html \
        $(T)/week-03-agarwal-vanadium.html \
        $(T)/week-05-oyakhire-electrodeposition.html \
        $(T)/week-06-chavez-hybrid-plasmonic.html \
        $(T)/week-07-adejumo-disinfection-byproducts.html \
        $(T)/week-08-onuoha-wind-powered-ammonia.html \
        $(T)/week-09-rodriguez-chemical-risk-water.html \
        $(T)/week-10-kogler-waste-to-value.html \
        $(T)/week-11-kerins-rocky-carbon.html

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "http://www.columbia.edu/~akm2203/pandoc.css" --from markdown --to html5

LINK_HEADER = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Home}](index.html) **|** [{Ph.D. student resources}](current-student-resources.md) **|** [{TA resources (password protected)}](ta-resources.md) **|**\\\n[{Summer Seminar Series of 2021}](seminar-series.md)\n/'

LINK_SERIES = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Series Page}](seminar-series.html)\n/'

all : public_html $(NEEDS)

public_html :
	mkdir -p public_html

$(T)/index.html : $(S)/index.md Makefile
	cat $< | $(PANDOC) > $@

$(T)/prospective-student-resources.html : $(S)/prospective-student-resources.md Makefile
	cat $< | $(PANDOC) > $@

$(T)/week-%.html : $(S)/week-%.md Makefile
	cat $< | $(LINK_SERIES) | $(PANDOC) > $@

$(T)/%.html : $(S)/%.md Makefile
	cat $< | $(LINK_HEADER) | $(PANDOC) > $@

$(T)/.htaccess : $(S)/.htaccess
	cp -f $< $@

$(T)/.htpasswd : $(S)/.htpasswd
	cp -f $< $@

clean :
	rm -rf $(NEEDS)
