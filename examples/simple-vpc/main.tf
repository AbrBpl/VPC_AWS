provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "../../"

  name = "simple-example"

  cidr = "10.0.0.0/16"

  azs              = ["eu-west-1a", "eu-west-1b", "euw1-az3"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  database_subnets = ["10.0.5.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24", "10.0.104.0/24"]

  enable_nat_gateway = true
  #  single_nat_gateway = true

  create_database_subnet_group = false

  public_subnet_tags = {
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

