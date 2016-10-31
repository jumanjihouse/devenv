Overview
========

Containerized development environment
that consists of two containers per user:

* *App*: stateless, upgradable, ephemeral applications
* *State*: persistent user data

Source: https://github.com/jumanjihouse/devenv

Docker Hub:

* https://registry.hub.docker.com/u/jumanjiman/devenv/<br/>
  [![Download size](https://images.microbadger.com/badges/image/jumanjiman/devenv.svg)](http://microbadger.com/images/jumanjiman/devenv "View on microbadger.com")&nbsp;
  [![Version](https://images.microbadger.com/badges/version/jumanjiman/devenv.svg)](http://microbadger.com/images/jumanjiman/devenv "View on microbadger.com")&nbsp;
  [![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/devenv.svg)](https://registry.hub.docker.com/u/jumanjiman/devenv 'Docker Hub')&nbsp;
  [![Circle CI](https://circleci.com/gh/jumanjihouse/devenv.png?circle-token=b4d2a18e7ef854f112dad2d5f426d026ee38ca8c)](https://circleci.com/gh/jumanjihouse/devenv/tree/master 'View CI builds')

* https://registry.hub.docker.com/u/jumanjiman/state/<br/>
  [![Download size](https://images.microbadger.com/badges/image/jumanjiman/state.svg)](http://microbadger.com/images/jumanjiman/state "View on microbadger.com")&nbsp;
  [![Version](https://images.microbadger.com/badges/version/jumanjiman/state.svg)](http://microbadger.com/images/jumanjiman/state "View on microbadger.com")&nbsp;
  [![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/state.svg)](https://registry.hub.docker.com/u/jumanjiman/state 'Docker Hub')&nbsp;
  [![Circle CI](https://circleci.com/gh/jumanjihouse/devenv.png?circle-token=b4d2a18e7ef854f112dad2d5f426d026ee38ca8c)](https://circleci.com/gh/jumanjihouse/devenv/tree/master 'View CI builds')


How-to
======

to-do


Administrivia
=============

Build integrity
---------------

An unattended test harness builds the images on CircleCI and
runs tests with [BATS](https://github.com/sstephenson/bats).<br/>
If all tests pass on master branch, push the built images to Docker Hub.

<img
  src="https://github.com/jumanjiman/docker-duoauthproxy/blob/master/assets/docker_hub_workflow.png"
  align="middle"
  alt="workflow"
  title="workflow"
  width="75%"
/>

Docker tags for app image:

* optimistic: `latest`
* pessimistic: `${build_date}-git-${hash}`

Docker tags for state image:

* pessimistic: `${hash-of-state/Dockerfile}`


License
-------

GPLv2. See [`LICENSE`](LICENSE) in this repo.
