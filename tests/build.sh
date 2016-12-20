#!/bin/bash

ansible-playbook build.yml

if [ "$?" == "0" ]; then
    ansible-container run
else
    cat build.out
fi 

docker ps

docker logs ansible_jenkins_1
