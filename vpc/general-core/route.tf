resource "aws_route" "igw_public" {
  count = length(var.vpc_public_subnets_cidr)

  route_table_id         = aws_route_table.rtb_public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [aws_route_table.rtb_public]
}

resource "aws_route" "natg_private" {
  count = length(var.vpc_private_subnets_cidr)

  route_table_id         = aws_route_table.rtb_private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id

  depends_on = [aws_route_table.rtb_private]
}