# Welcome to [sk-big-oven-production](https://github.com/ZiadMansourM/sk-big-oven-production) Using .NET 6 🤖 / EX-8
My goal for today was to test spinning production dbs for 9 of us.
```
- 5 PostgreSQL users "Mariam, Dina, Mina, Nada, Younes".
- 4 SQL Server users "Mohamed, Baraa, Bassel, Salma".
```
## 🦦 Checklist of the day
- [X] Spinned AWS/EC2 Ubuntu 22.04 on a [t2.micro](https://aws.amazon.com/ec2/instance-types/t2/) instances. 
- [X] Used ssh to connect to my instance.

<img width="1440" alt="Screen Shot 2022-09-20 at 4 45 39 PM" src="https://user-images.githubusercontent.com/64917739/191392044-187222b9-8b56-42d9-b20a-14f9dff8f1e7.png">

- [X] Install Docker.
```Console
$ sudo apt update
$ sudo apt upgrade --yes
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ sudo apt-cache policy docker-ce
$ sudo apt install docker-ce --yes
$ sudo docker --version
Docker version 20.10.18, build b40c2f6
```

- [X] Install docker-compose.
```Console
$ sudo curl -L https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ sudo docker-compose --version
Docker Compose version v2.5.0
```

- [X] 🐳 docker-compose

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

- [X] 🦦 Dockerfile
```Dockerfile
FROM postgres

COPY users.sql /docker-entrypoint-initdb.d/

RUN chmod 755 /docker-entrypoint-initdb.d/users.sql
```

- [X] 🐘 PostgreSQL - users.sql [Initialization script](https://hub.docker.com/_/postgres)
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

- [X] Modified inbound rules of the instance's security group to include:
```
- SSH @port: 22 inorder to connect to server from my terminal/
- TCP @port: 5432 For TCP connections to Postgres
- TCP @port: 1433 For TCP connections to MSSQL
```
<img width="1122" alt="Screen Shot 2022-09-21 at 3 33 52 AM" src="https://user-images.githubusercontent.com/64917739/191394748-10057c02-496f-44ca-a9b9-1781fe331141.png">



## 👀 results

``` PostgreSQL users created successfully and tested the connection from my machine ```

<img width="1013" alt="Screen Shot 2022-09-20 at 8 43 39 PM" src="https://user-images.githubusercontent.com/64917739/191392855-c23bfa5c-4342-4ce7-88e7-e8ca45982871.png">
<img width="502" alt="Screen Shot 2022-09-21 at 1 26 10 AM" src="https://user-images.githubusercontent.com/64917739/191392862-b6b311b3-0697-4548-ab00-8be8fdc77f9e.png">


``` SQL Server Failed because I did not have enough memory on the t2.micro instance ```


<img width="1438" alt="Screen Shot 2022-09-21 at 2 20 54 AM" src="https://user-images.githubusercontent.com/64917739/191393151-46871a91-9952-43c5-9352-3517c772d67d.png">



## ➕ ToDo
- [ ] Search for a bigger instance and test with the SQL Server Docker image ``` How to add startup script```.
- [ ] Add information + Connection string to each issue.
