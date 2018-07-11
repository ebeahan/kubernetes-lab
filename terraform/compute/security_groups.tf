resource "aws_security_group" "compute_sec_group" {
  name        = "compute_sec_group"
  description = "Allows traffic within the VPC on any port"
  vpc_id      = "${data.terraform_remote_state.main.aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${data.terraform_remote_state.main.aws_vpc.main.cidr_block}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["${data.terraform_remote_state.main.aws_vpc.main.cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
