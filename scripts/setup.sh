#!/bin/bash

PYTHON_VERSION=$1
VIRTUALENV_NAME=$2

set -x

if ![ -x "$(command -v pyenv)"  ]; then
    echo "Not pyenv executable installed in the system. Install pyenv to proceed";
fi

# activates virtualenv inside shell script
eval "$(pyenv init -)" 

# Update pyenv.
pyenv update

# Set a virtualenv with specified version
pyenv install $PYTHON_VERSION
pyenv virtualenv $PYTHON_VERSION $VIRTUALENV_NAME
pyenv activate $VIRTUALENV_NAME

pip install -r requirements.txt
