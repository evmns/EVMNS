# pull the latest image
FROM evmns/development:0.0.2
WORKDIR /app/evmnscontract

CMD git pull && yarn install && yarn hardhat node

