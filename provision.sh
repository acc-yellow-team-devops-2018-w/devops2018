#!/bin/bash -eu

export DEBIAN_FRONTEND=noninteractive

echo "Setting timezone..."
	timedatectl set-timezone Europe/Riga

echo "Updating package index..."
 	# Prevents apt-get from looking for old versions and failing
 	apt-get update > /dev/null

echo "Installing Vim..."
	apt-get install vim -y > /dev/null

echo "Installing htop..."
	apt-get install htop -y > /dev/null

echo "Installing tree..."
	apt-get install tree -y > /dev/null

echo "Installing tmux..."
	apt-get install tmux -y > /dev/null

echo "Installing Git..."
    apt-get install git -y > /dev/null

echo "Installing ShellCheck..."
	apt-get install shellcheck -y > /dev/null

echo "Installing dos2unix..."
	apt-get install dos2unix -y > /dev/null

echo "Installing pip2 & 3..."
	apt-get install python-pip -y > /dev/null	
	apt-get install python3-pip -y > /dev/null

echo "Installing ipython2 & 3..."
	apt-get install ipython ipython3 -y > /dev/null

echo "Installing Docker..."
 	apt-get install apt-transport-https ca-certificates -y > /dev/null && \
 	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D > /dev/null && \
 	echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list && \
 	apt-get update > /dev/null && \
 	apt-get install docker-engine -y > /dev/null && \
 	service docker start

echo "Configuring docker..."
	usermod -aG docker vagrant

echo "Installing Docker Compose..."
	pip install docker-compose > /dev/null

echo "Installing maven..."
	apt-get install maven -y > /dev/null

echo "Creating jenkins directory..."
	mkdir /home/vagrant/jenkins/

echo "Setting aliases..."
	echo "alias c=clear" >> /home/vagrant/.bash_aliases

echo "Getting Vundle for Vi..."
	git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim

echo "Configuring swap space..."
	fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && \
	echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab

echo "Tryinging to bring up docker compose"
	cd ..
	cd ..
	cd vagrant
	cd tools/tools/
	mkdir -p logs
	touch logs/biglog.log 
	sudo docker-compose up --force-recreate >logs/biglog.log -d
echo "Installing java8"
	cd  res
	sudo cp java-8-debian.list /etc/apt/sources.list.d/
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	sudo apt-get update > /dev/null
	sudo apt-get install -y python-software-properties debconf-utils
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
	sudo apt-get install -y oracle-java8-installer 
	

echo "Done!"
