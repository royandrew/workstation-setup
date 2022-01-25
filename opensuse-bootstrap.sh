#! /bin/bash

set -e

zypper ref;

zypper in ansible;

exit $?