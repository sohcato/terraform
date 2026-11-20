variable "description" {
  type     = string
  nullable = false
}

variable "proxmox_node_name" {
  type     = string
  nullable = false
}

variable "is_unprivileged" {
  type    = bool
  default = true
}

variable "ct_id" {
  type    = number
  default = null
}

variable "disk_datastore_id" {
  type    = string
  default = "containers"
}

variable "disk_size" {
  type    = number
  default = 64
}

variable "is_console_enabled" {
  type    = bool
  default = true
}

variable "console_tty_count" {
  type    = number
  default = 2
}

variable "console_type" {
  type    = string
  default = "tty"
}

variable "cpu_architecture" {
  type    = string
  default = "amd64"
}

variable "cpu_cores" {
  type    = number
  default = 1
}


variable "is_fuse" {
  type    = bool
  default = false
}

variable "is_keyctl" {
  type    = bool
  default = false
}

variable "is_mknod" {
  type    = bool
  default = false
}

variable "is_nesting" {
  type    = bool
  default = true
}

variable "ct_hostname" {
  type     = string
  nullable = false
}

variable "domain" {
  type    = string
  default = ""
}

variable "servers" {
  type    = list(string)
  default = ["192.168.30.82"]
}

variable "ip_address" {
  type    = string
  default = "dhcp"
}

variable "ip_gateway" {
  type    = string
  default = null
}

variable "dedicated_memory" {
  type    = number
  default = 1024
}

variable "swap_memory" {
  type    = number
  default = 1024
}

variable "network_interface_bridge" {
  type    = string
  default = "vmbr30"
}

variable "is_network_interface" {
  type    = bool
  default = true
}

variable "network_interface_mac_address" {
  type    = string
  default = null
}

variable "network_interface_name" {
  type    = string
  default = "eth0"
}

variable "network_interface_rate_limit" {
  type    = number
  default = 0
}

variable "vlan_id" {
  type    = number
  default = 0
}

variable "operating_system" {
  type    = string
  default = "debian"
}

variable "operating_system_template_file_id" {
  type    = string
  default = "iso:vztmpl/debian-12-standard_12.12-1_amd64.tar.zst"
}

variable "ssh_keys" {
  type     = list(string)
  default  = []
  nullable = false
}
