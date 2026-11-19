output "vm_id" {
  description = "The Proxmox VM ID assigned to the instance."
  value       = proxmox_virtual_environment_vm.this.vm_id
}

output "vm_ip_address" {
  description = "The DHCP IP address assigned to the VM."
  value       = try([for ip in flatten(proxmox_virtual_environment_vm.this.ipv4_addresses) : ip if ip != "127.0.0.1"][0], "DHCP IP address has not been assigned yet.")
}