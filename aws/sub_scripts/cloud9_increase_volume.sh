#!/bin/bash

read -p "Enter new volume size in GB [100]: " user_input
value=${user_input:-100}

TOKEN=`curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
aws ec2 modify-volume --volume-id "$(aws ec2 describe-volumes --filters "Name=attachment.instance-id,Values=$(curl -s http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN")" --query 'Volumes[*].{ID:VolumeId}' --output text)" --size "$value"

read -p "Need reboot to refresh volume size. Data may be removed.
Do you want to restart the machine? (y/n): " answer

if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
    sudo reboot
else
    echo "Machine will not be restarted."
fi
