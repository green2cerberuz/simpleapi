# SimpleApi

[![AppVersion-version](https://img.shields.io/badge/AppVersion-1.0.0-brightgreen.svg?style=flat)](https://github.com/delvedor/appversion?#version)

[![AppVersion-status](https://img.shields.io/badge/Status-beta-brightgreen.svg?style=flat)](https://github.com/delvedor/appversion?#status)

Making a basic api with nodejs express framework and prism orm.

Base image already have installed yarn so we only need to use it.

## Requirements

To use this project you need the following.

- pyenv
- docker

If you don't want to install pyenv, install docker-compose for you system.

## Usage

To initialize the project for first time run:
`make init`

This will check if you have pyenv installed. If installed will update it and
create a virtual env called `simpleapp-env` and then will install docker-compose.

Then run:
`pyenv activate simpleapi-env`

and finally:

`make`

## Git Hooks

This projects uses the preparee-commit-message hook to add the branch name to our commit
message. The script can be found at `scripts/prepare-commit-message.sh`. If you want to activate it, yo need to add the following line to `.git/hooks/prepare-commit-message` file after the variable declarations.

`./scripts/prepare-commit-message.sh $COMMIT_MSG_FILE`

## Commands

To generate a badge for the project run:

`make apv.generatebadge`

To generate the status badge run:

`make apv.generatestatus`

To update the version run:

`make apv.updateversion version=<major/minor/patch>`

To set the status badge run:

`make apv.setstatus status=<stable/rc/beta/alpha>`
