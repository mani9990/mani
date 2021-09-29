#!/bin/bash

aws --version
for X in {1..1}; do
    echo "The value X is $X now..."
    sleep 2
done
for VOL in {1..5}
do
aws ec2 create-volume --volume-type gp2 --size 1 --availability-zone us-east-1a
sleep2
done
