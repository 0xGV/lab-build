terraform {
    required_providers {
      proxmox = {
        source = "telmate/proxmox"
        version = "3.0.1-rc3"
      }
    }
}


# Documentation Link for the provider block:
# https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/index.md
provider "proxmox" {
  #vars.tf values
  pm_api_url = var.api_endpoint

  # secrets.tfvars file values
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret

  pm_tls_insecure = true
}


#Documentation Link :
# https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/vm_qemu.md
resource "proxmox_vm_qemu" "demo-vm" {
    name            = "demo-vm"
    target_node     = "pxe"
    vmid            = 111       
    cores           = 2
    memory          = 2048

    disks{
         ide {
            ide2 {
                cdrom {
                    iso = "local:iso/archlinux-2024.03.01-x86_64.iso"
                }
            }
        }
        scsi{
            scsi0{
                disk{
                    size             = "20G"
                    storage          = "local-lvm"
                }
            }
        }
    }
}


