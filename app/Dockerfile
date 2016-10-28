FROM alpine:edge

# http://jumanjiman.github.io/
MAINTAINER Paul Morgan <jumanjiman@gmail.com>

ARG DOCKER_VERSION
ARG GIT_REF
ARG VERSION

LABEL \
    org.label-schema.name="jumanjiman/devenv" \
    org.label-schema.description="containerized development environment" \
    org.label-schema.url="https://github.com/jumanjihouse/devenv" \
    org.label-schema.vcs-url="https://github.com/jumanjihouse/devenv.git" \
    org.label-schema.docker.dockerfile="/app/Dockerfile" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${GIT_REF}" \
    org.label-schema.license="GPLv2" \
    org.label-schema.version="${VERSION}"


COPY . /
RUN /usr/sbin/build

EXPOSE 2222
ENV LANG C
ENTRYPOINT ["/usr/sbin/start"]
