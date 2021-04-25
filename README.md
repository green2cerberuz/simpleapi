# SimpleApi

Making a basic api with nodejs express framework and prism orm.

Base image already have installed yarn so we only need to use it.

## Some commands for docker development

## Git Hooks

This projects uses the preparee-commit-message hook to add the branch name to our commit
message. The script can be found at `scripts/prepare-commit-message.sh`. If you want to activate it, yo need to add the following line to `.git/hooks/prepare-commit-message` file after the variable declarations.

`./scripts/prepare-commit-message.sh $COMMIT_MSG_FILE`

## Semantic versioning

This project uses semantic versioning with appversion package. To initialize it run:

```init
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv init
```

To update a version run:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv update <patch/minor/major>
```

To generate a badge:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv generate-badge <version/status>
```

To set project status:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv set-status <stable/rc/beta/alpha>
```
