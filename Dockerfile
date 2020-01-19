ARG CONFTEST_VERSION
FROM instrumenta/conftest:${CONFTEST_VERSION}

WORKDIR /project
ADD policy /policy

CMD ["test", "-p", "/policy", "-"]
