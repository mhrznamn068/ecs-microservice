FROM nginx

RUN apt-get update && \
    apt-get install -y \
    bash curl net-tools zip unzip

ADD https://releases.hashicorp.com/consul/1.4.4/consul_1.4.4_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://github.com/mattn/goreman/releases/download/v0.0.10/goreman_linux_amd64.zip /tmp/goreman.zip
RUN cd /bin && unzip /tmp/goreman.zip && chmod +x /bin/goreman && rm /tmp/goreman.zip

ADD ./consul /etc/consul.d
ADD Procfile /root/Procfile
ADD nginx.sh /nginx.sh
ADD consul.sh /opt

RUN chmod +x /nginx.sh /opt/consul.sh

COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "goreman" ]
CMD [ "-f", "/root/Procfile", "start" ]