#!/bin/bash

wget "https://raw.githubusercontent.com/cmndcntrl/auto/main/fresh-ubun.sh"
bash fresh-ubun.sh

echo "What is the name of your app?"
read name

wget "https://raw.githubusercontent.com/cmndcntrl/auto/main/start-apache2.sh"
bash start-apache2.sh

cd /var/www/; mkdir apps; cd apps
git clone "https://github.com/cmndcntrl/ztsc.git"
mv ztsc $name
cd $name;

sed -i 's/ztsc/$name/g' 000-default.conf
sudo a2ensite 000-default.conf
virutalenv -p python3 $name # $name here begins representing the virutal environment
curl "https://raw.githubusercontent.com/cmndcntrl/auto/main/prep-flask-web.py" | python3
source $name/bin/activate
export FLASK_APP=$name.py # $name is the flask app name in this line