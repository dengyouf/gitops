# ubuntu
apt install nfs-server
# centos
yum -y install nfs-utils

mkdir -pv /data/nfs-k8s
echo  "/data/nfs-k8s  *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
exportfs  -av
exporting *:/data/nfs-k8s

showmount -e 192.168.1.111
Export list for 192.168.1.111:
/data/nfs-k8s *

# 获取资源清单到本地
wget https://ghfast.top/https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner/blob/master/deploy/class.yaml
wget https://ghfast.top/https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner/blob/master/deploy/deployment.yaml
wget https://ghfast.top/https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner/blob/master/deploy/rbac.yaml
# 配置Deployment
vim deployment.yaml
              value: k8s-sigs.io/nfs-subdir-external-provisioner
            - name: NFS_SERVER
              value: 192.168.1.111
            - name: NFS_PATH
              value: /data/nfs-k8s
      volumes:
        - name: nfs-client-root
          nfs:
            server: 192.168.1.111
            path: /data/nfs-k8s
# 设置程默认存储类
kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'