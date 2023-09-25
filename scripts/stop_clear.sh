#!/bin/bash

docker compose stop
docker compose rm -f 

rm -rf root_beaconchain/beaconchaindata
rm -rf root_beaconchain/metaData
rm -rf root_beaconchain/tosaccepted

rm -rf root_validator/*
rm -rf root_signer/geth