#!/bin/bash

rm -rf files/validator_keys
docker run -it --rm -v $(pwd)/files/validator_keys:/app/validator_keys repo.mind-dev.com/sanchain/staking-deposit new-mnemonic  --num_validators=$NUM_VALIDATORS  --folder=/app --devnet_chain_setting='{"network_name":"sanchain-pos-dev","genesis_fork_version":"0x20000089","genesis_validator_root": "0xe770542f848ac24b8d9b38da6218cce20dc75f03f253d75c0f449fce2a2f9a4b"}' --eth1_withdrawal_address=$REWARD_RECIPIENT_ADDRESS