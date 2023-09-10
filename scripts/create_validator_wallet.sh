#!/bin/bash

rm -rf files/wallet

docker run -it --rm -v $(pwd)/files:/files  gcr.io/prysmaticlabs/prysm/validator:stable \
  wallet create --wallet-dir=/files/wallet --wallet-password-file=/files/validator.txt --keymanager-kind=imported --accept-terms-of-use
docker run -it --rm -v $(pwd)/files:/files  gcr.io/prysmaticlabs/prysm/validator:stable \
  accounts import --accept-terms-of-use --keys-dir=/files/validator_keys  --wallet-dir=/files/wallet