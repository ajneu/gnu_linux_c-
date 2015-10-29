#/usr/bin/env bash

SCRIPT_PATH=$(readlink -f "$BASH_SOURCE")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

is_root () {
    return $(id -u)
}

if is_root; then
    echo "Error: need to call this script as a normal user, not as root!"
    exit 1
fi

prepare_sudo () {
    echo "Will now call:   sudo ..."
}



cd /tmp
git clone https://github.com/PhrozenByte/rmtrash.git
cd rmtrash

prepare_sudo
sudo apt-get update
sudo apt-get install trash-cli
sudo mkdir -p      /usr/local/bin

sudo cp rmtrash    /usr/local/bin/rmtrash
sudo chmod 755     /usr/local/bin/rmtrash

sudo cp rmdirtrash /usr/local/bin/rmdirtrash
sudo chmod 755     /usr/local/bin/rmdirtrash

cat <<EOF >> ~/.bash_aliases
alias rm='rmtrash'
alias rmdir='rmdirtrash'

# If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion. 
# http://www.gnu.org/software/bash/manual/bashref.html#Aliases
alias sudo='sudo '
EOF
