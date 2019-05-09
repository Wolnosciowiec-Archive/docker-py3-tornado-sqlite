FROM python:3.7-alpine

RUN pip install -U tornado requests pysqlite3 && apk --update add sqlite curl

ENTRYPOINT python

