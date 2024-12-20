#!/bin/bash

set -e

# Install prerequisites
sudo apt update
sudo apt install -y wget build-essential libsqlite3-dev

# Download and install the latest SQLite
SQLITE_VERSION="3420000"
wget https://www.sqlite.org/2024/sqlite-autoconf-$SQLITE_VERSION.tar.gz
tar xvfz sqlite-autoconf-$SQLITE_VERSION.tar.gz
cd sqlite-autoconf-$SQLITE_VERSION
./configure
make
sudo make install

# Verify the installation
sqlite3 --version

# Clean up
cd ..
rm -rf sqlite-autoconf-$SQLITE_VERSION.tar.gz sqlite-autoconf-$SQLITE_VERSION
echo "✅ SQLite has been installed successfully."
