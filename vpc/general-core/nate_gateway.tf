resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = merge(
    {
      Name = "${var.vpc_identifier}-natgw"
    },
    var.tags
  )

  depends_on = [aws_subnet.public_subnet]
}