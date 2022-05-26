#ARG REPO_LOCATION=icr.io/appc-dev/
#ARG BASE_VERSION=12.0.3.0-r2
#FROM icr.io/appc-dev/ace-server@sha256:9825171d021913063cf4f505acc093c83c616e3fea9b2b23ea97d27ebf59ad43
FROM cp.icr.io/cp/appc/ace-server-prod@sha256:dd92acece159fa682256b41d009f2bc05c25090ddf18be0e9ac63a09b3b0b666
ENV LICENSE accept
USER root
RUN mkdir /home/aceuser/bars
COPY bars_test /home/aceuser/bars
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_compile_bars.sh
USER root
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
