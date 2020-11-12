#!/bin/bash
ulimit -SHn 65536
sysctl net.ipv4.tcp_sack=1
sysctl net.ipv4.tcp_syncookies=1
sysctl net.ipv4.tcp_timestamps=1
sysctl net.ipv4.tcp_tw_recycle=0
sysctl net.ipv4.tcp_tw_reuse=1
export NODE_NO_WARNINGS=1

echo "modify limits.conf"
cat << EOF >/etc/security/limits.conf
* soft noproc 65536
* hard noproc 65536
* soft nofile 65536
* hard nofile 65536
EOF

echo "modify sysctl.conf"
cat << EOF >/etc/sysctl.conf
net.ipv4.ip_local_port_range = 1024 65535
kernel.shmall = 4294967296
net.ipv4.tcp_fin_timeout=10
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_keepalive_time = 3
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_keepalive_probes = 2
net.ipv4.tcp_keepalive_intvl = 1
fs.file-max = 6553560
EOF
sysctl -p