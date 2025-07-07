variable "bridge_name" {
  description = "Bridge name"
  type        = string
  default     = "vmbr0"
}

variable "vlan_tag" {
  description = "Tag VLAN à appliquer pour l'isolation"
  type        = number
  default = 0
}

# variable "cluster_id" {
#   description = "Identifiant du cluster (pour nommage)"
#   type        = string
# }

variable "mtu" {
  description = "MTU à appliquer au bridge"
  type        = number
  default     = 1500
}

variable "parent_interface" {
  description = "Interface physique"
  type        = string
  default     = "virtio"
}
