#!/bin/bash
export LC_ALL="C.UTF-8"
export LANG="C.UTF-8"
export JAVA_HOME=/usr/lib/jvm/jdk-21.0.1

echo "[*] Looking for JAVA..."
cd $HOME
if [ ! -d /usr/lib/jvm/jdk-21.0.1 ]
then
    echo "[*] Installing java..."
    wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
    tar -xvf *tar.gz
    sudo mkdir -p /usr/lib/jvm
    rm jdk*tar.gz
    sudo mv jdk-21.0.1 /usr/lib/jvm
fi

echo "[*] Looking for Jericoin Client..."
cd $HOME
if [ ! -d /opt/besu ]
then
    echo "[*] Installing Jericoin Client..."
    wget https://hyperledger.jfrog.io/artifactory/besu-binaries/besu/23.7.1/besu-23.7.1.tar.gz
    tar -xvf *tar.gz
    rm besu*tar.gz
    mv besu* besu
    sudo mv besu* /opt
    sudo ln -s /opt/besu/bin/besu /usr/bin/jericoin
fi

while [ -d $HOME/Jericoin/jhl/data/database ]
do 
    echo "[*] Starting node. Press Control-C to stop node..."
    cd $HOME/Jericoin/jhl
    jericoin --config-file=config.toml
    cp $HOME/Jericoin/jhl/data/key $HOME/.bku.key
    echo "[*] Key saved. Press Control-C again to exit."
    sleep 5
done

echo "[*] Preparing Installation.."
echo "[*] Installing deps..."
sudo apt -y update
sudo apt -y install git

echo "[*] Starting Jericoin node. Press Control-C to stop node..."
if [ ! -d $HOME/Jericoin/jhl ]
then
    cd $HOME
    git clone https://github.com/JericoinProject/Jericoin
fi
cd Jericoin/jhl

while [ 1 == 1 ]
do
    if [ -f $HOME/.bku.key ]
    then
	mv $HOME/.bku.key $HOME/Jericoin/jhl/data/key
    fi
    jericoin --config-file=config.toml
    sleep 5
done

