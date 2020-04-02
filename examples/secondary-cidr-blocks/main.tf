provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "../../"

  name = "secondary-cidr-blocks-example"

  cidr                  = "10.0.0.0/16"
  secondary_cidr_blocks = ["10.1.0.0/16", "10.2.0.0/16"]

  azs                     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  compute_private_subnets = ["10.0.1.0/24", "10.1.2.0/24", "10.2.3.0/24"]
  compute_public_subnets  = ["10.0.101.0/24", "10.1.102.0/24", "10.2.103.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  compute_public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
