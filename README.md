# Репозиторий для быстрого развертывания на сервере

## Введение
Для развертывания мы написали `docker-compose.yaml` и `Helm chart` файлы для `k3s` (важно: в качестве `ingress controller` используется `traefik`, поэтому не на `k3s` может не запуститься проект.)

Репозитории:
  - [Бекенд](https://github.com/shampsdev/mts-backend)
  - [Фронтенд](https://github.com/shampsdev/mts-frontend)

Обзор:
  - [Бекенд](https://api.mts.shamps.dev)
  - [Фронтенд](https://mts.shamps.dev)

Зависимости (на ваш вкус):
  - [docker](https://docs.docker.com/engine/install/ubuntu/)
  - [k3s](https://docs.k3s.io/quick-start)
  - [helm](https://helm.sh/docs/intro/install/)

## Как поднять?
### k3s
пупупуп

### Docker
Достаточно поднять с помощью:
```
docker-compose -f docker-compose.local.yaml up --build -d
```

Для запуска на "продакшн" сервере с доменом вызвать ./prod-compose и запустить:
```
docker-compose -f docker-compose.prod.yaml up --build -d
```