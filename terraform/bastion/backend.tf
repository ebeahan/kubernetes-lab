terraform {
  backend "s3" {
    bucket = "kubernetes-terraform"
    key    = "primary/bastion/terraform.tfstate"
    region = "us-west-1"
  }
}
