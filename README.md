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