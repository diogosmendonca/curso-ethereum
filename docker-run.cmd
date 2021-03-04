docker stop ethereum-node
docker rm ethereum-node
docker run -d --name ethereum-node -v <endereço da sua pasta onde está o customGenesis.js local no seu PC>:/root -p 8545:8545 -p 8544:8544 -p 30301:30301 -p 30302:30302 -it --entrypoint=/bin/sh ethereum/client-go
docker exec -it ethereum-node sh -c "cd root; exec "${SHELL:-sh}""
