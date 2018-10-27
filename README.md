# Docker container for Laravel

## Ssl certificate

```bash
$ cd ssl
$ cp openssl.cnf.example openssl.cnf
$ ./gen-cert.sh
```

## Docker

```bash
$ cd docker
$ cp .env.example .env

$ docker-compose up -d [--build]
$ docker-compose exec app bash
```

## Laravel

```bash
$ composer install
$ cp .env.example .env
$ php artisan key:generate
$ php artisan migrate
```
