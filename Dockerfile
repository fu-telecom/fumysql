FROM mysql:latest

# Add the SQL dump to the container
ADD fuconfig.sql /docker-entrypoint-initdb.d/
ADD asteriskrealtime.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306
