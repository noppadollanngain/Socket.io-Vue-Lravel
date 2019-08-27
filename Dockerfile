FROM php:7
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring && docker-php-ext-install pdo_mysql
WORKDIR /app
COPY . /app
# RUN /usr/local/bin/composer install
RUN /usr/local/bin/composer update
RUN /usr/local/bin/composer dump-autoload

CMD php artisan serve --host=0.0.0.0 --port=8080
EXPOSE 8080