include vendor/mk/base.mk
include vendor/mk/readme.mk
include vendor/mk/shell.mk
include vendor/mk/yaml.mk

SH_SOURCES += home/.bashrc home/.bash_aliases

build:
.PHONY: build

clean: clean-shell ## Cleans up project
.PHONY: clean

check: check-shell ## Checks all linting, styling, & other rules
.PHONY: check

test:
.PHONY: test
