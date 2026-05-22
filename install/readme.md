
1. 安装

```bash
# wget https://infra.tekton.dev/tekton-releases/pipeline/latest/release.yaml
kubectl apply -f pipelines-v1.12.0.yaml
# https://objectstorage.us-ashburn-1.oraclecloud.com/n/idvmneyfvsey/b/tekton-releases/o/dashboard/latest/release-full.yaml
kubectl apply -f dashboard-v0.68.0.yaml 
wget https://github.com/tektoncd/cli/releases/download/v0.42.2/tkn_0.42.2_Linux_x86_64.tar.gz
tar -xf tkn_0.42.2_Linux_x86_64.tar.gz  -C /usr/local/bin/
tkn version
Client version: 0.42.2
Pipeline version: v1.12.0
Dashboard version: v0.68.0

```

2. 修改dashboard service类型为 NodePort

```bash
kubectl patch svc tekton-dashboard -n tekton-pipelines -p '{"spec":{"type":"NodePort","ports":[{"port":9097,"nodePort":30097}]}}'
```

