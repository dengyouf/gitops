sudo virt-clone --auto-clone -o rocky10  -n node01
sudo virt-clone --auto-clone -o rocky10  -n node02
sudo virt-clone --auto-clone -o rocky10  -n node03

sudo virt-sysprep  \
    --operations defaults,machine-id,-ssh-userdir,-lvm-uuids \
    --hostname node01 \
    --run-command "sed -i 's@192.168.122.7@192.168.122.16@g' /etc/NetworkManager/system-connections/enp1s0.nmconnection" \
    -d node01

sudo virt-sysprep  \
    --operations defaults,machine-id,-ssh-userdir,-lvm-uuids \
    --hostname node02 \
    --run-command "sed -i 's@192.168.122.7@192.168.122.17@g' /etc/NetworkManager/system-connections/enp1s0.nmconnection" \
    -d node02
sudo virt-sysprep  \
    --operations defaults,machine-id,-ssh-userdir,-lvm-uuids \
    --hostname node03 \
    --run-command "sed -i 's@192.168.122.7@192.168.122.18@g' /etc/NetworkManager/system-connections/enp1s0.nmconnection" \
    -d node03
