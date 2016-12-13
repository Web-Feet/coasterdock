web:
    image: nginx:alpine
    ports:
        - "80:80"
    volumes:
        - ./:/usr/share/nginx/html
        - ./default.conf/:/etc/nginx/conf.d/default.conf
    links:
        - php
        - mysql
php:
    build: .
    volumes:
        - ./:/usr/share/nginx/html
    links:
        - mysql
mysql:
    image: mysql:5.7
    ports:
        - "3306:3306"
    environment:
        - MYSQL_ROOT_PASSWORD=root
        - MYSQL_DATABASE=coaster
        - MYSQL_USER=coaster_usr
        - MYSQL_PASSWORD=secret
