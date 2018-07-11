terraform {
  backend "s3" {
    bucket = "kubernetes-terraform"
    key    = "primary/controllers/terraform.tfstate"
    region = "us-west-1"
  }
}
