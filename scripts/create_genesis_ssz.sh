#!/bin/bash

docker compose stop
docker compose rm -f 

rm -rf root_beaconchain/*

rm -rf root_validator/*

rm -rf root_signer/geth
rm -rf root_slasher/slache

rm -rf files/genesis.ssz

docker compose -f docker-compose-create-beaconchain-node.yml up -d