resource "aws_route_table" "rtb_public" {
  count = length(var.vpc_public_subnets_cidr)

  vpc_id = aws_vpc.vpc.id
  tags = merge(
    {
      Name = "${var.vpc_identifier}-rtb-public-${count.index + 1}"
    },
    var.tags
  )

  depends_on = [aws_vpc.vpc]
}

resource "aws_route_table" "rtb_private" {
  count = length(var.vpc_private_subnets_cidr)

  vpc_id = aws_vpc.vpc.id
  tags = merge(
    {
      Name = "${var.vpc_identifier}-rtb-private-${count.index + 1}"
    },
    var.tags
  )

  depends_on = [aws_vpc.vpc]
}