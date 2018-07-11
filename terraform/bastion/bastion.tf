module "security_group" {
  source = "../modules/common/aws/compute/security-group"

  name        = "allow-ssh"
  description = "Security group for allowing SSH access to bastion"
  vpc_id      = "${data.terraform_remote_state.main.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_rules        = ["all-all"]
}

resource "aws_eip" "this" {
  vpc      = true
  instance = "${module.ec2.id[0]}"
}

module "ec2" {
  source = "../modules/common/aws/compute/ec2"

  instance_count = 1

  name                        = "bastion"
  ami                         = "${local.bastion_ami}"
  instance_type               = "${local.instance_type}"
  key_name                    = "${local.key_name}"
  subnet_id                   = "${element(data.terraform_remote_state.main.public_subnets, 0)}"
  vpc_security_group_ids      = "${module.security_group.this_security_group_id}"
  associate_public_ip_address = true
}
