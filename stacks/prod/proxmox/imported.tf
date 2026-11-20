# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "proxmox_virtual_environment_container" "webhost" {
  description           = "webhost\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "parker"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "high-availability"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  cpu {
    architecture = "amd64"
    cores        = 2
    limit        = 0
    units        = 100
  }
  disk {
    acl           = false
    datastore_id  = "containers"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 64
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "webhost"
    dns {
      domain  = null
      servers = ["192.168.30.82"]
    }
    ip_config {
      ipv4 {
        address = "192.168.30.75/24"
        gateway = "192.168.30.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr30"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:B0:28:05"
    mtu          = 0
    name         = "eth0"
    rate_limit   = 0
    vlan_id      = 0
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform from "chong/106"
resource "proxmox_virtual_environment_container" "postgresql" {
  description           = "postgresql\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "chong"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "high-availability"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  disk {
    acl           = false
    datastore_id  = "containers"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 64
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "postgresql"
    dns {
      domain  = null
      servers = ["192.168.30.82"]
    }
    ip_config {
      ipv4 {
        address = "192.168.30.62/24"
        gateway = "192.168.30.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr30"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:AF:6B:61"
    mtu          = 0
    name         = "eth0"
    rate_limit   = 0
    vlan_id      = 0
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform from "chong/110"
resource "proxmox_virtual_environment_container" "ejabberd" {
  description           = "ejabberd\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "chong"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "high-availability"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  disk {
    acl           = false
    datastore_id  = "containers"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 8
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "ejabberd"
    dns {
      domain  = null
      servers = ["192.168.30.82"]
    }
    ip_config {
      ipv4 {
        address = "192.168.30.63/24"
        gateway = "192.168.30.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr30"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:E2:58:45"
    mtu          = 0
    name         = "eth0"
    rate_limit   = 0
    vlan_id      = 0
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_container" "gitea" {
  description           = "gitea\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "parker"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "high-availability"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  cpu {
    architecture = "amd64"
    cores        = 2
    limit        = 0
    units        = 100
  }
  disk {
    acl           = false
    datastore_id  = "containers"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 16
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "gitea"
    dns {
      domain  = null
      servers = ["192.168.30.82"]
    }
    ip_config {
      ipv4 {
        address = "192.168.30.74/24"
        gateway = "192.168.30.1"
      }
    }
  }
  memory {
    dedicated = 2048
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr30"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:88:8D:DD"
    mtu          = 0
    name         = "eth0"
    rate_limit   = 0
    vlan_id      = 0
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform from "parker/108"
resource "proxmox_virtual_environment_container" "hockeypuck" {
  description           = "hockeypuck\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "parker"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "high-availability"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  disk {
    acl           = false
    datastore_id  = "containers"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 16
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "hockeypuck"
    dns {
      domain  = null
      servers = ["192.168.30.82"]
    }
    ip_config {
      ipv4 {
        address = "192.168.30.72/24"
        gateway = "192.168.30.1"
      }
    }
  }
  memory {
    dedicated = 512
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr30"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:82:60:4E"
    mtu          = 0
    name         = "eth0"
    rate_limit   = 0
    vlan_id      = 0
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "phonebox" {
  acpi                                 = true
  bios                                 = "ovmf"
  boot_order                           = ["scsi0", "ide2", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = null
  mac_addresses                        = ["00:00:00:00:00:00", "BC:24:11:6C:F1:14"]
  machine                              = "pc"
  migrate                              = true
  name                                 = "phonebox"
  network_device = [{
    bridge       = "vmbr30"
    disconnected = false
    enabled      = true
    firewall     = false
    mac_address  = "BC:24:11:6C:F1:14"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }]
  node_name           = "chong"
  on_boot             = true
  pool_id             = null
  protection          = false
  purge_on_destroy    = true
  reboot              = false
  reboot_after_update = false
  scsi_hardware       = "virtio-scsi-single"
  started             = true
  stop_on_destroy     = false
  tablet_device       = true
  tags                = ["fixed-host", "proxmox-backup-server"]
  template            = false
  timeout_clone       = 1800
  timeout_create      = 1800
  timeout_migrate     = 1800
  timeout_reboot      = 1800
  timeout_shutdown_vm = 1800
  timeout_start_vm    = 1800
  timeout_stop_vm     = 300
  vm_id               = 112
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    affinity     = null
    architecture = null
    cores        = 1
    flags        = ["+aes"]
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
    units        = 100
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "containers"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = true
    path_in_datastore = "vm-112-disk-1"
    queues            = 0
    replicate         = true
    serial            = null
    size              = 32
    ssd               = true
  }
  efi_disk {
    datastore_id      = "containers"
    file_format       = "raw"
    pre_enrolled_keys = true
    type              = "4m"
  }
  memory {
    dedicated      = 2048
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  operating_system {
    type = "l26"
  }
  serial_device {
    device = "socket"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "exmachina" {
  acpi                                 = true
  bios                                 = "seabios"
  boot_order                           = ["scsi0", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = null
  mac_addresses                        = ["00:00:00:00:00:00", "BC:24:11:58:D1:4C"]
  machine                              = "pc"
  migrate                              = true
  name                                 = "exmachina"
  network_device = [{
    bridge       = "vmbr30"
    disconnected = false
    enabled      = true
    firewall     = false
    mac_address  = "BC:24:11:58:D1:4C"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }]
  node_name           = "parker"
  on_boot             = true
  pool_id             = null
  protection          = false
  purge_on_destroy    = true
  reboot              = false
  reboot_after_update = false
  scsi_hardware       = "virtio-scsi-pci"
  started             = true
  stop_on_destroy     = false
  tablet_device       = true
  tags                = ["debian", "domain-controller", "fixed-host"]
  template            = false
  timeout_clone       = 1800
  timeout_create      = 1800
  timeout_migrate     = 1800
  timeout_reboot      = 1800
  timeout_shutdown_vm = 1800
  timeout_start_vm    = 1800
  timeout_stop_vm     = 300
  vm_id               = 115
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    affinity     = null
    architecture = null
    cores        = 2
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "qemu64"
    units        = 100
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "containers"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = false
    path_in_datastore = "vm-115-disk-0"
    queues            = 0
    replicate         = true
    serial            = null
    size              = 24
    ssd               = false
  }
  efi_disk {
    datastore_id      = "containers"
    file_format       = "raw"
    pre_enrolled_keys = true
    type              = "4m"
  }
  initialization {
    datastore_id = "local"
    file_format  = "qcow2"
    interface    = "ide2"
    upgrade      = true
    ip_config {
      ipv4 {
        address = "dhcp"
        gateway = null
      }
    }
    user_account {
      keys     = []
      password = null # sensitive
      username = "exmachina"
    }
  }
  memory {
    dedicated      = 2048
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  operating_system {
    type = "l26"
  }
  serial_device {
    device = "socket"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "keymaker" {
  acpi                                 = true
  bios                                 = "ovmf"
  boot_order                           = ["scsi0", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = null
  mac_addresses                        = ["00:00:00:00:00:00", "BC:24:11:9C:69:09"]
  machine                              = "pc"
  migrate                              = true
  name                                 = "keymaker"
  network_device = [{
    bridge       = "vmbr30"
    disconnected = false
    enabled      = true
    firewall     = false
    mac_address  = "BC:24:11:9C:69:09"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }]
  node_name           = "chong"
  on_boot             = true
  pool_id             = null
  protection          = false
  purge_on_destroy    = true
  reboot              = false
  reboot_after_update = false
  scsi_hardware       = "virtio-scsi-pci"
  started             = true
  stop_on_destroy     = false
  tablet_device       = true
  tags                = ["debian", "high-availability"]
  template            = false
  timeout_clone       = 1800
  timeout_create      = 1800
  timeout_migrate     = 1800
  timeout_reboot      = 1800
  timeout_shutdown_vm = 1800
  timeout_start_vm    = 1800
  timeout_stop_vm     = 300
  vm_id               = 111
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    affinity     = null
    architecture = null
    cores        = 2
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "qemu64"
    units        = 100
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "containers"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = false
    path_in_datastore = "vm-111-disk-1"
    queues            = 0
    replicate         = true
    serial            = null
    size              = 32
    ssd               = false
  }
  efi_disk {
    datastore_id      = "containers"
    file_format       = "raw"
    pre_enrolled_keys = true
    type              = "4m"
  }
  initialization {
    datastore_id = "local"
    file_format  = "qcow2"
    interface    = "ide2"
    upgrade      = true
    ip_config {
      ipv4 {
        address = "dhcp"
        gateway = null
      }
    }
    user_account {
      keys     = []
      password = null # sensitive
      username = "keymaker"
    }
  }
  memory {
    dedicated      = 2048
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  operating_system {
    type = "l26"
  }
  serial_device {
    device = "socket"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_container" "bluepill" {
  description           = "bluepill\n"
  environment_variables = {}
  hook_script_file_id   = null
  node_name             = "fishburne"
  pool_id               = null
  protection            = false
  start_on_boot         = true
  started               = true
  tags                  = ["debian", "fixed-host"]
  template              = false
  timeout_clone         = null
  timeout_create        = null
  timeout_delete        = null
  timeout_update        = null
  unprivileged          = true
  console {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  cpu {
    architecture = "amd64"
    cores        = 2
    limit        = 0
    units        = 100
  }
  disk {
    acl           = false
    datastore_id  = "backup-storage"
    mount_options = []
    quota         = false
    replicate     = false
    size          = 16
  }
  features {
    fuse    = false
    keyctl  = false
    mknod   = false
    mount   = []
    nesting = true
  }
  initialization {
    entrypoint = null
    hostname   = "bluepill"
    dns {
      domain  = "1337.berkeley.edu"
      servers = ["1.1.1.1"]
    }
    ip_config {
      ipv4 {
        address = "192.168.40.11/24"
        gateway = "192.168.40.1"
      }
    }
  }
  memory {
    dedicated = 512
    swap      = 1024
  }
  network_interface {
    bridge       = "vmbr40"
    enabled      = true
    firewall     = false
    host_managed = false
    mac_address  = "BC:24:11:DF:69:A9"
    mtu          = 0
    name         = "vmbr40"
    rate_limit   = 0
    vlan_id      = 40
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# __generated__ by Terraform
resource "proxmox_virtual_environment_vm" "deus" {
  acpi                                 = true
  bios                                 = "ovmf"
  boot_order                           = ["scsi0", "net0"]
  delete_unreferenced_disks_on_destroy = true
  description                          = null
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = null
  mac_addresses                        = ["00:00:00:00:00:00", "BC:24:11:B7:9C:42"]
  machine                              = "pc"
  migrate                              = true
  name                                 = "deus"
  network_device = [{
    bridge       = "vmbr30"
    disconnected = false
    enabled      = true
    firewall     = false
    mac_address  = "BC:24:11:B7:9C:42"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }]
  node_name           = "chong"
  on_boot             = true
  pool_id             = null
  protection          = false
  purge_on_destroy    = true
  reboot              = false
  reboot_after_update = false
  scsi_hardware       = "virtio-scsi-single"
  started             = true
  stop_on_destroy     = false
  tablet_device       = true
  tags                = ["debian", "domain-controller", "fixed-host"]
  template            = false
  timeout_clone       = 1800
  timeout_create      = 1800
  timeout_migrate     = 1800
  timeout_reboot      = 1800
  timeout_shutdown_vm = 1800
  timeout_start_vm    = 1800
  timeout_stop_vm     = 300
  vm_id               = 113
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    affinity     = null
    architecture = null
    cores        = 2
    flags        = ["+aes"]
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
    units        = 100
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "containers"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = null
    import_from       = null
    interface         = "scsi0"
    iothread          = true
    path_in_datastore = "vm-113-disk-1"
    queues            = 0
    replicate         = true
    serial            = null
    size              = 32
    ssd               = true
  }
  efi_disk {
    datastore_id      = "containers"
    file_format       = "raw"
    pre_enrolled_keys = true
    type              = "4m"
  }
  initialization {
    datastore_id = "local"
    file_format  = "qcow2"
    interface    = "ide2"
    upgrade      = true
    ip_config {
      ipv4 {
        address = "dhcp"
        gateway = null
      }
    }
    user_account {
      keys     = []
      password = null # sensitive
      username = "deus2"
    }
  }
  memory {
    dedicated      = 4096
    floating       = 0
    hugepages      = null
    keep_hugepages = false
    shared         = 0
  }
  operating_system {
    type = "l26"
  }
  serial_device {
    device = "socket"
  }
  lifecycle {
    prevent_destroy = true
  }
}
