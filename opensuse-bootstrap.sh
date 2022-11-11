#! /bin/bash

set -e

zypper ref;

zypper in ansible;

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exit $?