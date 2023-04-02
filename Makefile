PY?=python3

BASEDIR=$(CURDIR)

GITHUB_PAGES_BRANCH=gh-pages
GITHUB_CNAME=qrk.us
GITHUB_PAGES_REMOTE=origin
GITHUB_SOURCE_BRANCH=main
OUTPUTDIR=$(BASEDIR)/content

help:
	@echo 'Makefile a GitHub Pages site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make github                         upload the web site via gh-pages   '
	@echo '                                                                          '

publish:
	pip install --upgrade --requirement $(BASEDIR)/requirements.txt

github: publish
	git fetch $(GITHUB_PAGES_REMOTE) $(GITHUB_PAGES_BRANCH) || true
	ghp-import --push --message "publish site" --branch $(GITHUB_PAGES_BRANCH) --remote $(GITHUB_PAGES_REMOTE) --cname $(GITHUB_CNAME) $(OUTPUTDIR)
	git push origin $(GITHUB_SOURCE_BRANCH)

.PHONY: github
