data "terraform_remote_state" "main" {
  backend = "s3"

  config {
    bucket = "kubernetes-terraform"
    key    = "primary/main/terraform.tfstate"
    region = "us-west-1"
  }
}
