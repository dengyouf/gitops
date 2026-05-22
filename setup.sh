VERSION=v5.1.1
export PROXY_PREFIX=https://ghfast.top
curl -sfL ${PROXY_PREFIX}/https://raw.githubusercontent.com/labring/sealos/main/scripts/install.sh | PROXY_PREFIX=${PROXY_PREFIX} sh -s ${VERSION} labring/sealos


apt install -y \
  curl \
  wget \
  socat \
  ebtables \
  ethtool \
  conntrack \
  iptables \
  iproute2 \
  ipset \
  jq \
  tar \
  bash-completion \
  openssl \
  nfs-common


sealos  run registry.cn-shanghai.aliyuncs.com/labring/kubernetes:v1.31.8 \
            registry.cn-shanghai.aliyuncs.com/labring/cilium:v1.15.8 \
            registry.cn-shanghai.aliyuncs.com/labring/helm:v3.16.2 \
            --masters 192.168.122.111 \
            --nodes 192.168.122.121,192.168.122.122,192.168.122.123 \
            -u root \
            -p root

