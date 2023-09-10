#!/bin/bash

rm -rf files/validator_keys
docker run -it --rm -v $(pwd)/files/validator_keys:/app/validator_keys repo.mind-dev.com/santiops/staking-deposit new-mnemonic  --num_validators=$NUM_VALIDATORS  --folder=/app --devnet_chain_setting='{"network_name":"sanchain-dev","genesis_fork_version":"0x20000089","genesis_validator_root": "0x15b699aab9e7ba7d4afd5ff9dd1083646d2f3f33b15878d11f859e374ae069ee"}' --eth1_withdrawal_address=$WALLET