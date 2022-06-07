#FROM python:3.7-alpine
FROM python:3.7-bullseye

RUN apt update && \
    apt install -y openjdk-11-jdk

ADD wheels/ /wheels
RUN ls /wheels/*
RUN python -m pip install --upgrade pip && \
    pip install --force-reinstall /wheels/*.whl

ENTRYPOINT python
