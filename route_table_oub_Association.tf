resource "aws_route_table_association" "public_subnet_assocaition" {
    count = length(var.cidr_public_subnet)
    depends_on = [aws_subnet.aws_public_subnet , aws_route_table.route_table_Public_mumbai]
    subnet_id = element(aws_subnet.aws_public_subnet[*].id, count.index)
    route_table_id = aws_route_table.route_table_Public_mumbai.id
}

resource "aws_route_table_association" "private_subnet_assocaition" {
    count = length(var.cidr_private_subnet)
    depends_on = [aws_subnet.aws_private_subnet , aws_route_table.route_table_Private_mumbai]
    subnet_id = element(aws_subnet.aws_private_subnet[*].id, count.index)
    route_table_id = aws_route_table.route_table_Private_mumbai[count.index].id
} 