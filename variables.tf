variable "bridge_name" {
  description = "Nom du bridge à créer"
  type        = string
}

variable "vlan_tag" {
  description = "Tag VLAN à appliquer pour l'isolation"
  type        = number
}

variable "cluster_id" {
  description = "Identifiant du cluster (pour nommage)"
  type        = string
}

variable "mtu" {
  description = "MTU à appliquer au bridge"
  type        = number
  default     = 1500
}

variable "parent_interface" {
  description = "Interface physique (ex: eno1) sur laquelle attacher le VLAN"
  type        = string
}
