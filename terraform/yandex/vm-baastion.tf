
resource "yandex_compute_disk" "boot-disk-bastion" {
  name     = "boot-disk-3"
  folder_id = local.folder_id
  type     = "network-hdd"
  zone     = local.zone
  size     = "10"
  image_id = local.image_id
}

resource "yandex_compute_instance" "vm-bastion" {
  name = "bastion"  
  folder_id = local.folder_id

  platform_id = "standard-v1" # тип процессора (Intel Broadwell)
  zone        = local.zone

  resources {
    core_fraction = 5 # Гарантированная доля vCPU
    cores  = 2 // количество процессоров 
    memory = 1 // объем оперативной памяти Гб
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-bastion.id
  }

  network_interface {
    index     = 1
    subnet_id = yandex_vpc_subnet.net-d.id
    ip_address = "192.168.0.10"
    nat = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address

  }

  metadata = {
    user-data = "${file(local.cloud_init_bastion)}"
  }
}