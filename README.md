
# *ETH Mainnet staking address: ```0xbFE5D25956F6D7CF212a24B628c7871A34c4465f```*

==2000 SANs per validator (20 000 SANs max cup for stake)==

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
### 1.3 Update configuration and settings edit
```shell
nano .env
```
`EXTERNAL_IP`=Server external address 

`NUM_VALIDATORS`=`1` **(put here validators amount what you want to run - maximum 10 validators per node)** 

 `REWARD_RECIPIENT_ADDRESS`=Reward recipient address **(you should have access to this account)**

## 2. Run `./scripts/create_mnemonic.sh` 
Follow these steps: 

Choose language: `English` 

Specify the number of validators: `1` **(put here validators amount from step 1.3)** 

Enter account address from .env (REWARD_RECIPIENT_ADDRESS) **(you should have access to this account)** 

Confirm account address 

Choose language: `English` 

Enter a password for the validator keystore **(record and store in a secure place)** 

Confirm the password 

The generated mnemonic will be displayed **(record and store in a secure place)** 

Enter the mnemonic again 

After successful execution, a `files/validator_keys` directory will be created.


## 3. Validator wallet creation
### 3.1 Create a password for the validator wallet
```shell
echo "someStrongPassword" > files/validator.txt
```
**(replace someStrongPassword to password which you want to use)**

### 3.2 Execute the script `./scripts/create_validator_wallet.sh`
 Wallet password: Enter the password created in **Step 3.1**
 
 Enter the password for your imported accounts: Enter the password for the validator keystore from **Step 2**
 
  After successful execution, a `files/wallet` folder will be created.
  
## 4. Startup
### 4.1 Create Geth home directory
```shell
./scripts/gen_home_dir_geth.sh
```

### 4.2 Configure the Node Type
```shell
rm -rf docker-compose.yml

ln -s docker-compose-validator.yml docker-compose.yml
```

### 4.3 Launch the Project
```shell
docker compose up -d
```

## 5. Calculate and stake required SANs amount on ETH Mainnet staking address: ```0xbFE5D25956F6D7CF212a24B628c7871A34c4465f```

The formula for calculation is `your amount of validators` * `2000 SAN`

(max 20 000 SANs for stake, because max 10 validators per node)

## 6. Attach `files/validator_keys/deposit_data.json` to  [dashboard](https://nodes.sanr.network)



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


# Troubleshooting
### 1. Check if all processes are running correctly.
```shell
cd /opt/sanchain/readonly
```
```shell
docker compose ps
```

The command's result should have the following statuses:
- `readonly_geth` status: up
- `readonly_beacon-chain` status: up
- `readonly_logrotate` status: up

### 2. In the beacon-chain logs:
```shell
docker compose logs --tail 1000 -f beacon-chain
```
This command will display the last 1000 lines of the beacon-chain container's log. You should see messages like this:
```
level=debug msg="Received block" blockSlot=344382 graffiti="" prefix=sync proposerIndex=55 sinceSlotStartTime=76.010571ms validationTime=4.057363ms
```
This indicates that the node is syncing and working.

## Monitoring

We collect statistics on active nodes (determining network lag, node configuration parameters and etc). 
### Make sure that your server and node has:
1. The ICMP protocol is open.
2. The following ports are open:
   - 13002/tcp, udp - p2p
   - 9102/tcp - stats beacon-chain
   - 33003/udp - geth

### You can use the following tools for monitoring:
1. ICMP checker: [https://www.meter.net/tools/world-ping-test/](https://www.meter.net/tools/world-ping-test/)
2. Check open ports: [https://www.yougetsignal.com/tools/open-ports/](https://www.yougetsignal.com/tools/open-ports/)

## Please note: Do not change the ports, as it will make your node appear unavailable.