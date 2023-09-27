# Running SANR Network node in readonly mode
 
## Minimum requirements
- [Ubuntu latest](https://ubuntu.com/server)
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
git clone git@github.com:santiment/sanr-pos-network.git .
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
ln -s docker-compose-readonly.yml docker-compose.yml
```

### 1.5 Launch the Project
```shell
docker compose up -d
```
# Running SANR Network node in signer mode

## Minimum requirements
- [Ubuntu latest](https://ubuntu.com/server)
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/engine/install/ubuntu/)
- Ethereum wallet (ERC-20 with full access)

## 1. Environment setup
### 1.1 Create a directory and Navigate to it
```shell
mkdir -p /opt/sanchain/signer
```
```shell
cd /opt/sanchain/signer
```

### 1.2 Clone the Project
```shell
git clone git@github.com:santiment/sanr-pos-network.git .
```

### 1.3 Configuration and settings edit
```shell
mv env.example .env
```
```shell
nano .env
```
- `EXTERNAL_IP`=Server external address
- `NUM_VALIDATORS`=Number of validators
- `REWARD_RECIPIENT_ADDRESS`=Reward recipient address **(you should have access to this account)**

## 2. Run `./scripts/create_mnemonic.sh`
Follow these steps:
- Choose language: `English`
- Specify the number of validators: `1`
- Enter account address from .env (REWARD_RECIPIENT_ADDRESS) **(you should have access to this account)**
- Confirm account address
- Choose language: `English`
- Enter a password for the validator keystore **(record and store in a secure place)**
- Confirm the password
- The generated mnemonic will be displayed **(record and store in a secure place)**
- Enter the mnemonic again
  After successful execution, a `files/validator_keys` directory will be created.

## 3. Send `files/validator_keys/deposit_data-*.json` to [info@sanr.network](mailto:info@sanr.network)

## 4. Validator wallet creation
### 4.1 Create a password for the validator wallet
```shell
echo "someStrongPassword" > files/validator.txt
```
**(replace someStrongPassword to password which you want to use)**

### 4.2 Execute the script `./scripts/create_validator_wallet.sh`
- Wallet password: Enter the password created in **Step 4.1**
- Enter the password for your imported accounts: Enter the password for the validator keystore from **Step 2**
  After successful execution, a `files/wallet` folder will be created.

## 5. Startup
### 5.1 Create Geth home directory
```shell
./scripts/gen_home_dir_geth.sh
```

### 5.2 Configure the Node Type
```shell
ln -s docker-compose-validator.yml docker-compose.yml
```

### 5.3 Launch the Project
```shell
docker compose up -d
```
