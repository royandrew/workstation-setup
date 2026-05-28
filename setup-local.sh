#! /bin/bash

ansible-playbook -i localhost, -c local --ask-become-pass playbook.yml

exit $?
