# initsys
ansible-galaxy install -r initsys.yml
ansible-playbook  -i tests/inventory  tests/test_initsys.yml

# initmotd
ansible-galaxy install -r initmotd.yml
ansible-playbook  -i tests/inventory  tests/test_initmotd.yml
