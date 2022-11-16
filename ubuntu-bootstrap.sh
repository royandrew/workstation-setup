#!/bin/bash

set -e

sudo apt update;

sudo apt install -y software-properties-common;

sudo apt-add-repository --yes --update ppa:ansible/ansible;

sudo apt install ansible;

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exit $?