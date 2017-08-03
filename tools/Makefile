#!/usr/bin/make -f

#THEME_OPT=-t simple
THEME_OPT=-t gnuside
REVEALJS_THEMES=node_modules/reveal-md/node_modules/reveal.js/css/theme
SLIDES_DIR=slides
SLIDES_MD=$(wildcard $(SLIDES_DIR)/*.md)
SLIDES_PDF=$(patsubst %.md,%.pdf,$(SLIDES_MD))

REVEALMD=node_modules/.bin/reveal-md

all: help

help:
	@echo "This project accepts the following targets:"
	@echo ""
	@echo "    make clean          # clean all generated files"
	@echo ""
	@echo "    make prepare        # prepare configuration"
	@echo "    make prepare_docs   # prepare configuration for docs only"
	@echo "    make prepare_slides # prepare configuration for slides only"
	@echo ""
	@echo "    make serve          # run local servers"
	@echo "    make serve_docs     # run local server for docs only"
	@echo "    make serve_slides   # run local server for slides only"
	@echo ""
	@echo "    make build          # build all"
	@echo "    make build_docs     # build static site"
	@echo "    make build_slides   # build PDF files from slides"
	@echo ""
	@echo "    make install        # deploy static content github"
	@echo ""


prepare_slides:
	npm install reveal-md
	cp -a themes/gnuside.css $(REVEALJS_THEMES)
	cp -a themes/gnuside.scss $(REVEALJS_THEMES)/source

prepare_docs: 

prepare: prepare_slides
	npm install foreman

###
### Serve 
### 

serve: serve_docs serve_slides 

serve_docs:
	mkdocs serve 

serve_slides:
	$(REVEALMD) $(THEME_OPT) $(SLIDES_DIR)


###
### Build 
###

%.pdf: %.md
	$(REVEALMD) $(THEME_OPT) -r $@ $<

build: $(SLIDES_PDF) build_docs

build_docs:
	mkdocs build


###
### Install (=deploy)
###

install: install-reveal docs

install_docs:
	mkdocs gh-deploy

install-dokku:
	mkdocs gh-deploy -r dokku
	git push -f dokku gh-pages:master

###
### Clean
###

clean: clean_docs clean_slides

clean_docs:

clean_slides:
	rm -f $(SLIDES_DIR)/*.pdf

