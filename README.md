# README

## Version
|system|version|
|:--:|:--:|
|Ruby|2.7.0|
|rails|7.0|
## System dependencies

## Initial setup

```bash
docker compose up -d
docker compose exec db /bin/bash
# mysql -u root -p
mysql> grant all on test.* to 'development'@'%';
docker-compose exec web db:reset
docker-compose exec web db:migrate
```
enabled at http://localhost:3000, and RSpec

## RSpec
```bash
docker-compose exec web rspec
```