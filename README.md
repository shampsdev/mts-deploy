# Репозиторий для быстрого развертывания на сервере
## Команда "Шампиньоны"
 - Александр Дьяконов [DevOps-инженер, backend-разработчик]
 - Мишель де Джофрой [frontend-разработчик]
 - Виктория Кулешова [UX/UI дизайнер]
 - Иван Тарасов [backend-разработчик, DevOps-инженер]
 - Анастасия Богданова [бизнес-аналитик]

## Введение
Для развертывания мы написали `docker-compose.yaml` и `Helm chart` файлы для `k3s`.

**ВАЖНО**: это полностью `stateless` решение, что является преимуществом, позволяющим развернуть наши сервисы где угодно.

не так ВАЖНО: в качестве `ingress controller` используется встроенный `traefik`, поэтому не на `k3s` может не запуститься проект.

ВИДЕО ОБЗОР МОЖНО ПОСМОТРЕТ ТУТ:
https://drive.google.com/drive/folders/1W8NXPd4AA7SirpcoB3FsHZm-85DlATF5?usp=sharing

Репозитории:
  - [Бекенд](https://github.com/shampsdev/mts-backend)
  - [Фронтенд](https://github.com/shampsdev/mts-frontend)

Обзор:
  - [Бекенд](https://api.mts.shamps.dev/docs/index.html)
  - [Фронтенд](https://mts.shamps.dev)
  - [Видео](https://drive.google.com/drive/folders/1W8NXPd4AA7SirpcoB3FsHZm-85DlATF5?usp=sharing)

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

Там также настроен `traefik` в качестве роутера и реверс-прокси. Его конфигурация вне kuber систем в разы проще, поэтому даже написали простенький скрипт для этого.

### k3s
Важно, что для запуска необходимо изменить в `values` хосты у фронтенда и бекенда на свои (в k3s настроен по умолчанию траефик). Переписывать два варианта или чтобы можно было запустить без них времени не было, поэтому сделали, чтобы сертификаты выдавались и обновлялись траефиком.

Для запуска:
```
helm install mts ./mts
```
