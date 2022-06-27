# Official Debian + Python image
FROM python:3.7-bullseye

RUN apt update && \
    apt install -y openjdk-11-jdk

RUN python -m pip install --upgrade pip && \
    pip install deephaven-server==0.14.0.dev5

CMD python
