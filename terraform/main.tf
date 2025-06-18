
resource "lxd_instance" "loki" {
  allow_restart = false
  config = {
    "security.nesting" = "true"
  }
  description = "public-loki (loki.yumnumm.dev)"
  ephemeral   = false
  execs       = null
  image       = "images:ubuntu/noble/amd64"
  limits = {
    cpu = "4"
  }
  name             = "loki"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
}


resource "lxd_instance" "network" {
  allow_restart    = false
  config           = {}
  description      = "tailscale, cloudflared"
  ephemeral        = false
  execs            = null
  image            = "images:ubuntu/noble/amd64"
  limits           = {}
  name             = "network"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
}


resource "lxd_instance" "ubuntu_desktop" {
  allow_restart = false
  config = {
    "boot.autostart" = "false"
  }
  description = null
  ephemeral   = false
  execs       = null
  image       = "images:ubuntu/noble/amd64"
  limits = {
    cpu    = "16"
    memory = "24GiB"
  }
  name             = "ubuntu-desktop"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = false
  target           = null
  timeouts         = null
  type             = "virtual-machine"
  wait_for_network = true
  device {
    name = "gpu-1"
    properties = {
      gputype = "physical"
      pci     = "0000:04:00.0"
    }
    type = "gpu"
  }
  device {
    name = "root"
    properties = {
      path = "/"
      pool = "default"
      size = "50GiB"
    }
    type = "disk"
  }
}


resource "lxd_instance" "monitor" {
  allow_restart = false
  config = {
    "raw.idmap"           = "both 1000 1000"
    "security.nesting"    = "true"
    "security.privileged" = "true"
  }
  description      = "grafana, loki, prometheus, alertmanager, cadvisor, influxdb"
  ephemeral        = false
  execs            = null
  image            = "images:ubuntu/noble/amd64"
  limits           = {}
  name             = "monitor"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
  device {
    name = "disk-device-2"
    properties = {
      path   = "/home/yumnumm/.ssh"
      source = "/home/yumnumm/.ssh"
    }
    type = "disk"
  }
}


resource "lxd_instance" "media" {
  allow_restart = false
  config = {
    "raw.idmap"           = "both 1000 1000"
    "security.nesting"    = "true"
    "security.privileged" = "true"
  }
  description      = "smb, gerbera"
  ephemeral        = false
  execs            = null
  image            = "images:ubuntu/noble/amd64"
  limits           = {}
  name             = "media"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
  device {
    name = "disk-device-1"
    properties = {
      path   = "/home/yumnumm/HDD"
      source = "/mnt/HDD/"
    }
    type = "disk"
  }
}


resource "lxd_instance" "sandbox" {
  allow_restart = false
  config = {
    "raw.idmap"                 = "both 1000 1000"
    "security.idmap.isolated"   = "true"
    "security.nesting"          = "true"
    "security.protection.shift" = "true"
  }
  description      = "wakapi, wikijs"
  ephemeral        = false
  execs            = null
  image            = "images:ubuntu/noble/amd64"
  limits           = {}
  name             = "sandbox"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
  device {
    name = "disk-device-1"
    properties = {
      path   = "/home/yumnumm/wakapi"
      source = "/mnt/HDD/wakapi"
    }
    type = "disk"
  }
  device {
    name = "disk-device-2"
    properties = {
      path   = "/home/yumnumm/.ssh"
      source = "/home/yumnumm/.ssh"
    }
    type = "disk"
  }
  device {
    name = "disk-device-4"
    properties = {
      path   = "/home/yumnumm/wikijs"
      source = "/mnt/HDD/container/wikijs"
    }
    type = "disk"
  }
}


resource "lxd_instance" "packer_lxd" {
  allow_restart    = false
  config           = {}
  description      = null
  ephemeral        = false
  execs            = null
  image            = "images:ubuntu/noble/amd64"
  limits           = {}
  name             = "packer-lxd"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
}


resource "lxd_instance" "eqmonitor" {
  allow_restart = false
  config = {
    "raw.idmap"        = "both 1000 1000"
    "security.nesting" = "true"
  }
  description = "WIP"
  ephemeral   = false
  execs       = null
  image       = "images:ubuntu/noble/amd64"
  limits = {
    cpu    = "16"
    memory = "64GiB"
  }
  name             = "eqmonitor"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
}


resource "lxd_instance" "win11" {
  allow_restart = false
  config = {
    "raw.qemu"                   = "-cpu host"
    "security.protection.delete" = "false"
  }
  description = null
  ephemeral   = false
  execs       = null
  image       = null
  limits = {
    cpu    = "80"
    memory = "32GiB"
  }
  name             = "win11"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = false
  target           = null
  timeouts         = null
  type             = "virtual-machine"
  wait_for_network = true
  device {
    name = "gpu-1"
    properties = {
      gputype = "physical"
      pci     = "0000:04:00.0"
    }
    type = "gpu"
  }
  device {
    name = "root"
    properties = {
      path = "/"
      pool = "default"
      size = "120GiB"
    }
    type = "disk"
  }
  device {
    name = "vtpm"
    properties = {
      path = "/dev/tpm0"
    }
    type = "tpm"
  }
}


resource "lxd_instance" "tv" {
  allow_restart = false
  config = {
    "security.nesting"    = "true"
    "security.privileged" = "true"
  }
  description = null
  ephemeral   = false
  execs       = null
  image       = "images:ubuntu/noble/amd64"
  limits = {
    cpu    = "80"
    memory = "8GiB"
  }
  name             = "tv"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = false
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
  device {
    name = "disk-device-1"
    properties = {
      path   = "/home/yumnumm/.ssh"
      source = "/home/yumnumm/.ssh"
    }
    type = "disk"
  }
  device {
    name = "gpu-1"
    properties = {
      gputype = "physical"
      pci     = "0000:04:00.0"
    }
    type = "gpu"
  }
  device {
    name = "rec0demux"
    properties = {
      gid  = "44"
      path = "/dev/dvb/adapter0/demux0"
    }
    type = "unix-char"
  }
  device {
    name = "rec0dvr"
    properties = {
      gid  = "44"
      path = "/dev/dvb/adapter0/dvr0"
    }
    type = "unix-char"
  }
  device {
    name = "rec0frontend"
    properties = {
      gid  = "44"
      path = "/dev/dvb/adapter0/frontend0"
    }
    type = "unix-char"
  }
  device {
    name = "scr3310-card-reader"
    properties = {
      vendorid = "04e6"
    }
    type = "usb"
  }
}


resource "lxd_instance" "docker_registry" {
  allow_restart = false
  config = {
    "raw.idmap"        = "both 1000 1000"
    "security.nesting" = "true"
  }
  description = "harbor (registry.yumnumm.dev)"
  ephemeral   = false
  execs       = null
  image       = "images:ubuntu/noble/amd64"
  limits = {
    memory = "8GiB"
  }
  name             = "docker-registry"
  profiles         = ["default"]
  project          = null
  remote           = null
  running          = true
  target           = null
  timeouts         = null
  type             = "container"
  wait_for_network = true
  device {
    name = "disk-device-1"
    properties = {
      path   = "/data"
      source = "/mnt/HDD/container/docker-registry"
    }
    type = "disk"
  }
}
