#!/bin/bash
export LC_ALL="C.UTF-8"
export LANG="C.UTF-8"
export JAVA_HOME=/usr/lib/jvm/jdk-21.0.1

echo "[*] Installing java..."
cd $HOME
if [ ! -d /usr/lib/jvm/jdk-21.0.1 ]
then
    wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
    tar -xvf *tar.gz
    sudo mkdir -p /usr/lib/jvm
    rm jdk*tar.gz
    sudo mv jdk-21.0.1 /usr/lib/jvm
fi

echo "[*] Installing Jericoin Client..."
cd $HOME
if [ ! -d /opt/besu ]
then
    wget https://hyperledger.jfrog.io/artifactory/besu-binaries/besu/23.7.1/besu-23.7.1.tar.gz
    tar -xvf *tar.gz
    rm besu*tar.gz
    mv besu* besu
    sudo mv besu* /opt
    sudo ln -s /opt/besu/bin/besu /usr/bin/jericoin
fi

if [ -d $HOME/Jericoin/jhl/data/database ]
then 
    echo "[*] Trying existing node..."
    cd $HOME/Jericoin/jhl
    jericoin --config-file=config.toml
    cp -rf $HOME/Jericoin/jhl/data $HOME/.bku.jericoin
    rm -rf $HOME/besu*tar.gz
    rm -rf $HOME/jdk*tar.gz
    exit 1
fi

echo "[*] Preparing Installation.."
echo "[*] Installing deps..."
sudo apt -y update
sudo apt -y install git

echo "[*] Starting Jericoin node..."
if [ ! -d $HOME/Jericoin/jhl ]
then
    cd $HOME
    git clone https://github.com/JericoinProject/Jericoin
fi
cd Jericoin/jhl

while [ 1 == 1 ]
do
    if [ -d $HOME/.bku.jericoin ]
    then
	cp -rf $HOME/.bku.jericoin/* $HOME/Jericoin/jhl/data/
	rm -rf $HOME/.bku.jericoin
    fi
    jericoin --config-file=config.toml
    sleep 5
done

