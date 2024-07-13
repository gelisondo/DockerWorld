FROM nginx:latest

# Path: /usr/share/nginx/html
COPY /sitio /usr/share/nginx/html  

# Creamos un volumen, un puente entre el contenedor y nuestro workingDirectory

VOLUME [ "/sitio", "/usr/share/nginx/html" ]