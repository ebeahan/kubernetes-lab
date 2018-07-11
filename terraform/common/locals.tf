locals {
  bastion_ami    = "ami-d7b355b4"
  compute_ami    = "ami-11b25172"
  instance_type  = "t2.micro"
  tag_created_by = "Terraform"
  key_name       = "aws_us_west_1"
}
