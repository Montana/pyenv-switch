#!/bin/bash

if ! command -v pyenv &> /dev/null
then
    echo "pyenv could not be found. Please install pyenv first."
    exit 1
fi

if [ -z "$1" ]
then
    echo "No Python version provided. Usage: ./change_pyenv_version.sh <version>"
    exit 1
fi

PYTHON_VERSION=$1

if ! pyenv versions --bare | grep -q "^${PYTHON_VERSION}$"
then
    echo "Python version ${PYTHON_VERSION} is not installed. Installing it now..."
    pyenv install ${PYTHON_VERSION}
fi

pyenv global ${PYTHON_VERSION}

pyenv rehash

echo "Switched to Python version ${PYTHON_VERSION}"
