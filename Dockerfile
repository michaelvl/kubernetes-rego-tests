ARG CONFTEST_VERSION=v0.28.3
FROM openpolicyagent/conftest:${CONFTEST_VERSION}

RUN apk add git \
    && mkdir /regula && cd /regula \
    && conftest pull -p policy/ github.com/fugue/regula/rego/conftest \
    && conftest pull -p policy/regula/lib github.com/fugue/regula/rego/lib \
    && conftest pull -p policy/regula/rules github.com/fugue/regula/rego/rules

RUN mkdir -p /project/policy /project/policy-aws-terraform
COPY policy /project/policy/
COPY policy-aws-terraform /project/policy-aws-terraform/

WORKDIR /project
