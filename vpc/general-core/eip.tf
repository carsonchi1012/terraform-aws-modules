resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.vpc_identifier}-natg-eip"
    },
    var.tags
  )
}