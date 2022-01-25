#!/bin/bash

set -e

brew install ansible;

ansible-galaxy collection install community.general;

exit $?