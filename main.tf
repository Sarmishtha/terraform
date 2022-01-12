

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
provider "aws" {
    region="us-east1"
    access_key ="AKIAVOY4DO64U2UI4R7F"
    secret_key ="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"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  subnet_id              = "subnet-01734ba5298cddaa7"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  subnet_id              = "subnet-01c0ecc32a2df76c3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "app"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  subnet_id              = "subnet-01c0ecc32a2df76c3"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
