terraform {
  backend "s3" {
    bucket = "kubernetes-terraform"
    key    = "primary/compute/terraform.tfstate"
    region = "us-west-1"
  }
}
