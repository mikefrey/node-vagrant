# add apt repository for Postgres
sudo add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# update package list
sudo apt-get update

# install git and curl
sudo apt-get install -y git-core curl

# install postgres 9.4
sudo apt-get install -y postgresql-9.4


# install nvm
curl -s https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
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
rm -rf node_modules/   # remove existing node modules
npm install
