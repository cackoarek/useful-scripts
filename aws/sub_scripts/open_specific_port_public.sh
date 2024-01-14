#!/bin/bash

if [ "$#" -ge 1 ]; then
  TOKEN=`curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
  aws ec2 authorize-security-group-ingress --group-name $(aws ec2 describe-instances --instance-ids $(curl -s http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN") --query 'Reservations[0].Instances[0].SecurityGroups[0].GroupName' --output text) --protocol tcp --port "$1" --cidr 0.0.0.0/0
else
  echo "No port provided."
fi

