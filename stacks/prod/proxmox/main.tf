########## EXAMPLES ##########

# module "myvm" {
#   source = "../../../modules/proxmox-vm"
#
#   vm_name           = "myvm"
#   proxmox_node_name = "parker"
#   ssh_keys          = ["ssh-ed25519 AAAA... you@hostname"]
# }

# module "myct" {
#   source = "../../../modules/proxmox-ct"
#
#   description       = "myct"
#   ct_hostname       = "myct"
#   proxmox_node_name = "chong"
#   ip_address        = "192.168.30.XX/24"
#   ip_gateway        = "192.168.30.1"
# }

########## PARKER ##########

module "knower" {
  # Point to the reusable module folder
  source = "../../../modules/proxmox-vm"

  vm_name           = "knower"
  proxmox_node_name = "parker"
  vm_id             = 114
  datastore_type    = "containers"
  disk_import_from  = proxmox_download_file.debian_cloud.id

  vendor_data_file_id = null

  cores       = 4
  ram_size_mb = 8192
  disk_size   = 64
}

module "operator" {
  source = "../../../modules/proxmox-ct"

  description       = "operator"
  ct_id             = 101
  proxmox_node_name = "parker"

  is_unprivileged = true

  disk_datastore_id = "backup-storage"

  disk_size = 32

  cpu_cores = 2

  ct_hostname = "operator"
  ip_address  = "192.168.30.14/24"
  ip_gateway  = "192.168.30.1"

  dedicated_memory = 1024

  network_interface_mac_address = "BC:24:11:76:06:C3"

  is_keyctl = true
}

########## CHONG ##########

module "constructor" {
  source = "../../../modules/proxmox-ct"

  description       = "builder"
  ct_id             = 117
  proxmox_node_name = "chong"

  is_unprivileged = true

  disk_size = 16

  cpu_cores = 2

  ct_hostname = "constructor"
  ip_address  = "192.168.30.66/24"
  ip_gateway  = "192.168.30.1"

  dedicated_memory = 1024
}

# Grabbing the Debian installer from the cloud because it contains cloud-init which is required to auto-install QEMU
resource "proxmox_download_file" "debian_cloud" {
  node_name    = "parker"
  datastore_id = "iso"
  content_type = "import"

  file_name = "debian-13-generic-amd64.qcow2"
  url       = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
}

resource "proxmox_virtual_environment_file" "autoinstall_config" {
  content_type = "snippets"
  datastore_id = "iso"
  node_name    = "parker"

  source_raw {
    file_name = "autoinstall_config.yaml"
    data = "#cloud-config\n${yamlencode({
      ssh_pwauth     = true
      package_update = true
      packages       = ["qemu-guest-agent"]
      runcmd = [
        ["systemctl", "enable", "--now", "qemu-guest-agent"]
      ]
    })}"
  }
}
