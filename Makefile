
include .env
BASE_DIR=$(shell pwd)
ANSIBLE_CONFIG=${BASE_DIR}/ansible.cfg

terra-play:
	cd  ./terraform && terraform apply 

terra-destroy:
	 cd  ./terraform && terraform destroy


