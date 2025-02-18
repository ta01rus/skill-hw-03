include .env

BASE_DIR=$(shell pwd)

ANSIBLE_CONFIG=${BASE_DIR}/ansible.cfg

role-init:
		ansible-galaxy init roles/${role}


play-check:
	@echo ${ANSIBLE_CONFIG}
	@echo "  >  play  check ...."	
	ansible-playbook ${BASE_DIR}/playbooks/info/play.yml 
	cat /tmp/check

play-app:
	@echo ${ANSIBLE_CONFIG}
	@echo "  >  play  check ...."	
	ansible-playbook ${BASE_DIR}/playbooks/app/play.yml -K --extra-vars 'roles_dir=${BASE_DIR}/roles'

fact-app:
	ansible -m setup 192.168.0.19  > facts.json