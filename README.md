# ethereum_cosmo
Vagrant environment for Ethereum geth CLI + Cosmo IDE

Meteor dapp for building and vetting solidity contracts.

http://cosmo.to/

## How to install

NOTE: instractions assume Ubuntu 12.04 LTS x86_64 host OS (modify for your host OS)

1. OPTIONAL: Configure git and github on your host OS. You should use SSH authentication.

    [Generating SSH keys](https://help.github.com/articles/generating-ssh-keys)


2. Install latest VirtualBox from https://www.virtualbox.org/wiki/Downloads
    ``` bash
    cd ~/Downloads
	wget http://download.virtualbox.org/virtualbox/4.3.26/virtualbox-4.3_4.3.26-98988~Ubuntu~precise_amd64.deb
	sudo dpkg -i virtualbox-4.3_4.3.26-98988~Ubuntu~precise_amd64.deb

	VBoxManage --version

	# if doesn't work then run:
	sudo /etc/init.d/vboxdrv setup
    ```

3. Install latest Vagrant from https://www.vagrantup.com/downloads.html
    ``` bash
	cd ~/Downloads/
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
	sudo dpkg -i vagrant_1.7.2_x86_64.deb

	# update PATH in your ~/.bashrc
	echo 'export PATH=$PATH:/opt/vagrant/bin' > ~/.bashrc

	vagrant version
    ```
    
    The output should be:

    ```
    Installed Version: 1.7.2
    Latest Version: 1.7.2
     
    You're running an up-to-date version of Vagrant!
    ```

4. Do:

    ``` bash
    mkdir -p ~/ws
    cd ~/ws
    git clone git@github.com:nivertech/ethereum_cosmo.git
    cd ethereum_cosmo
    ```    

6. Provision VM:
    ``` bash
    vagrant up
    ```

7. This will take some time ~5 min (depending on your network).

8. Run Cosmo IDE meteor app:
    ``` bash
	vagrant ssh

	# run meteor
	cd meteor-dapp-cosmo/app
	meteor
	```

8. In another terminal window

	``` bash
	vagrant ssh

	# run geth CLI client
	geth -datadir ./data_meetup account new

	   Welcome to the
	      FRONTIER

	Your new account is locked with a password. Please give a password. Do not forget this password.
	Passphrase: 
	Repeat Passphrase: 
	Address: {bf1..........................76f}
	
	# NOT SURE:  --rpccorsdomain='*' is needed
	geth --rpc --rpcport='3000' --rpcaddr='0.0.0.0' --rpccorsdomain='*' --datadir ./data_meetup --bootnodes enode://37e74db654b6ebe91aec9799eef26aed2578dbc9351adc8cdab54d63943ee70da736ee88000257735e71c74d7ea229b87b2971a7a8de5b83e5848b58d972503f@192.168.30.198:30303 --networkid 198804 console 2>ethereum.log

	```
