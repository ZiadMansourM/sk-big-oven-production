FROM mcr.microsoft.com/mssql/server

RUN mkdir -p /usr/src/app

COPY sqlserver/create-database.sql /usr/src/app/
COPY sqlserver/entrypoint.sh /usr/src/app/
COPY sqlserver/run-initialization.sh /usr/src/app/

RUN chmod +x /usr/src/app/run-initialization.sh
RUN chmod +x /usr/src/app/entrypoint.sh

CMD /bin/bash /usr/src/app/entrypoint.sh