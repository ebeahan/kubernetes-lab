resource "aws_security_group" "bastion_group" {
  name        = "bastion_sec_group"
  description = "Allows ssh from anywhere to the bastion host"
  vpc_id      = "${data.terraform_remote_state.main.vpc_id}"

  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
