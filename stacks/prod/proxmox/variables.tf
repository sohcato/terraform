variable "proxmox_ssh_private_key" {
  description = "Private key of the svc-terraform user on the Proxmox nodes"
  type        = string
  sensitive   = true
}

variable "proxmox_api_token" {
  description = "The API token for Proxmox authentication in the form user@realm!tokenid=token-value"
  type        = string
  sensitive   = true # Don't show in console outputs
}

# variable "username" {
# 	type			= string
# 	sensitive 		= true 	# Don't show in console outputs
# }
# variable "password" {
# 	type			= string
# 	sensitive 		= true 	# Don't show in console outputs
# }
