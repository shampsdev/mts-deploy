#!/bin/bash

echo "Необходимо сконфигурировать traefik"

read -p "Введите домен (без https://): " DOMAIN

echo "Домен: $DOMAIN"

read -p "Введите почту для Let's encrypt домена: " EMAIL

echo "Почта: $EMAIL"

cp ./data/traefik.yaml ./traefik.yaml

sed -i "s/%EMAIL%/$EMAIL/g" ./traefik.yaml

echo "Traefik сконфигурирован..."

echo "Создание docker network: traefik"
docker network create traefik
echo "Сеть успешно создана"

sed -i "s/%DOMAIN%/$DOMAIN/g" ./docker-compose.prod.yaml

echo "Фронтенд запущен на https://$DOMAIN"
echo "Бекенд запущен на https://api.$DOMAIN"