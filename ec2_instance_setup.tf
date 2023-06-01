data "aws_subnet" "public_subnet" {
  
  filter {
    name = "tag:Name"
    values = ["Subnet-Public : Public Subnet 1"]
  }

  depends_on = [
    aws_route_table_association.private_subnet_assocaition
  ]
}

resource "aws_instance" "ec2_example" {
  ami = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Public Subnet 1"
  }

  subnet_id = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_vpc_mumbai.id]
}
