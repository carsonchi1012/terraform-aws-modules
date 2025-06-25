locals {
  all_rtb = concat(aws_route_table.rtb_public, aws_route_table.rtb_private)

  depends_on = [aws_route_table.rtb_public, aws_route_table.rtb_private]
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${data.aws_region.current.id}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [for rtb in local.all_rtb : rtb.id]

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "*",
        Effect    = "Allow",
        Resource  = "*",
        Principal = "*"
      }
    ]
  })

  tags = merge(
    {
      Name = "${var.vpc_identifier}-s3-vpc-endpoint"
    },
    var.tags
  )
}