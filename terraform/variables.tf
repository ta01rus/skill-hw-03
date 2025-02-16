
locals {
 folder_id = "b1g80b4gqo18ms9etro8"
  cloud_id =  "b1grju6gtui1vcmq31o8"
}

locals {
    // настройки vm 
    cloud_init_vm1 = "/media/artur/data/projects/skill-hw-03/terraform/auth/init-vm-1.yaml"    
    cloud_init_vm2 = "/media/artur/data/projects/skill-hw-03/terraform/auth/init-vm-1.yaml"    
    cloud_init_vm3 = "/media/artur/data/projects/skill-hw-03/terraform/auth/init-vm-3.yaml"    



    // авторизация 
    key_file  = "/media/artur/data/projects/skill-hw-03/terraform/auth/authorized_key.json"
}
locals {        
    zone = "ru-central1-a"
    region_id = "ru-central1"
    
    image_id_ubuntu = "fd8m5hqeuhbtbhltuab4"
    family_id_ubuntu = "ubuntu-2404-lts-oslogin"    

    image_id_centos7 = "fd8a38b9mlcut9k1jl2a"   
    family_id_centos7 = "centos-7"    

    
    registry_name    = "test"
}