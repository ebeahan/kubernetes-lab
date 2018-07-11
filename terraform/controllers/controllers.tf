module "security_group" {
  source = "../modules/common/aws/compute/security-group"

  name        = "allow-controller-traffic"
  description = "Security group for allowing access to k8s controllers"
  vpc_id      = "${data.terraform_remote_state.main.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "all-icmp", "kubernetes-controller-tcp"]
  egress_rules        = ["all-all"]
}

module "ec2" {
  source = "../modules/common/aws/compute/ec2"

  instance_count = 3

  name                   = "k8s-controller"
  ami                    = "${local.compute_ami}"
  instance_type          = "${local.instance_type}"
  key_name               = "${local.key_name}"
  subnet_id              = "${element(data.terraform_remote_state.main.private_subnets, 0)}"
  vpc_security_group_ids = "${module.security_group.this_security_group_id}"
}

module "ec2_workers" {
  source = "../modules/common/aws/compute/ec2"

  instance_count = 3

  name                   = "k8s-worker"
  ami                    = "${local.compute_ami}"
  instance_type          = "${local.instance_type}"
  key_name               = "${local.key_name}"
  subnet_id              = "${element(data.terraform_remote_state.main.private_subnets, 0)}"
  vpc_security_group_ids = "${module.security_group.this_security_group_id}"
}
