#!/bin/bash
cd `dirname $0`

ansible-playbook -f 5 --ssh-common-args="$ANSIBLE_SSH_COMMON_ARGS" -i "$@" yml_books/ssh.yml yml_books/install_init.yml yml_books/install_docker.yml yml_books/redis.yml
