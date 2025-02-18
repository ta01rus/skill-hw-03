# облачная сеть 
resource "yandex_vpc_address" "addr" {
  
  external_ipv4_address {    
    zone_id = local.zone
  }
}

// описание сети 
resource "yandex_vpc_network" "net" {
    name = "skill-network"
    folder_id = local.folder_id
}

resource "yandex_vpc_subnet" "net-d" {
  zone           = local.zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.0.0/24"]
}
