resource "proxmox_virtual_environment_container" "this" {
  description = var.description
  vm_id       = var.ct_id
  node_name   = var.proxmox_node_name

  unprivileged = var.is_unprivileged

  disk {
    datastore_id = var.disk_datastore_id
    size         = var.disk_size
  }

  console {
    enabled   = var.is_console_enabled
    tty_count = var.console_tty_count
  }

  cpu {
    architecture = var.cpu_architecture
    cores        = var.cpu_cores
  }

  features {
    fuse    = var.is_fuse
    keyctl  = var.is_keyctl
    mknod   = var.is_mknod
    nesting = var.is_nesting
  }

  initialization {
    hostname = var.ct_hostname

    dns {
      domain  = var.domain
      servers = var.servers
    }

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.ip_gateway
      }
    }
  }

  memory {
    dedicated = var.dedicated_memory
    swap      = var.swap_memory
  }

  network_interface {
    bridge      = var.network_interface_bridge
    enabled     = var.is_network_interface
    mac_address = var.network_interface_mac_address
    name        = var.network_interface_name
    rate_limit  = var.network_interface_rate_limit
    vlan_id     = var.vlan_id
  }

  operating_system {
    template_file_id = var.operating_system_template_file_id
    type             = var.operating_system
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      disk,
      operating_system
    ]
  }
}



