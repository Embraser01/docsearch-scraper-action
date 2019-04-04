#!/bin/sh
set -e

cd /root/docsearch-scraper
touch .env
pipenv install

sh -c "pipenv run ./docsearch $*"
