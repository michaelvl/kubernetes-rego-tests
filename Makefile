CONFTEST_IMAGE_TAG = v0.16.0

.PHONY: al
all: test test2 test3 test4 test5

.PHONY: test
test:
	-cat non-compliant-deployment.yaml | docker run -i --rm -v $(shell pwd):/project instrumenta/conftest:$(CONFTEST_IMAGE_TAG) test -p policy -

.PHONY: test2
test2:
	-cat non-compliant-daemonset.yaml | docker run -i --rm -v $(shell pwd):/project instrumenta/conftest:$(CONFTEST_IMAGE_TAG) test -p policy -

.PHONY: test3
test3:
	-cat non-compliant-ingress.yaml | docker run -i --rm -v $(shell pwd):/project instrumenta/conftest:$(CONFTEST_IMAGE_TAG) test -p policy -

.PHONY: test4
test4:
	-cat hostpath-pv.yaml | docker run -i --rm -v $(shell pwd):/project instrumenta/conftest:$(CONFTEST_IMAGE_TAG) test -p policy -

.PHONY: test5
test5:
	-cat hostpath-pod.yaml | docker run -i --rm -v $(shell pwd):/project instrumenta/conftest:$(CONFTEST_IMAGE_TAG) test -p policy -
