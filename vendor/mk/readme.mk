MARKDOWN_SOURCES += README.md

readme: format-readme update-readme-toc ### Format markdown docs and update table of contents
.PHONY: readme

format-readme: ## Format markdown docs
	for md in $(MARKDOWN_SOURCES); do prettier --write $$md; done
.PHONY: format-readme

update-readme-toc: ## Update markdown doc table of contents
	for md in $(MARKDOWN_SOURCES); do markdown-toc -i $$md; done
.PHONY: update-readme-toc
