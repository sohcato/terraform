resource "proxmox_virtual_environment_vm" "this" {
  name                = var.vm_name
  node_name           = var.proxmox_node_name
  migrate             = true
  vm_id               = var.vm_id
  bios                = var.bios
  reboot_after_update = var.reboot_after_update

  lifecycle {
    # Never destroy any existing VMs
    prevent_destroy = true

    # Ignore the following changes:
    ignore_changes = [
      disk
    ]

  }

  machine = var.machine

  # Stop rather than shutdown or else it'll hang
  # stop_on_destroy = true

  scsi_hardware = var.scsi_hardware

  cpu {
    cores = var.cores
    type  = var.cpu_type
    # hotplugged = var.hotplugged
    # units = var.cpu_units
    flags = var.cpu_flags
  }

  memory {
    dedicated = var.ram_size_mb
  }

  disk {
    datastore_id = var.datastore_type
    backup       = var.disk_backup
    import_from  = var.disk_import_from # proxmox_virtual_environment_download_file.debian_cloud.id
    size         = var.disk_size
    interface    = var.disk_interface
    iothread     = var.iothread
    discard      = var.disk_discard_setting
    ssd          = var.disk_ssd
  }

  # Required to be set if bios=ovmf
  dynamic "efi_disk" {
    for_each = var.bios == "ovmf" ? [1] : []
    content {
      datastore_id      = var.efi_disk_datastore_type
      file_format       = var.efi_disk_file_format
      pre_enrolled_keys = var.efi_disk_pre_enrolled_keys
      type              = var.efi_disk_type
    }
  }

  network_device {
    model        = "virtio"
    bridge       = var.network_bridge
    disconnected = false
  }

  operating_system {
    type = var.operating_system
  }

  # Always enable the QEMU agent so that we can observe the IP address in outputs.tf after the VM gets provisioned
  agent {
    enabled = var.is_qemu
    wait_for_ip {
      disabled = true
    }
  }

  serial_device {
    device = "socket"
  }

  initialization {
    datastore_id = "containers"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = var.vm_name
      password = random_password.vm_initial_password.result
    }

    vendor_data_file_id = var.vendor_data_file_id
  }
}

# Random password generated per VM for initial login -- please change afterwards
# in case the resource is saved in Terraform's state
resource "random_password" "vm_initial_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  min_upper        = 3
}

output "vm_password" {
  value     = random_password.vm_initial_password.result
  sensitive = true
}

