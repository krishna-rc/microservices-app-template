FROM mysql:8.4.0

RUN mkdir /app

COPY health-check.sh /app

RUN chmod +x /app/health-check.sh

CMD ["mysqld"]