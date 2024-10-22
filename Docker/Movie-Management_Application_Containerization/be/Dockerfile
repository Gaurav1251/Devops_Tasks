FROM mysql:latest

LABEL database="movie"

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=M
COPY M.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]
