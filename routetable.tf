resource "aws_route_table" "route_table_Public_mumbai" {
  
  vpc_id = aws_vpc.Myvpc_ap_south_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Public_Internet_Gateway.id
  }

  tags = {
     Name = "RT Public: For Jhooq EU Central Project "

  }
}

resource "aws_route_table" "route_table_Private_mumbai" {
  vpc_id = aws_vpc.Myvpc_ap_south_1.id 
  count = length(var.cidr_private_subnet)
  depends_on = [aws_nat_gateway.aws_nat_gateway_mumbai]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws_nat_gateway_mumbai[count.index].id
  }
    tags = {
    Name = "RT Private: For Jhooq EU Central Project "

  }
}