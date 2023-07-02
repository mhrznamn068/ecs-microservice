resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
      var.common_tags,
      {
    Name = "${var.project_name}-${var.env}-rt-public"
    SubnetType = "public"
      }
  )  
}

resource "aws_route_table" "private_route_table" {
  vpc_id  = aws_vpc.vpc.id

  tags = merge(
      var.common_tags,
      {
    Name = "${var.project_name}-${var.env}-rt-private"
    SubnetType = "private"
      }
  )  
}

resource "aws_route_table_association" "public_rt_assoc" {
  count           = var.num_public_subnets
  subnet_id       = aws_subnet.public_subnets[count.index].id
  route_table_id  = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = var.num_private_subnets
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route" "prod_rt_public_egress" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_igw.id
}

resource "aws_route" "prod_rt_private_egress" {
  route_table_id          = aws_route_table.private_route_table.id
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id          = aws_nat_gateway.private_nat_gws.id
}
