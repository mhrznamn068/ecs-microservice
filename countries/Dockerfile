FROM python:3.10

RUN apt-get update && \
    apt-get install -y \
    bash curl nano net-tools zip unzip \
    jq dnsutils iputils-ping

RUN mkdir -p /app /data/db /etc/consul.d

# Python Environment Setup
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Setup Consul and Goreman
RUN mkdir -p /data/db /etc/consul.d

ADD https://releases.hashicorp.com/consul/1.4.4/consul_1.4.4_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://github.com/mattn/goreman/releases/download/v0.0.10/goreman_linux_amd64.zip /tmp/goreman.zip
RUN cd /bin && unzip /tmp/goreman.zip && chmod +x /bin/goreman && rm /tmp/goreman.zip

ADD ./consul /etc/consul.d
ADD Procfile /root/Procfile
ADD consul.sh /opt

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /app/countries.sh /opt/consul.sh

# Exposing appropriate ports
EXPOSE 8000/tcp

ENTRYPOINT [ "goreman" ]
CMD [ "-f", "/root/Procfile", "start" ]
