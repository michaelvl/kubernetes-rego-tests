.PHONY: al
all: test test2 test3 test4

.PHONY: test
test:
	-docker run --rm -v $(shell pwd):/project instrumenta/conftest test -p policy non-compliant-deployment.yaml

.PHONY: test2
test2:
	-docker run --rm -v $(shell pwd):/project instrumenta/conftest test -p policy non-compliant-daemonset.yaml

.PHONY: test3
test3:
	-docker run --rm -v $(shell pwd):/project instrumenta/conftest test -p policy non-compliant-ingress.yaml

.PHONY: test4
test4:
	-docker run --rm -v $(shell pwd):/project instrumenta/conftest test -p policy hostpath-pv.yaml
