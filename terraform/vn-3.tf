
resource "yandex_compute_disk" "vm-3" {
  name     = "boot-disk-vm-3"
  type     = "network-hdd"
  zone     = local.zone
  size     = "20"
  image_id = local.image_id_centos7
}

resource "yandex_compute_instance" "vm-3" {
  name = "vm-3"  
  folder_id = local.folder_id

  platform_id = "standard-v1" # тип процессора (Intel Broadwell)
  zone        = local.zone

  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 // количество процессоров 
    memory = 1 // объем оперативной памяти Гб
  }



  boot_disk {
    disk_id = yandex_compute_disk.vm-3.id
  }

  network_interface {
    index     = 1    
    subnet_id = yandex_vpc_subnet.net-d.id    
    nat = true    
    ip_address = "192.168.0.12"    
  }

  metadata = {
    # для каждого создал отдельный 
    user-data = "${file(local.cloud_init_vm1)}"
    ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
  }
}