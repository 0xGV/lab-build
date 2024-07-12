terraform {
    required_providers {
      proxmox = {
        source = "telmate/proxmox"
        version = "2.9.14"
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

resource "proxmox_vm_qemu" "demo-vm" {
    name            = "demo-vm"
    target_node     = "pxe"
    iso             = "local:iso/archlinux-2024.03.01-x86_64.iso"
    vmid            = 111       
    cores           = 2
    memory          = 2048

    disk{

    size             = "20G"
    type             = "scsi"
    storage          = "local-lvm"
    }
}


