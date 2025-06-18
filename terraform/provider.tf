terraform {
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.5.0"
    }
  }
}

provider "lxd" {
  remote {
    name    = "rx2530"
    address = "https://192.168.1.100:443"
    token   = var.LXD_RX2530_TOKEN
  }
}
