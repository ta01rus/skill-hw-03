
include .env
BASE_DIR=$(shell pwd)

terra-play:
	cd  ./terraform && terraform apply 

terra-destroy:
	 cd  ./terraform && terraform destroy


