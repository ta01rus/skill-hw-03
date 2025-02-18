
include .env
BASE_DIR=$(shell pwd)
ANSIBLE_CONFIG=${BASE_DIR}/ansible.cfg

terra-play:
	cd  ./terraform && terraform apply 

terra-destroy:
	 cd  ./terraform && terraform destroy


role-init:
		ansible-galaxy init ansible/roles/${role}

play-check:
	@echo ${ANSIBLE_CONFIG}
	@echo "  >  play  check ...."	
	ansible-playbook ${BASE_DIR}/playbooks/check/play.yml
	cat /tmp/check | jq && rm /tmp/check		