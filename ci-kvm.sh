sudo virt-clone --auto-clone -o ubuntu24.04 -n u24-ci-gitlab 
sudo virt-clone --auto-clone -o ubuntu24.04 -n u24-ci-harbor

sudo virt-sysprep  \
    --operations defaults,machine-id,-ssh-userdir,-lvm-uuids \
    --hostname u24-ci-gitlab \
    --run-command "sed -i 's@192.168.122.5@192.168.122.130@g' /etc/netplan/50-cloud-init.yaml  && dpkg-reconfigure openssh-server" \
    -d u24-ci-gitlab

sudo virt-sysprep  \
    --operations defaults,machine-id,-ssh-userdir,-lvm-uuids \
    --hostname u24-ci-harbor \
    --run-command "sed -i 's@192.168.122.5@192.168.122.131@g' /etc/netplan/50-cloud-init.yaml  && dpkg-reconfigure openssh-server" \
    -d u24-ci-harbor