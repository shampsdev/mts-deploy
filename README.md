# Репозиторий для быстрого развертывания на сервере
## Команда "Шампиньоны"
 - Александр Дьяконов [DevOps-инженер, backend-разработчик]
 - Мишель де Джофрой [frontend-разработчик]
 - Виктория Кулешова [UX/UI дизайнер]
 - Иван Тарасов [backend-разработчик]
 - Анастасия Богданова [бизнес-аналитик]

## Введение
Для развертывания мы написали `docker-compose.yaml` и `Helm chart` файлы для `k3s`.
    
**ВАЖНО**: в качестве `ingress controller` используется встроенный `traefik`, поэтому не на `k3s` может не запуститься проект.

Репозитории:
  - [Бекенд](https://github.com/shampsdev/mts-backend)
  - [Фронтенд](https://github.com/shampsdev/mts-frontend)

Обзор:
  - [Бекенд](https://api.mts.shamps.dev/docs/index.html)
  - [Фронтенд](https://mts.shamps.dev)

Зависимости (на ваш вкус):
  - [docker](https://docs.docker.com/engine/install/ubuntu/)
  - [k3s](https://docs.k3s.io/quick-start)
  - [helm](https://helm.sh/docs/intro/install/)

## Как поднять?
### Docker
Достаточно поднять с помощью:
```
docker-compose -f docker-compose.local.yaml up --build -d
```

Чтобы проверить:
 - Бекенд тут: http://localhost:8000/docs/index.html
 - Фронтенд тут: http://localhost:3000/

Для запуска на "продакшн" запустить скрипт:
```
./docker-start
```

### k3s
Важно, что для запуска необходимо изменить в `values` хосты у фронтенда и бекенда на свои (в k3s настроен по умолчанию траефик). Переписывать два варианта или чтобы можно было запустить без них времени не было, поэтому сделали, чтобы сертификаты выдавались и обновлялись траефиком.

Для запуска:
```
helm install mts ./mts
```
