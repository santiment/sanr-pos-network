#!/bin/bash

docker compose stop
docker compose rm -f 

rm -rf root_beaconchain/*
rm -rf root_validator/*
rm -rf root_signer/geth