variable "network_bridge" {
  description = "Nom du bridge réseau"
  type        = string
  default     = "vmbr0"
}

variable "mtu" {
  description = "Valeur MTU"
  type        = number
  default     = 1500
}
