#! /bin/bash

ansible-playbook -i localhost, -c local --ask-become-pass --extra-vars "install_gui_apps=yes" playbook.yml

exit $?
