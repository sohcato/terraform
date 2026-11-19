removed {
  from = module.deus
  lifecycle { destroy = false }
}

removed {
  from = module.exmachina
  lifecycle { destroy = false }
}

removed {
  from = module.deus2
  lifecycle { destroy = false }
}

removed {
  from = module.keymaker
  lifecycle { destroy = false }
}

removed {
  from = module.phonebox
  lifecycle { destroy = false }
}

removed {
  from = module.bluepill
  lifecycle { destroy = false }
}

removed {
  from = module.webhost
  lifecycle { destroy = false }
}

removed {
  from = module.postgresql
  lifecycle { destroy = false }
}

removed {
  from = module.gitea
  lifecycle { destroy = false }
}

removed {
  from = module.hockeypuck
  lifecycle { destroy = false }
}

removed {
  from = module.ejabberd
  lifecycle { destroy = false }
}

import {
  to = module.operator.proxmox_virtual_environment_container.this
  id = "parker/101"
}

import {
  to = proxmox_virtual_environment_vm.exmachina
  id = "parker/115"
}

import {
  to = proxmox_virtual_environment_vm.keymaker
  id = "chong/111"
}

import {
  to = proxmox_virtual_environment_vm.phonebox
  id = "chong/112"
}

import {
  to = proxmox_virtual_environment_vm.deus
  id = "chong/113"
}

import {
  to = proxmox_virtual_environment_container.webhost
  id = "parker/105"
}

import {
  to = proxmox_virtual_environment_container.gitea
  id = "parker/107"
}

import {
  to = proxmox_virtual_environment_container.hockeypuck
  id = "parker/108"
}

import {
  to = proxmox_virtual_environment_container.postgresql
  id = "chong/106"
}

import {
  to = proxmox_virtual_environment_container.ejabberd
  id = "chong/110"
}

import {
  to = proxmox_virtual_environment_container.bluepill
  id = "fishburne/104"
}
