#!/bin/bash

echo "Choose an option:"
echo "1. Increase volume size"
echo "2. Install and run jupyter-spark"

read -p "Enter your choice (1 or 2): " choice

case "$choice" in
    1)
        echo "You chose Option 1: Increase volume size"
        current_dir=$(dirname "$(readlink -f "$0")")

        cloud9_increase_volume_path="$current_dir/../sub_scripts/cloud9_increase_volume.sh"
        bash "$cloud9_increase_volume_path"
        # Sprawdź, czy plik skryptu istnieje
        if [ -e "$cloud9_increase_volume_path" ]; then
            # Uruchom inny skrypt
            bash "$cloud9_increase_volume_path"
        else
            echo "Script 'cloud9_increase_volume.sh' not found."
        fi
        ;;
    2)
        echo "You chose Option 2: Install and run jupyter-spark"
        current_dir=$(dirname "$(readlink -f "$0")")

        docker_compose_script_path="$current_dir/../sub_scripts/docker-compose_install.sh"
        bash "$docker_compose_script_path"

        jupyter_spark_script_path="$current_dir/../jupyter-spark_docker_install.sh"
        bash "$jupyter_spark_script_path"

        open_port_script_path="$current_dir/../sub_scripts/open_specific_port_public.sh"
        bash "$open_port_script_path 8888"
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        ;;
esac