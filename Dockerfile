# pull the latest image
FROM evmns/development:0.0.1
WORKDIR /app/emvnscontract
RUN git pull & yarn install 