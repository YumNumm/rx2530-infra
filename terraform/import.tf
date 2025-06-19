# Import blocks for existing LXD instances
import {
  to = lxd_instance.docker_registry
  id = "docker-registry,image=ubuntu:24.04"
}

import {
  to = lxd_instance.eqmonitor
  id = "eqmonitor,image=ubuntu:24.04"
}

import {
  to = lxd_instance.loki
  id = "loki,image=ubuntu:24.04"
}

import {
  to = lxd_instance.media
  id = "media,image=ubuntu:24.04"
}

import {
  to = lxd_instance.monitor
  id = "monitor,image=ubuntu:24.04"
}

import {
  to = lxd_instance.network
  id = "network,image=ubuntu:24.04"
}

import {
  to = lxd_instance.packer_lxd
  id = "packer-lxd,image=ubuntu:24.04"
}

import {
  to = lxd_instance.sandbox
  id = "sandbox,image=ubuntu:24.04"
}

import {
  to = lxd_instance.tv
  id = "tv,image=ubuntu:24.04"
}

import {
  to = lxd_instance.ubuntu_desktop
  id = "ubuntu-desktop,image=ubuntu:24.04"
}

import {
  to = lxd_instance.win11
  id = "win11"
}

import {
  to = lxd_project.default
  id = "default"
}
