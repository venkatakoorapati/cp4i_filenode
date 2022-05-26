ARG REPO_LOCATION=icr.io/appc-dev/
ARG BASE_VERSION=12.0.3.0-r2
FROM ${REPO_LOCATION}ace-server/base:${BASE_VERSION}
USER root
COPY bars_test /home/aceuser/bars
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_compile_bars.sh
USER root
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
