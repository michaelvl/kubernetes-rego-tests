ARG CONFTEST_VERSION
FROM instrumenta/conftest:${CONFTEST_VERSION}

RUN apk add git \
    && mkdir /regula && cd /regula \
    && conftest pull -p policy/ github.com/fugue/regula/conftest \
    && conftest pull -p policy/regula/lib github.com/fugue/regula/lib \
    && conftest pull -p policy/regula/rules github.com/fugue/regula/rules

WORKDIR /project
