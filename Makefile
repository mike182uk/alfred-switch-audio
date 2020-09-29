BUILD_DIR=./build
WORKFLOW_DIR=./workflow
WORKFLOW_PKG=SetAudioDevice.alfredworkflow

.PHONY: fmt
fmt: ## Format the source files
	@fd -e .sh . "$(WORKFLOW_DIR)" -x shfmt -w -l "{}"

.PHONY: lint
lint: ## Lint the source files
	@shellcheck $$( fd -e .sh . "$(WORKFLOW_DIR)")

.PHONY: build
build: clean ## Build the workflow
	@mkdir $(BUILD_DIR)
	@cd $(WORKFLOW_DIR) && zip -rq $(WORKFLOW_PKG) *
	@mv $(WORKFLOW_DIR)/$(WORKFLOW_PKG) $(BUILD_DIR)/$(WORKFLOW_PKG)

.PHONY: clean
clean: ## Clean the workspace
	@rm -rf $(BUILD_DIR)

.PHONY: install-tools
install-tools: ## Install tools required by the project
	if [ -z "$(CI)" ]; then brew install fd shfmt shellcheck jq switchaudio-osx; fi

.PHONY: install
install: install-tools ## Install project dependencies (including any required tools)

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
