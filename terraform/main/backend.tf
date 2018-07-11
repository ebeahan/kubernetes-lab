terraform {
  backend "s3" {
    bucket = "kubernetes-terraform"
    key    = "primary/main/terraform.tfstate"
    region = "us-west-1"
  }
}
