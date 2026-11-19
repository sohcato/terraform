# 1337NET Terraform

How to create a new VM or container (CT) on Proxmox. Don't create hosts through the Proxmox web UI.

## 1. Clone the repo and make a branch

```
git clone https://git.1337.berkeley.edu/Committee/terraform
cd terraform
git switch -c add-<name>
```

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
}
```

**CT** (Debian 12, 1 core, 1 GB RAM, 64 GB disk), using the IP from step 2:

```hcl
module "myct" {
  source = "../../../modules/proxmox-ct"

  description       = "myct"
  ct_hostname       = "myct"
  proxmox_node_name = "chong"
  ip_address        = "192.168.30.XX/24"
  ip_gateway        = "192.168.30.1"
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

If you have Terraform installed (it is on Reeves), run this from the repo root first:

```
terraform fmt -recursive
```

Then:

```
git add stacks/prod/proxmox/main.tf
git commit -m "add <name>"
git push -u origin add-<name>
```

Open a pull request on Gitea. Check the plan in the **Actions** tab or in the comment on your pull request. It should say **`1 to add, 0 to change, 0 to destroy`**. If it says anything else, fix that before asking for a review.

## 5. Get it approved and merged

After a reviewer approves, merge the pull request. Your host is created automatically. When the **Apply** workflow in the **Actions** tab finishes, its last step lists every host with its ID, IP, and MAC address.

## 6. Create the static DHCP mapping

On **redpill**, under **Services → ISC DHCPv4 → [VirtualMachines]**, add a static mapping with your host's **MAC address** (from the Apply output) and the **IP from step 2**.

For a VM, reboot it afterwards so it picks up the IP.

## 7. Log in

**VM:** SSH in as the user named after the VM (`myvm@<ip>`). Ask an admin for the initial password, then change it with `passwd`.

**CT:** on the Proxmox node it runs on, run `pct enter <id>` (the ID is in the Apply output).