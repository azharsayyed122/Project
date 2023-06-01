resource "aws_subnet" "aws_public_subnet" {
  vpc_id = aws_vpc.Myvpc_ap_south_1.id
  count = length(var.cidr_public_subnet)
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.vpc_az, count.index)

   tags = {
      Name = "Subnet-Public : Public Subnet ${count.index + 1}"
   }

}

resource "aws_subnet" "aws_private_subnet" {
  vpc_id = aws_vpc.Myvpc_ap_south_1.id
  count = length(var.cidr_private_subnet)
  cidr_block = element(var.cidr_private_subnet, count.index)  
  availability_zone = element(var.vpc_az, count.index)
  
     tags = {
       Name = "Subnet-Private : Private Subnet ${count.index + 1}"
   }
}
