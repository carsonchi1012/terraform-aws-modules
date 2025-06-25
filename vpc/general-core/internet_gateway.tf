resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      Name = "${var.vpc_identifier}-igw"
    },
    var.tags
  )

  depends_on = [aws_vpc.vpc]
}