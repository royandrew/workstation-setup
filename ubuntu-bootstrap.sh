#!/bin/bash

set -e

apt update;

apt install -y software-properties-common;

apt-add-repository --yes --update ppa:ansible/ansible;

apt install ansible;

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exit $?