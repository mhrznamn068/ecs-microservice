resource "aws_internet_gateway" "public_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
      var.common_tags,
      {
        Name         = "${var.project_name}-${var.env}-public-igw"
      }
  )  
}

resource "aws_eip" "nat_gw_ips" {
  #count = var.num_private_subnets
  vpc   = true

  tags = merge(
    var.common_tags,
    {
    Name         = "${var.project_name}-${var.env}-private-nat-gw-ip"
    Country      = "all"
    Group        = "${var.project_name}"
    }
  )  
}

resource "aws_nat_gateway" "private_nat_gws" {
  #count         = var.num_private_subnets
  
  allocation_id = aws_eip.nat_gw_ips.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(
    var.common_tags,
    {
    Name         = "${var.project_name}-${var.env}-nat-gw"
    Country      = "all"
    Group        = "${var.project_name}"
    }
  )  
  depends_on = [aws_internet_gateway.public_igw]
}