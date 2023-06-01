#creating VPC in mumbai region ap-south-1
#cidr = 10.0.0.0/16

resource "aws_vpc" "Myvpc_ap_south_1" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC_south_1"

  }
}