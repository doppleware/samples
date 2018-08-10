#!/usr/bin/env bash

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
cd sample_micro_services_nodejs_source/order-service || exit
sudo npm install;

#!/usr/bin/env bash
echo "****************************************************************"
echo "Starting the node application"
echo "****************************************************************"
cd /home/artifacts/sample_micro_services_nodejs_source/order-service || exit

node app.js "$PAYMENTS_MS_ADDRESS":3001 "DATASTORE_MS_ADDRESS":3004 > /dev/null &


