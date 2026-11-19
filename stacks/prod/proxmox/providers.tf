provider "proxmox" {
  # Proxmox with Terraform is cluster-aware to an extent -- for our purposes, setting
  # the endpoint to any Proxmox node is sufficient

  # Proxmox API endpoint
  endpoint = "https://192.168.30.70:8006"

  # API token authentication (through environment variables)
  api_token = var.proxmox_api_token

  # Accept self-signed certificates (TODO: change in the future if necessary)
  insecure = true

  # Allow SSH connections for certain operations (like uploading ISO files)
  # https://registry.terraform.io/providers/bpg/proxmox/latest/docs#ssh-connection
  ssh {
    agent       = false
    username    = "svc-terraform"
    private_key = var.proxmox_ssh_private_key
    # port = 22
    node {
      name    = "parker"
      address = "192.168.30.70"
    }
  }
}
