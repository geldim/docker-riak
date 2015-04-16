FROM ubuntu:trusty
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN apt-get update && curl https://packagecloud.io/install/repositories/basho/riak/script.deb | bash && apt-get install riak=2.0.5-1 && rm -rf /var/lib/apt/lists/*
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/riak/riak.conf
RUN sed -i 's/storage_backend.*$/storage_backend=leveldb/' /etc/riak/riak.conf
EXPOSE 8087 8098
CMD /usr/sbin/riak console
