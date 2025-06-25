resource "aws_subnet" "public_subnet" {
  count = length(var.vpc_public_subnets_cidr)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_public_subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = merge(
    {
      Name = "${var.vpc_identifier}-public-subnet-${count.index + 1}-${data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]}"
    },
    var.tags
  )

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "private_subnet" {
  count = length(var.vpc_private_subnets_cidr)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_private_subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = merge(
    {
      Name = "${var.vpc_identifier}-private-subnet-${count.index + 1}-${data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]}"
    },
    var.tags
  )

  depends_on = [aws_vpc.vpc]
}