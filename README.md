# *ETH Mainnet staking address: ```0xbFE5D25956F6D7CF212a24B628c7871A34c4465f```*
## 2000 SANs per validator (20 000 SANs max cup for stake)

# Running SANR Network node in signer mode
## Minimum requirements
 Running SANR Network node in readonly mode

## 1. Go to project
```shell
cd /opt/sanchain/readonly
```
### 1.2 Update latest changes
```shell
git pull
```
### 1.3 Stop node
```schell
./scripts/stop_clear.sh
```
### 1.4 Update configuration and settings edit
```shell
nano .env
```
 `EXTERNAL_IP`=Server external address
 `NUM_VALIDATORS`=Number of validators.**(Setup 10)**
 `REWARD_RECIPIENT_ADDRESS`=Reward recipient address **(you should have access to this account)**

## 2. Run `./scripts/create_mnemonic.sh`
Follow these steps:
 Choose language: `English`
 Specify the number of validators: `10`
 Enter account address from .env (REWARD_RECIPIENT_ADDRESS) **(you should have access to this account)**
 Confirm account address
 Choose language: `English`
 Enter a password for the validator keystore **(record and store in a secure place)**
 Confirm the password
 The generated mnemonic will be displayed **(record and store in a secure place)**
 Enter the mnemonic again
  After successful execution, a `files/validator_keys` directory will be created.

## 3. Attach `files/validator_keys/deposit_data.json` to  [dashboard](https://nodes.sanr.network)
## 4. Validator wallet creation
### 4.1 Create a password for the validator wallet
```shell
echo "someStrongPassword" > files/validator.txt
```
**(replace someStrongPassword to password which you want to use)**

### 4.2 Execute the script `./scripts/create_validator_wallet.sh`
 Wallet password: Enter the password created in **Step 4.1**
 Enter the password for your imported accounts: Enter the password for the validator keystore from **Step 2**
  After successful execution, a `files/wallet` folder will be created.
  
## 5. Startup
### 5.1 Create Geth home directory
```shell
./scripts/gen_home_dir_geth.sh
```

### 5.2 Configure the Node Type
```shell
rm -rf docker-compose.yml

ln -s docker-compose-validator.yml docker-compose.yml
```

### 5.3 Launch the Project
```shell
docker compose up -d
```



# Running SANR Network node in readonly mode
 
## Minimum technical requirements
- CPU 8 CORE
- MEMORY 16 GB
- HDD 300 GB SSD
- Static IP
## Recommended technical requirements 
- CPU 16 CORE
- MEMORY 32 GB
- HDD 300 GB SSD
- Static IP
## Software
- OS [Ubuntu latest](https://ubuntu.com/server)
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/engine/install/ubuntu/)

## 1. Environment setup
### 1.1 Create a directory and Navigate to it
```shell
mkdir -p /opt/sanchain/readonly
```
```shell
cd /opt/sanchain/readonly
```
### 1.2 Clone the Project
```shell
git clone https://github.com/santiment/sanr-pos-network.git .
```
### 1.3 Configuration and settings edit
```shell
mv env.example .env
```
```shell
nano .env
```
- `EXTERNAL_IP`=Server external address

### 1.4 Configure the Node Type
```shell
./scripts/gen_home_dir_geth.sh
ln -s docker-compose-readonly.yml docker-compose.yml
```

### 1.5 Launch the Project
```shell
docker compose up -d
```
