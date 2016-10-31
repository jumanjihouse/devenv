FROM scratch

ARG GIT_REF

LABEL \
    org.label-schema.name="jumanjiman/state" \
    org.label-schema.description="minimal image for devenv data volume" \
    org.label-schema.url="https://github.com/jumanjihouse/devenv" \
    org.label-schema.vcs-url="https://github.com/jumanjihouse/devenv.git" \
    org.label-schema.docker.dockerfile="/state/Dockerfile" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${GIT_REF}" \
    org.label-schema.license="GPLv2" \
    org.label-schema.version="1"

# This is a kludge to make the image larger than 0 bytes
# because `docker save` fails on zero-size image.
COPY Dockerfile /media/state/

VOLUME ["/home/user", "/media/state"]
ENTRYPOINT ["true"]
