terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}


provider "yandex" {
  zone = "ru-central1-d"
  
  cloud_id = local.cloud_id
  folder_id = local.folder_id 
  service_account_key_file = local.key_file
}