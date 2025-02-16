resource "yandex_lb_target_group" "vm-group" {
  name      = "web-group"
  region_id = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.net-d.id
    address   = yandex_compute_instance.vm-1.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.net-d.id
    address   = yandex_compute_instance.vm-2.network_interface.0.ip_address
  }
}


resource "yandex_lb_network_load_balancer" "balancer-web" {
  name = "web-balancer"
    
  listener {
    name = "web-services"
    port = 8080
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.vm-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 8080
        path = "/ping"
      }
    }
  }  

}

