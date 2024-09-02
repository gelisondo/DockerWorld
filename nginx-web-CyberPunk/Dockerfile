FROM nginx:latest

# Delete oll conent
RUN rm -r /usr/share/nginx/html/*

# Path: /usr/share/nginx/html
COPY /sitio /usr/share/nginx/html  

# Mounta Volumen para un desarrollo directo.
VOLUME [ "/sitio", "/usr/share/nginx/html" ]