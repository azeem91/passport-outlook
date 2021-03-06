SOURCES ?= lib/*.js lib/**/*.js
TESTS ?= test/*.test.js

test: test-mocha
test-cov: test-istanbul-mocha
view-cov: view-istanbul-report
lint: lint-jshint
lint-tests: lint-tests-jshint


# ==============================================================================
# Node.js
# ==============================================================================
include support/mk/node.mk
include support/mk/mocha.mk
include support/mk/istanbul.mk

# ==============================================================================
# Analysis
# ==============================================================================
include support/mk/notes.mk
include support/mk/jshint.mk

# Travis CI
ci-travis: test test-cov

# ==============================================================================
# Clean
# ==============================================================================
clean:
	rm -rf build
	rm -rf reports

clobber: clean clobber-node


.PHONY: test test-cov view-cov lint lint-tests ci-travis clean clobber
