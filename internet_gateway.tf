resource "aws_internet_gateway" "Public_Internet_Gateway" {
  vpc_id = aws_vpc.Myvpc_ap_south_1.id

  tags = {
    Name = "Public_IG_mumbai"
  }
}