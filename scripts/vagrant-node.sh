#!/bin/sh -e

# install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# source .profile after nvm install to find nvm
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

# change into the project directory
cd /vagrant


# install Node.js
nvm install 2>/dev/null
# Set default node.js version
nvm alias default $(node --version)
# upgrade npm to v2 if it's v1
npm --version | grep -q -E '^1' &&  npm install -g npm@2

# install app dependencies
rm -rf node_modules/  # remove existing node modules
npm install           # install new ones
