# =============================================================================
# PROXMOX VM MODULE VARIABLES
# =============================================================================
# This file defines input variables for the Proxmox VM module
# These variables are used to configure the virtual machine properties

# -----------------------------------------------------------------------------
# Required Variables (must be provided by the caller)
# -----------------------------------------------------------------------------

variable "name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "node_name" {
  description = "Name of the Proxmox node where the VM will be created"
  type        = string
  default     = "spxprox"
}

variable "vm_id" {
  description = "Unique identifier for the virtual machine"
  type        = number
  default     = 1011
}

variable "pool_id" {
  description = "ID of the Proxmox pool to assign the VM to"
  type        = string
  default     = "idp"
}

variable "clone_node" {
  description = "Proxmox node where the template VM is located"
  type        = string
  default     = "proxmox"
}

variable "template_id" {
  description = "ID of the template VM to clone from"
  type        = number
  default     = 100
}

variable "datastore_id" {
  description = "Name of the storage datastore for VM disks"
  type        = string
  default     = "local-lvm"
}

variable "tags" {
  description = "List of tags to apply to the VM"
  type        = list(string)
  default     = []
}

variable "owner" {
  description = "Owner of the VM, used for tagging"
  type        = string
  default     = "terraform-automation"

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]+$", var.owner))
    error_message = "The owner may only contain letters, digits, underscores, dots or hyphens (no spaces or colons)."
  }
}
# -----------------------------------------------------------------------------
# CPU Configuration Variables
# -----------------------------------------------------------------------------

variable "cpu_cores" {
  description = "Number of CPU cores to allocate to the VM"
  type        = number
  default     = 1
}

variable "cpu_sockets" {
  description = "Number of CPU sockets to allocate to the VM"
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "CPU type for the virtual machine (host, kvm64, etc.)"
  type        = string
  default     = "host"
}

# -----------------------------------------------------------------------------
# Memory Configuration
# -----------------------------------------------------------------------------

variable "memory_mb" {
  description = "Amount of memory in MB to allocate to the VM"
  type        = number
  default     = 1024
}

# -----------------------------------------------------------------------------
# Disk Configuration Variables
# -----------------------------------------------------------------------------

variable "disk_size" {
  description = "Size of the primary disk in GB"
  type        = number
  default     = 10
}

variable "disk_interface" {
  description = "Disk interface type (scsi0, ide0, etc.)"
  type        = string
  default     = "scsi0"
}

# -----------------------------------------------------------------------------
# Network Configuration Variables
# -----------------------------------------------------------------------------

variable "network_bridge" {
  description = "Network bridge to connect the VM to"
  type        = string
  default     = "vmbr0"
}

variable "network_model" {
  description = "Network interface model (virtio, e1000, etc.)"
  type        = string
  default     = "virtio"
}

variable "vlan_id" {
  description = "VLAN ID for network interface (null for no VLAN)"
  type        = number
  default     = null
}

# -----------------------------------------------------------------------------
# VM Agent and Startup Configuration
# -----------------------------------------------------------------------------

variable "agent_enabled" {
  description = "Whether to enable the QEMU guest agent"
  type        = bool
  default     = false
}

variable "startup_order" {
  description = "Boot order for the VM (lower numbers boot first)"
  type        = number
  default     = 1
}

