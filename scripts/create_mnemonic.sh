#!/bin/bash

rm -rf files/validator_keys
docker run -it --rm -v $(pwd)/files/validator_keys:/app/validator_keys repo.mind-dev.com/santiops/staking-deposit new-mnemonic  --num_validators=$NUM_VALIDATORS  --folder=/app --devnet_chain_setting='{"network_name":"sanchain-pos-dev","genesis_fork_version":"0x20000089","genesis_validator_root": "0x6d87d2c51a33c3b0158d9e0670a24657c95218c7de7b5e5183723dfbb1213c40"}' --eth1_withdrawal_address=$WALLET