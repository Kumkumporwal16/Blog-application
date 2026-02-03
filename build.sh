#!/usr/bin/env bash
set -o errexit

# Ensure pip, wheel, and setuptools are up-to-date to get binary wheels on the build image
python -m pip install --upgrade pip wheel setuptools

pip install -r requirements.txt

cd myblog
python manage.py collectstatic --noinput
python manage.py migrate
