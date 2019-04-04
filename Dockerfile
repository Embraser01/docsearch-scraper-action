FROM python:2.7

LABEL "com.github.actions.name"="Docsearch Scraper"
LABEL "com.github.actions.description"="Wrapper for docsearch-scraper (Algolia)"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/Embraser01/docsearch-scraper-action"
LABEL "homepage"="http://github.com/Embraser01/docsearch-scraper-action"
LABEL "maintainer"="Marc-Antoine Fernandes <marcantoinefernandes@gmail.com>"

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# Install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/

# set display port to avoid crash
ENV DISPLAY=:99

# Install DocSearch dependencies
RUN git clone https://github.com/algolia/docsearch-scraper /root/docsearch-scraper

ENV LANG en_US.UTF-8
ENV PIPENV_HIDE_EMOJIS 1
RUN pip install pipenv

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
