# Docker container for Laravel

Docker container for laravel with self signed ssl certificate, trusted by curl inside laravel container.

## Installation

Download a laravel release from https://github.com/laravel/laravel/releases and extract it.
Clone this repository inside your laravel project.

### Ssl certificate

```bash
$ cd docker/ssl
$ cp openssl.cnf.example openssl.cnf
$ ./gen-cert.sh
```

### Docker

```bash
$ cd docker
$ cp .env.example .env

$ docker-compose up -d [--build]
$ docker-compose exec php bash
```

### Laravel

```bash
$ composer install
$ cp .env.example .env
$ php artisan key:generate
$ php artisan migrate
```
