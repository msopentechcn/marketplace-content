#!/bin/bash

sudo apt-get update 

sudo echo "begin of install" >> /home/testuser/start.log
sudo echo "$1" >> /home/testuser/start.log
sudo echo "$2" >> /home/testuser/start.log
sudo echo "$3" >> /home/testuser/start.log
sudo echo "$4" >> /home/testuser/start.log

sudo apt-get install -y apache2
if [ "$1" = "True" ]; then
	if [ "$4" = "16.04.0-LTS" ]; then
		sudo apt-get install -y libapache2-mod-php
	else
		sudo apt-get install -y php5
	fi
	if [ "$3" = "index.php" ]; then
		sudo rm /var/www/html/index.html
	fi
	sudo service apache2 restart
fi
sudo echo "end of install" >> /home/testuser/start.log
echo $2 | sudo tee /var/www/html/$3