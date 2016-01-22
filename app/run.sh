#!/bin/bash

SECRET_KEY=$(LC_CTYPE=C tr -dc "a-zA-Z0-9!@#$%^&*()_+?><~" < /dev/urandom | fold -w ${1:-32} | head -n 1)
sed -i "s/##SECRET_KEY##/${SECRET_KEY}/g" conf/local_settings.py

NEVERCACHE_KEY=$(LC_CTYPE=C tr -dc "a-zA-Z0-9!@#$%^&*()_+?><~" < /dev/urandom | fold -w ${1:-32} | head -n 1)
sed -i "s/##NEVERCACHE_KEY##/${NEVERCACHE_KEY}/g" conf/local_settings.py

python manage.py runserver 0.0.0.0:8000

