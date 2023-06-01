resource "aws_eip" "aws_eip_mumbai" {
    count = length(var.cidr_private_subnet)
    vpc = true
}
resource "aws_nat_gateway" "aws_nat_gateway_mumbai" {
    count = length(aws_subnet.aws_private_subnet)
    depends_on = [ aws_eip.aws_eip_mumbai ]
    allocation_id = aws_eip.aws_eip_mumbai[count.index].id
    subnet_id = aws_subnet.aws_private_subnet[count.index].id
  
  tags = {
    Name = "Private NAT gw "
  }
}