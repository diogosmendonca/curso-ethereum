#cria duas contas
geth account new --datadir ~/Node_1
geth account new --datadir ~/Node_2

#colocar o saldo nas contas no customGenesis.json (opcional)
"alloc": {
  "<endereço da conta 1>": {
    "balance": "<algum saldo inteiro positivo>"
  },
  "<endereço da conta 2>": {
    "balance": "<algum saldo inteiro positivo>"
  }
}

#inicializa os nós na rede com o bloco genesis.
geth init customGenesis.json --datadir ~/Node_1
geth init customGenesis.json --datadir ~/Node_2

#coloca os nós da rede para rodar (um em cada console)
geth --datadir ~/Node_1 --maxpeers 95 --networkid 13 --nodiscover --rpc --rpccorsdomain "*" --port 30301 --rpcport 8544 --rpcapi="txpool,eth,net,web3,personal,admin,miner" --allow-insecure-unlock console
geth --datadir ~/Node_2 --maxpeers 95 --networkid 13 --nodiscover --rpc --rpccorsdomain "*" --port 30302 --rpcport 8545 --rpcapi="txpool,eth,net,web3,personal,admin,miner" --allow-insecure-unlock console

#----------------- no console do geth --------------

#consulta quantos pares possui
net.peerCount
#adiciona um par
admin.addPeer(<eNode of the other node>);
#conta os pares
net.peerCount
#exibe informações sobre os pares
admin.peers

#exibe as contas
eth.accounts
#cria uma nova conta
personal.newAccount()
#exibe as contas
eth.accounts

#verifica o saldo da conta
eth.getBalance(<account>)

#inicia a mineração com 4 threads
miner.start(4)
#para a mineração
miner.stop()

#verifica o pool de transações
txpool.status

#libera a conta para uso
personal.unlockAccount(<address>,<password>,<duration in sec>)
#envia uma transação
eth.sendTransaction({from:<address>, to:<address> , value: <value>})

txpool.status


