#!/bin/bash

# Migrate database
if [[ $PRIMARY -eq 1 ]]; then
    python ./manage.py migrate
fi

# Fetch static files
python ./manage.py collectstatic --noinput

# Run background task processor and Django API server
gunicorn -w 1 --bind 0.0.0.0:8000 --access-logfile - countries.wsgi:application
