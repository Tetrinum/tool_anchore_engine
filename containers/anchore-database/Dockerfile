FROM postgres:9

ENV POSTGRES_PASSWORD=mysecretpassword \
	PGDATA=/var/lib/postgresql/data/pgdata/

COPY ./db $/var/lib/postgresql/data/pgdata/

EXPOSE 5432
