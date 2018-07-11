module "vpc" {
  source = "../modules/common/aws/network/vpc"

  name = "core-network"

  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a"]
  private_subnets = ["10.0.0.0/19"]
  public_subnets  = ["10.0.128.0/20"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner       = "ebeahan"
    Environment = "prod"
    Name        = "complete"
  }
}
