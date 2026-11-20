variable "vm_name" {
  type = string
}

variable "vm_id" {
  type    = number
  default = null
}

variable "reboot_after_update" {
  type    = bool
  default = false
}

variable "proxmox_node_name" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "ram_size_mb" {
  type    = number
  default = 2048
}

variable "datastore_type" {
  type    = string
  default = "containers"
}

variable "disk_import_from" {
  type    = string
  default = "iso:import/debian-13-generic-amd64.qcow2"
  # default = proxmox_virtual_environment_download_file.debian_cloud.id
}

# variable "disk_image" {
# 	type = string
# 	default = "iso:iso/debian-13.2.0-amd64-netinst.iso"
# }


variable "disk_size" {
  type    = number
  default = 24
}
variable "disk_interface" {
  type    = string
  default = "scsi0"
}

variable "disk_backup" {
  type    = bool
  default = true
}

variable "efi_disk_datastore_type" {
  type     = string
  default  = "containers"
  nullable = false

  validation {
    condition     = !contains(["local", "local-lvm"], var.efi_disk_datastore_type)
    error_message = "EFI disks must not live on local or local-lvm."
  }
}

variable "efi_disk_file_format" {
  type     = string
  default  = "raw"
  nullable = false
}

variable "efi_disk_pre_enrolled_keys" {
  type     = bool
  default  = true
  nullable = false
}

variable "efi_disk_type" {
  type     = string
  default  = "4m"
  nullable = false
}

# THis is the VLAN to set -- this DOENS'T set the VLAN tag, which is what we want
variable "network_bridge" {
  type    = string
  default = "vmbr30"
}

# This is if you WANT a VLAN tag.
# variable "vlan_id" {
# 	type = number
# 	default = 30
# }

variable "operating_system" {
  type    = string
  default = "l26"
}

variable "is_qemu" {
  type    = bool
  default = true
}

variable "vendor_data_file_id" {
  type    = string
  default = "iso:snippets/autoinstall_config.yaml"
}

variable "ssh_keys" {
  type     = list(string)
  default  = []
  nullable = false
}

# variable "proxmox_api_token" {
# 	description 	= "The API token for Proxmox authentication"
# 	type			= string
# 	sensitive 		= true 	# Don't show in console outputs
# }

variable "bios" {
  type    = string
  default = "seabios"
}

variable "machine" {
  type    = string
  default = "pc"
}

variable "iothread" {
  type    = bool
  default = false
}

variable "cpu_type" {
  type    = string
  default = "qemu64"
  # default = "x86-64-v2-AES"
}

variable "cpu_flags" {
  type     = list(string)
  default  = []
  nullable = false
}

variable "scsi_hardware" {
  type    = string
  default = "virtio-scsi-pci"
}

variable "disk_discard_setting" {
  type    = string
  default = "ignore"
}

variable "disk_ssd" {
  type    = bool
  default = false
}
