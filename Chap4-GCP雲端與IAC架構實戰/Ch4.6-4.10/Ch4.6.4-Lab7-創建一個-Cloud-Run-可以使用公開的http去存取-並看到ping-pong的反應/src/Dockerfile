FROM --platform=linux/amd64 python:3.9-slim

ENV PYTHONUNBUFFERED True

COPY . /app
WORKDIR /app


RUN pip install --no-cache-dir -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
