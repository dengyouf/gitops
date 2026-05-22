wget https://immortalwrt.kyarucloud.moe/releases/23.05.1/targets/x86/64/immortalwrt-23.05.1-x86-64-generic-ext4-combined-efi.img.gz

sudo virt-install --name immortalwrt \
    --osinfo=linux2022 --ram 512 --vcpus 1 \
    --disk path=/data/libvirt/images/immortalwrt-23.05.1-x86-64-generic-ext4-combined-efi.img,bus=virtio,cache=writeback \
    --network network=default,model=virtio  \
    --graphics=vnc,password=root,port=5966,listen=0.0.0.0 \
    --noautoconsole --import --autostart