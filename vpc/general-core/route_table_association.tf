resource "aws_route_table_association" "rtba_public_association" {
  count = length(var.vpc_public_subnets_cidr)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.rtb_public[count.index].id

  depends_on = [aws_subnet.public_subnet, aws_route_table.rtb_public]
}

resource "aws_route_table_association" "rtba_private_association" {
  count = length(var.vpc_private_subnets_cidr)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.rtb_private[count.index].id

  depends_on = [aws_subnet.private_subnet, aws_route_table.rtb_private]
}