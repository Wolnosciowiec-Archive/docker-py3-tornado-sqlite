FROM python:3.7-alpine

RUN pip install -U tornado'<'6 requests pysqlite3 \
    && apk --update add sqlite curl sudo \
    && addgroup -g 82 -S app \
    && adduser -u 82 -D -S -G app app

USER app
ENTRYPOINT python

