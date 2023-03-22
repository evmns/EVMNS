# EVMNS 

[![Software License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](./LICENSE)

EVMNS (EVM Name Service) is a distributed, open and extensible multi-chain DID domain name system built on EVM and EOS, relying on the high performance, security and reliability of EOS to better and seamlessly connect people, information, assets, dApps, etc. in the WEB3 world.

EVMNS domains use the ERC721 protocol standard with .evm as the domain suffix, such as abc.evm, 123.evm, jack.evm, etc., to map human-readable and easy-to-remember names with all kinds of content at the same time, including but not limited to EVM addresses, EOS addresses, other cryptocurrency addresses, content hashes, URLs, and metadata.

# Our official website.

https://evmns.space


# Development

During the development phase, we will be using Docker images to provide a standardized development environment for the team, and continuously update it as development progresses.

## Docker Images
https://hub.docker.com/repository/docker/evmns/development


### Opening a terminal

To open a terminal, use the Terminal drop-down menu in the IDE user interface.

### Run a Docker image

```
docker run -dp 3000:3000 evmns/development:0.0.1 

```

### Run it from sources

```
git clone xxxxxxxxx/evmns.git
yarn install
yarn buildit

```

## Run test

The source code for the unit test is at the `tests` directory within the IDE. To build the tests, run this in the terminal:

```
yarn test

```
