FROM alpine:latest as ansible

ENV ETCD_VERSION 3.5.18


ADD https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz /tmp/etcd.tar.gz
RUN tar zxvf /tmp/etcd.tar.gz -C /tmp && \
    mv /tmp/etcd-v${ETCD_VERSION}-linux-amd64/etcdctl /usr/local/bin/etcdctl && \
    chmod a+x /usr/local/bin/etcdctl && \
    apk --update add postgresql-client curl jq git openssh bind-tools && \
    curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o /usr/bin/mc && \
    chmod +x /usr/bin/mc

ENTRYPOINT ["/entrypoint.sh"]