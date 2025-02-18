
locals {
 folder_id = "b1g80b4gqo18ms9etro8"
  cloud_id =  "b1grju6gtui1vcmq31o8"
}

locals {
    // настройки vm 
    cloud_init_bastion = "/media/artur/data/projects/python/devops-66/auth/init-vm-bastion.yaml"    
    cloud_init_vm = "/media/artur/data/projects/python/devops-66/auth/init-vm.yaml"    

    // авторизация 
    key_file  = "/media/artur/data/projects/python/devops-66/auth/authorized_key.json"
}
locals {        
    zone = "ru-central1-a"
    region_id = "ru-central1"
    
    image_id = "fd8m5hqeuhbtbhltuab4"
    family_id = "ubuntu-2404-lts-oslogin"   

    registry_name    = "test"
}