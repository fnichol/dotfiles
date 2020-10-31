YAML_SOURCES ?= $(shell find . -type f -name '*.yaml' -o -name '*.yml' -not -path './tmp/*' -and -not -path './vendor/*')
CHECK_TOOLS += yamllint

check-yaml: checktools ## Checks YAML files are well formed
	@echo "--- $@"
	yamllint $(YAML_SOURCES)
