#!/usr/bin/env bash

# Stop Script on Error
set -e

# For Debugging (print env. variables into a file)  
printenv > /var/log/colony-vars-"$(basename "$BASH_SOURCE" .sh)".txt

# Update packages and Upgrade system
echo "****************************************************************"
echo "Updating System"
echo "****************************************************************"
sudo apt-get update -y


echo "****************************************************************"
echo "Installing NodeJS"
echo "****************************************************************"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
sudo npm install npm --global



echo "****************************************************************"
echo "Get the web application from github"
echo "****************************************************************"
sudo mkdir /home/artifacts
cd /home/artifacts || exit
sudo git clone https://github.com/cloudshell-colony/sample_micro_services_nodejs_source.git


echo "****************************************************************"
echo "Installing applicaion dependencies"
echo "****************************************************************"
cd sample_micro_services_nodejs_source/payment-service || exit
sudo npm install;

echo "****************************************************************"
echo "Starting Server"
echo "****************************************************************"
cd /home/artifacts/sample_micro_services_nodejs_source/payment-service || exit

node app.js "$DATASTORE_ADDRESS":3004 > /dev/null &

