#! /bin/bash

ansible-playbook -c local --ask-become-pass playbook.yml

exit $?