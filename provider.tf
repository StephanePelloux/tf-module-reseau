# =============================================================================
# PROXMOX VM MODULE - PROVIDER CONFIGURATION
# =============================================================================
# This file specifies the required providers for the Proxmox VM module
# It ensures the module uses the correct Proxmox provider version

# -----------------------------------------------------------------------------
# Terraform Configuration Block
# -----------------------------------------------------------------------------
# Specifies the required providers and their versions for this module

terraform {
  required_version = ">= 1.12.0" # Minimum Terraform version required
  required_providers {
    proxmox = {
      source  = "bpg/proxmox" # Official Proxmox provider from bpg
      version = "0.78.2"      # Specific version to ensure compatibility
    }
  }
}

provider "proxmox" {
  insecure = true # Allow insecure connections (self-signed certs)
}
