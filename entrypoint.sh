#!/usr/bin/env ash


mkdir -p /tmp/backup/etcd
mkdir -p /tmp/backup/vault
mkdir -p /tmp/backup/minio
mkdir -p /tmp/backup/pgsql
etcdctl snapshot save /tmp/backup/etcd/etcd-backup-$(date '+%Y-%m-%d-%H-%M').db \
  --cacert="/tmp/cm-client-etcd-tls/ca.crt" \
  --cert="/tmp/cm-client-etcd-tls/tls.crt" \
  --key="/tmp/cm-client-etcd-tls/tls.key" \
  --endpoints="https://192.168.2.2:2381"



tail -f /dev/null
