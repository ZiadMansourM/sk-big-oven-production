FROM postgres

COPY postgresql/users.sql /docker-entrypoint-initdb.d/

RUN chmod 755 /docker-entrypoint-initdb.d/users.sql