resource "aws_instance" "worker_node" {
  count                       = 3
  ami                         = "${local.compute_ami}"
  instance_type               = "${local.instance_type}"
  vpc_security_group_ids      = ["${aws_security_group.compute_sec_group.id}"]
  associate_public_ip_address = false
  subnet_id                   = "${data.terraform_remote_state.main.aws_subnet.private.id}"
  key_name                    = "${local.key_name}"

  tags {
    Name       = "worker_node-${count.index}"
    created_by = "${local.tag_created_by}"
    role       = "k8s worker"
  }
}
