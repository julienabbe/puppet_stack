FROM python:3.9-alpine

ENV PUPPETBOARD_PORT 80
ENV PUPPETBOARD_HOST 0.0.0.0

EXPOSE 80

ENV PUPPETBOARD_SETTINGS docker_settings.py
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

# Workaround for https://github.com/benoitc/gunicorn/issues/2160
RUN apk --update --no-cache add libc-dev binutils

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

CMD gunicorn -b ${PUPPETBOA
