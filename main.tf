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