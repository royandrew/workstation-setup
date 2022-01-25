#! /bin/bash

ansible-playbook -c local --ask-become-pass --extra-vars "install_gui_apps=yes" playbook.yml

exit $?