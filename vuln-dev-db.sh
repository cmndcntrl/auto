sudo useradd dev && echo 'dev:P05tGr35D3v!' | sudo chpasswd && sudo usermod -aG sudo dev

apt-get install postgresql -y

sudo -u postgres psql