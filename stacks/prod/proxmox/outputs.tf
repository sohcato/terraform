output "vm_ip_addresses" {
  value = {
    knower = module.knower.vm_ip_address
  }
}

output "vm_passwords" {
  value = {
    knower = module.knower.vm_password
  }
  sensitive = true
}
