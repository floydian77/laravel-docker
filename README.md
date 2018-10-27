# Docker

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
