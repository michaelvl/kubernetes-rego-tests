CONFTEST_VERSION = v0.20.0

.PHONY: all
all: test test2 test3 test4 test5 test6 test7 test8 test9 test10 aws-tf

.PHONY: build
build:
	docker build --build-arg CONFTEST_VERSION=$(CONFTEST_VERSION) -t conftest-regula .

.PHONY: test
test:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy non-compliant-deployment.yaml

.PHONY: test2
test2:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy non-compliant-daemonset.yaml

.PHONY: test3
test3:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy non-compliant-ingress.yaml

.PHONY: test4
test4:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy hostpath-pv.yaml

.PHONY: test5
test5:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy hostpath-pod.yaml

.PHONY: test6
test6:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy svc-loadbalancer.yaml

.PHONY: test7
test7:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy contour-http-proxy.yaml

.PHONY: test8
test8:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy secrets.yaml

.PHONY: test9
test9:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy pod-with-init-container.yaml

.PHONY: test10
test10:
       -docker run -i --rm -v $(shell pwd):/project $(IMAGE) test -p policy job-without-limits.yaml


.PHONY: aws-tf
aws-tf:
	-docker run -i --rm -v $(shell pwd):/project:ro instrumenta/conftest:$(CONFTEST_VERSION) test -p policy-aws-terraform newplan.json

.PHONY: aws-tf-c
aws-tf-c:
	#-docker run -i --rm -v $(shell pwd):/project:ro conftest-regula:latest test -p /regula newplan.json
	-docker run -i --rm -v $(shell pwd)/policy-aws-terraform:/regula/policy/policy-aws-terraform:ro -v $(shell pwd):/project:ro conftest-regula:latest test -p /regula newplan.json
