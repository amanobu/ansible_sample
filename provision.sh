#!/bin/sh

if ! [ `which ansible` ]; then
  sudo yum update -y
  sudo yum install -y ansible
fi

sudo ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/play_book.yml 
