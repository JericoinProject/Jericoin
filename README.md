# Jericoin
<strong>Jericoin </strong>

Jericoin is a proof of Authority coin, It uses evm technology to take advantage of its full potential,<br>
from simple transactions to more complex contracts, using validators for the signature of the blocks,<br>
carrying out faster transactions.<br>
<br>More Info at <br>
Discord https://discord.gg/xuEVagA8AT
<br><br><strong> Coin Specs </strong>

<ul>
  <li>Consensus : QBFT (https://entethalliance.github.io/client-spec/qbft_spec.html)</li>
  <li>Ticker : JHL
  <li>Block Reward : 0.001</li>
  <li>Max. Supply : Unlimited</li>
  <li>PoA Blocks : 0 - Infinite</li>
  <li>Block time : 10 Seconds</li>
  <li>DefaultPorts : 30303(p2p) - 8545(rpc)</li>
  <li>Chain ID : 707007</li>
  <li>Block Explorer : (https://isa.explorer.jericoin.com)</li>
  <li>Blockchain : Jericoin Hosting Legacy
  <li>rpcUrl : https://rpc.jsc.jericoin.com</li>
  <li>Decimals: 18</li>
 </ul>
  
# How to download software requirements to be Validator
1. Install JDK-21
  $ cd $HOME
  $ wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz
  $ tar -xvf jdk-21_linux-x64_bin.tar.gz
  $ sudo mkdir /usr/lib/jvm/
  $ sudo mv jdk-21 /usr/lib/jvm/
  Next, append this line in .bashrc
  $  vim ~/.bashrc
      export JAVA_HOME=/usr/lib/jvm/jdk-21
2. Download Ethereum Client
  $ cd $HOME
  $ wget https://hyperledger.jfrog.io/artifactory/besu-binaries/besu/23.7.1/besu-23.7.1.tar.gz
  $ tar -xvf besu-23.7.1.tar.gz
  $ sudo mv besu-23.7.1 /opt/
  $ sudo ln -s /opt/besu-23.7.1/bin/besu /usr/bin/besu
