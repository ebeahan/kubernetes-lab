# Bastion Node
resource "aws_instance" "bastion_node" {
  count                       = 1
  ami                         = "${local.bastion_ami}"
  instance_type               = "t2.nano"
  vpc_security_group_ids      = ["${aws_security_group.bastion_group.id}"]
  associate_public_ip_address = true
  subnet_id                   = "${data.terraform_remote_state.main.public_subnets[0]}"
  key_name                    = "${local.key_name}"

  tags {
    Name       = "bastion-${count.index}"
    created_by = "${local.tag_created_by}"
  }
}
