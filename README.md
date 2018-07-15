Overview
========

Containerized development environment
with optional [Duo](https://duo.com/) two-factor authentication
that consists of two containers per user:

* *App*: stateless, upgradable, ephemeral applications
* *State*: persistent user data

Source: https://github.com/jumanjihouse/devenv

Docker Hub:

* https://registry.hub.docker.com/u/jumanjiman/devenv/<br/>
  [![Download size](https://images.microbadger.com/badges/image/jumanjiman/devenv.svg)](http://microbadger.com/images/jumanjiman/devenv "View on microbadger.com")&nbsp;
  [![Version](https://images.microbadger.com/badges/version/jumanjiman/devenv.svg)](http://microbadger.com/images/jumanjiman/devenv "View on microbadger.com")&nbsp;
  [![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/devenv.svg)](https://registry.hub.docker.com/u/jumanjiman/devenv 'Docker Hub')&nbsp;
  [![Circle CI](https://circleci.com/gh/jumanjihouse/devenv.png?style=svg&circle-token=b4d2a18e7ef854f112dad2d5f426d026ee38ca8c)](https://circleci.com/gh/jumanjihouse/devenv/tree/master 'View CI builds')

* https://registry.hub.docker.com/u/jumanjiman/state/<br/>
  [![Download size](https://images.microbadger.com/badges/image/jumanjiman/state.svg)](http://microbadger.com/images/jumanjiman/state "View on microbadger.com")&nbsp;
  [![Version](https://images.microbadger.com/badges/version/jumanjiman/state.svg)](http://microbadger.com/images/jumanjiman/state "View on microbadger.com")&nbsp;
  [![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/state.svg)](https://registry.hub.docker.com/u/jumanjiman/state 'Docker Hub')&nbsp;
  [![Circle CI](https://circleci.com/gh/jumanjihouse/devenv.png?style=svg&circle-token=b4d2a18e7ef854f112dad2d5f426d026ee38ca8c)](https://circleci.com/gh/jumanjihouse/devenv/tree/master 'View CI builds')


How-to
======

Background
----------

For authentication, we assume two things:

* Duo configuration variables are properly set in `global.conf`,
  probably controlled by an organization's administrator(s)
  with proper config management.

* The user controls their own SSH authorized public keys on Github.
  The app container fetches these public keys at each login attempt.

The instructions below rely on systemd instantiated units to
create per-user development environments.

* `/etc/systemd/system/devenv\@.service` is the systemd unit file.

* `/etc/devenv/global.conf` is a set of default configuration parameters.

* `/etc/devenv/<user>.conf` provides per-user parameters, such as
  the user's SSH port, Github handle, and Duo username.

* `/etc/devenv/login_duo.conf` is a template that gets copied
  into the per-user app container and adapted for each user
  based on both `global.conf` and `<user>.conf`.

:warning: If you do not use Duo for two-factor authentication,
set `DUO=false` in `/etc/devenv/global.conf`.


Quick-start
-----------

1. Spin up a systemd-based host, such as a CoreOS VM on Digital Ocean,
   then login to the new host.

1. Clone this repo to the new host:

   ```
   git clone https://github.com/jumanjihouse/devenv.git
   cd devenv/
   ```

1. Copy the startup configs to the new host:

   ```
   sudo cp -r host-configs/* /
   ```

1. Edit `/etc/devenv/global.conf` to specify options that should
   apply by default to every devenv instance.

1. Copy `/etc/devenv/user.conf` to a per-user config and edit:

   ```
   sudo cp /etc/devenv/user.conf /etc/devenv/yourname.conf
   sudo vi /etc/devenv/yourname.conf
   ```

   The name of the per-user config file only matters for systemd.
   The name of the file is ignored.

1. Start the per-user instance:

   ```
   sudo systemctl daemon-reload
   sudo systemctl start devenv@yourname

   journalctl -fu devenv@yourname
   ```


Upgrade the app image
---------------------

1. Edit the global config to specify a recent docker tag:

   ```
   sudo vi /etc/devenv/global.conf
   ```

1. Restart your devenv instance:

   ```
   sudo systemctl restart devenv@yourname
   journalctl -fu devenv@yourname
   ```


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


SSH Configuration Checks
------------------------

Tools to check ssh configuration:

* https://sshcheck.com/
* https://github.com/jumanjihouse/docker-ssh-scan


License
-------

GPLv2. See [`LICENSE`](LICENSE) in this repo.
