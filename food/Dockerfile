FROM python:3.10

RUN apt-get update && \
    apt-get install -y \
    bash curl nano net-tools zip unzip \
    jq dnsutils iputils-ping

RUN mkdir -p /app /data/db

# Python Environment Setup
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /app/start.sh

# Exposing appropriate ports
EXPOSE 8000/tcp

CMD [ "/app/start.sh" ]
