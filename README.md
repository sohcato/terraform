# 1337NET Terraform

How to create a new VM or container (CT) on Proxmox. Don't create hosts through the Proxmox web UI.

## 1. Clone the repo and make a branch

```
git clone https://git.1337.berkeley.edu/Committee/terraform
cd terraform
git config core.hooksPath .githooks
git switch -c add/<name>
```

The `git config` line turns on a hook that formats your Terraform files every time you commit. You only need to run it once per clone.

## 2. Pick an IP address

On **redpill**, go to **Services → ISC DHCPv4 → [VirtualMachines]**. Look at the **Static DHCP mappings** and take the next available IP.

## 3. Add your host to `stacks/prod/proxmox/main.tf`

Add a block under the header of the node it should run on (`########## PARKER ##########`, etc.).

**VM** (Debian 13, 2 cores, 2 GB RAM, 24 GB disk):

```hcl
module "myvm" {
  source = "../../../modules/proxmox-vm"

  vm_name           = "myvm"
  proxmox_node_name = "parker"
  ssh_keys          = ["ssh-ed25519 AAAA... you@hostname"]
}
```

Put your public SSH key in `ssh_keys` (`cat ~/.ssh/id_ed25519.pub`). You can list more than one. Keys are only added when the host is first created.

**CT** (Debian 12, 1 core, 1 GB RAM, 64 GB disk), using the IP from step 2:

```hcl
module "myct" {
  source = "../../../modules/proxmox-ct"

  description       = "myct"
  ct_hostname       = "myct"
  proxmox_node_name = "chong"
  ip_address        = "192.168.30.XX/24"
  ip_gateway        = "192.168.30.1"
  ssh_keys          = ["ssh-ed25519 AAAA... you@hostname"]
}
```

To change the defaults, add settings to your block, for example:

```hcl
  cores       = 4
  ram_size_mb = 4096
  disk_size   = 64
```

All settings are listed in `modules/proxmox-vm/variables.tf` and `modules/proxmox-ct/variables.tf`.

## 4. Push and open a pull request

```
git add stacks/prod/proxmox/main.tf
git commit -m "add <name>"
git push -u origin add/<name>
```

Open a pull request on Gitea. Check the plan in the **Actions** tab or in the comment on your pull request. It should say **`2 to add, 0 to change, 0 to destroy`** for a VM (the VM and its password) or **`1 to add, 0 to change, 0 to destroy`** for a CT. If it says anything else, fix that before asking for a review.

## 5. Get it approved and merged

After a reviewer approves, merge the pull request. Your host is created automatically. When the **Apply** workflow in the **Actions** tab finishes, its last step lists every host with its ID, IP, and MAC address.

## 6. Create the static DHCP mapping

On **redpill**, under **Services → ISC DHCPv4 → [VirtualMachines]**, add a static mapping with your host's **MAC address** (from the Apply output) and the **IP from step 2**.

For a VM, reboot it afterwards so it picks up the IP.

## 7. Log in

**VM:** SSH in with your key as the user named after the VM: `ssh myvm@<ip>`. If you didn't add a key, ask a Management user for the initial password. Management users can read it on Reeves:

```
cd terraform/stacks/prod/proxmox
terraform init
terraform state pull | jq -r '.resources[] | select(.module == "module.myvm" and .type == "random_password") | .instances[0].attributes.result'
```

**CT:** SSH in with your key as root: `ssh root@<ip>`. Without a key, run `pct enter <id>` on the Proxmox node it runs on (the ID is in the Apply output).