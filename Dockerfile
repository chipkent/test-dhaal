# Official Debian + Python image
FROM python:3.7-bullseye

RUN apt update && \
    apt install -y openjdk-11-jdk

RUN python -m pip install --upgrade pip && \
    pip install deephaven-server==0.14.0.dev7

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
CMD python
