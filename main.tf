data "template_file" "network_interface" {
  template = <<EOF
auto ${bridge_name}
iface ${bridge_name} inet manual
    bridge_ports none
    bridge_stp off
    bridge_fd 0
    bridge_vlan_aware yes
    mtu ${mtu}
EOF

  vars = {
    bridge_name = var.network_bridge
    mtu         = var.mtu
  }
}

resource "null_resource" "network_config" {
  triggers = {
    config = data.template_file.network_interface.rendered
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${data.template_file.network_interface.rendered}' > /etc/network/interfaces.d/${var.network_bridge}.cfg",
      "ifup ${var.network_bridge}"
    ]
  }
}
