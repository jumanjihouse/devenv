FROM alpine:edge

EXPOSE 2222
ENV LANG C
ENTRYPOINT ["/usr/sbin/start"]

# This is needed during the build script.
ARG DOCKER_VERSION

# Copy files needed to run build script.
COPY etc/package-lists /etc/
COPY usr/sbin/build /usr/sbin/
COPY usr/bin/github_pubkeys /usr/bin/

# Run the build script.
RUN /usr/sbin/build

# Copy the rest of the files.
COPY . /

# These go last to preserve the build cache.
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
