BIN = ./node_modules/.bin

test:
	npm test

build:
	@$(BIN)/coffee -cb -o dist src/index.coffee

release-patch: test
	@$(call release,patch)

release-minor: test
	@$(call release,minor)

release-major: test
	@$(call release,major)

publish: build
	git push --tags origin HEAD:master
	npm publish

define release
	npm version $(1)
endef
