# Usa la imagen oficial de PHP con Apache
FROM php:8.1-apache

# Instala las extensiones mysqli y pdo_mysql necesarias para conectar con MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql
