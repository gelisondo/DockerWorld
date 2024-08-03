FROM tozd/sympa:latest

#Copiamos archivo de configuración de sympa
COPY Data/sympa.conf /etc/sympa/sympa/sympa.conf

#Montaje de volumenes, no es necesario en un principio
#Log files. Logs are not rotated.
VOLUME [ "/Data/log", "/var/log/sympa" ]

#: A volume shared with a Postfix container to provide necessary SSH keys for communication between containers.
VOLUME [ "/Data/shared", "/etc/sympa/shared" ]

#Persist this volume to not lose state.
VOLUME ["/Data/spool", "/var/spool/sympa"]

#Persist this volume to not lose state.
VOLUME [ "/Data/lib", "/var/lib/sympa" ]

#To create a database for Sympa, exec into your PostgreSQL container
RUN psql -c "CREATE DATABASE sympa" "user=sympauser dbname=sympa password=something_secret"


#Fuentes:
#    https://hub.docker.com/r/tozd/sympa

#Recomandación para correr el contenedor
# sample run command looks like:

#     docker run -p 80:80 -p 25:25 -e SYMPA_DOMAIN=lists.mydomain.com
#     -e SYMPA_DB_TYPE=mysql -e SYMPA_DB_HOST=localhost -e SYMPA_DB_USER=sympa
#     -e SYMPA_DB_PASS=sympa -e SYMPA_DB_NAME=sympa -e SYMPA_LISTMASTERS=csv_list_of_emails
#     -e SYMPA_POSTFIX_RELAY=mail.mydomain.com -v datasource:/sympa_perm project42/sympa