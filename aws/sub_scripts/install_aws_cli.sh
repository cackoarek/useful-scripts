#!/bin/bash

if command -v aws &> /dev/null; then
    echo "AWS CLI is already installed."
else
    #### version 1:
#    sudo apt-get update
#    sudo apt-get install python3-pip -y
#    pip3 install awscli

    #### version 2:
    sudo snap install aws-cli --classic
    echo -e "Please run:\n
    aws configure
    or
    paste aws cli file to: mkdir -p ~/.aws; vi ~/.aws/credentials"
fi
