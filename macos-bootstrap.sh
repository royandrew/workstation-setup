#!/bin/bash

set -e

export PATH="/opt/homebrew/bin:$PATH"

brew install ansible;

ansible-galaxy collection install community.general;

exit $?