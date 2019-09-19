provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "cloudreach-lab"
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket         = "state-file-bucket-experiment" 
    key            = "state-files/experiment"
    dynamodb_table = "lock-table-terraform"
    region         = "eu-central-1"
  }
}

module "vpc" {
  source                    = "../modules/vpc"
  main_vpc_cidr_block       = var.main_vpc_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
}

module "vpn" {
  source              = "../modules/vpn"
  main_vpc_id         = module.vpc.main_vpc_id 
  cgw_asn             = var.cgw_asn
  cgw_routable_ip     = var.cgw_routable_ip
  vpc_route_table_id  = module.vpc.route_table_id
}