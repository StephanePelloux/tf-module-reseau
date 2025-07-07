resource "null_resource" "network_debug" {
  triggers = {
    bridge_name = var.network_bridge
    mtu         = var.mtu
  }

  provisioner "local-exec" {
    command = "echo [TEST NETWORK MODULE] Bridge=${var.network_bridge} MTU=${var.mtu}"
  }
}
