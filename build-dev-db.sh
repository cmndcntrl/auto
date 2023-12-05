#!/bin/bash

# Add user 'dev' and set password, then add to 'sudo' group
sudo useradd dev && echo 'dev:P05tGr35D3v!' | sudo chpasswd && sudo usermod -aG sudo dev

# Install PostgreSQL
sudo apt-get install postgresql -y

# Execute PostgreSQL commands as the 'postgres' user
sudo -u postgres psql <<EOSQL
CREATE DATABASE users;
CREATE USER dev WITH PASSWORD 'P05tGr35D3v!';
GRANT ALL PRIVILEGES ON DATABASE users TO dev;
\c users
CREATE TABLE users ( id SERIAL PRIMARY KEY, username VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(100) NOT NULL);
INSERT INTO users (username, password) VALUES ('admin', 'P05tGr35!');
INSERT INTO users (username, password) VALUES ('dev', 'P05tGr35D3v!');
ALTER TABLE users OWNER TO dev;
EOSQL

echo "Script execution completed!"