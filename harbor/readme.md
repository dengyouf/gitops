1. 配置证书

```bash
# 配置config_path路径
grep -B 2 config_path /etc/containerd/config.toml
    [plugins."io.containerd.grpc.v1.cri".registry]
      config_path = "/etc/containerd/certs.d"
mkdir -pv /etc/containerd/certs.d/harbor.devops.io
scp harbor.devops.io:/data/harbor/ssl/ca.crt /etc/containerd/certs.d/harbor.devops.io
cat > /etc/containerd/certs.d/harbor.devops.io/hosts.toml  << 'EOF'
server = "https://harbor.devops.io"
[host."https://harbor.devops.io"]
  capabilities = ["pull", "resolve","push"]
  skip_verify = false
  ca = ["ca.crt"]
EOF
```

2. 生成secret

```bash
kubectl create secret docker-registry harbor-secret \
  --docker-server=harbor.devops.io \
  --docker-username=admin \
  --docker-password=Harbor12345 \
  --docker-email=harbro@devops.com \
  -n default --dry-run=client -o yaml | kubectl apply -f -
```

3. 验证

```bash
cat > nginx.yaml << "EOF"
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx
  name: nginx
  namespace: default
spec:
  progressDeadlineSeconds: 600
  replicas: 3
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      imagePullSecrets:
        - name: harbor-secret
      containers:
      - image: harbor.devops.io/devops/nginx:v1.18
        imagePullPolicy: IfNotPresent
        name: nginx
      restartPolicy: Always
EOF
kubectl apply -f nginx.yaml
```
