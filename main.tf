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
    bridge_name = var.bridge_name
    mtu         = var.mtu
  }
}

resource "null_resource" "network_config" {
  triggers = {
    config = data.template_file.network_interface.rendered
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${data.template_file.network_interface.rendered}' > /etc/network/interfaces.d/${var.bridge_name}.cfg",
      "ifup ${var.bridge_name}"
    ]
  }
}