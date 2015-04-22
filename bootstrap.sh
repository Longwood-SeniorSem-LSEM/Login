#!/usr/bin/env bash

echo "Updating"
apt-get update > /dev/null

echo "Installing git and python"
apt-get install git -y
apt-get install python -y
apt-get install build-essential -y
apt-get install python-dev -y
apt-get install python-mysqldb -y
apt-get install python-pip -y
#pip install virtualenv virtualenvwrapper > /dev/null 2>&1
#apt-get install python-virtualenv -y > /dev/null

echo "Installing Apache"
apt-get install -y apache2 > /dev/null

echo "Linking /var/www to the shared /vagrant"
if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi

echo "Installing debconf"
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrantpass'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrantpass'

echo "Installing mysql"
apt-get install mysql-server -y > /dev/null
apt-get install libmysqlclient-dev -y > /dev/null


# echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bashrc
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
# set HOME='/home/vagrant'
# echo "export PROJECT_HOME=/var/www" >> ~/.bashrc
# source ~/.bashrc

#sudo --user=vagrant --set-home bash << EOF

echo "Installing from requirements.txt"
if [ -a /vagrant/requirements.txt ]; then
    sudo pip install -r /vagrant/requirements.txt
fi

echo "Setting up mysql test database"
if [ -a /vagrant/database/sql_setup.py ]; then
    cd /vagrant/database
    python /vagrant/database/sql_setup.py
fi

echo "Daemonizing log in."
if [ -a /vagrant/run.py ]; then
    cd /vagrant
    (python /vagrant/run.py) < /dev/null > /dev/null 2>&1 &
    disown
fi

#mysql --user=root --password=vagrantpass -e "create database test"
#EOF
echo "Vagrant Ready"
