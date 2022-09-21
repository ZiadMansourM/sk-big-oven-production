### ➕ Install docker

```Console
$ sudo apt update
$ sudo apt upgrade --yes
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ sudo apt-cache policy docker-ce
$ sudo apt install docker-ce --yes
```

### ➕ Install Docker-Compose
```Console
$ sudo curl -L https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

### 🐳 docker-compose

```yml
version: '3.4'

services:
  db:
    image: postgres
    build:
      context: .
    volumes:
      - ./data:/var/lib/postgresql/data
    restart: always
    environment:
      - POSTGRES_PASSWORD=postgres
    ports:
      - "5432:5432"
  sqlserver:
    image: "mcr.microsoft.com/mssql/server"
    environment:
      SA_PASSWORD: "Your_password123"
      ACCEPT_EULA: "Y"
    ports:
      - "1433:1433"
```

### 🦦 Dockerfile
```Dockerfile
FROM postgres

COPY users.sql /docker-entrypoint-initdb.d/

RUN chmod 755 /docker-entrypoint-initdb.d/users.sql
```

### 🐘 PostgreSQL
```sql
-- mariam - mariam@sk
-- dina - dina@sk
-- mina - mina@sk
-- nada - nada@sk
-- younes - younes@sk

-- mariam - mariam@sk
CREATE DATABASE mariam;
CREATE USER mariam WITH ENCRYPTED PASSWORD 'mariam@sk';
GRANT ALL PRIVILEGES ON DATABASE mariam TO mariam;

-- dina - dina@sk
CREATE DATABASE dina;
CREATE USER dina WITH ENCRYPTED PASSWORD 'dina@sk';
GRANT ALL PRIVILEGES ON DATABASE dina TO dina;

-- mina - mina@sk
CREATE DATABASE mina;
CREATE USER mina WITH ENCRYPTED PASSWORD 'mina@sk';
GRANT ALL PRIVILEGES ON DATABASE mina TO mina;

-- nada - nada@sk
CREATE DATABASE nada;
CREATE USER nada WITH ENCRYPTED PASSWORD 'nada@sk';
GRANT ALL PRIVILEGES ON DATABASE nada TO nada;

-- younes - younes@sk
CREATE DATABASE younes;
CREATE USER younes WITH ENCRYPTED PASSWORD 'younes@sk';
GRANT ALL PRIVILEGES ON DATABASE younes TO younes;
```
