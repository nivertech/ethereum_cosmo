#! /bin/bash

sudo apt-get upgrade
sudo apt-get upgrade -f

sudo apt-get install -y git

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
#sudo add-apt-repository ppa:ethereum/ethereum-qt
sudo apt-get update
sudo apt-get install -y geth

# install Meteor
curl https://install.meteor.com/ | sh

# clone Cosmo git repo
#mkdir -p ~/ws
# clone Cosmo IDE
#cd ~/ws
#git clone git@github.com:SilentCicero/meteor-dapp-cosmo.git

# download Cosmo IDE source code
COSMO_BRANCH_OR_TAG='master'
COSMO_TAR=${COSMO_BRANCH_OR_TAG}.tar.gz
wget -q https://github.com/SilentCicero/meteor-dapp-cosmo/archive/${COSMO_TAR}
tar xzf ${COSMO_TAR}
rm ${COSMO_TAR}

echo ""
echo "start geth and meteor, then open in your browser http://localhost:3000"
echo "DONE!"
