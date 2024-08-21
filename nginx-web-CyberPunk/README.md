# Web site Cyberpunk

I make this site with old tecnologi, it's a static web site implementation:
- HTML
- CSS
- JavaScript
 

## Docker

 We use Docker to deploy web site on a web server nginx.


 The next snippets is a Dockerfile content, it's very simple, only have 2 line.

```
FROM nginx:latest

# Path: /usr/share/nginx/html
COPY /sitio /usr/share/nginx/html  

```
 The first line download the latest images of nginx from docker.hub.
 The second line copy web site into root nginx fordefault path.