resource "aws_vpc" "ec2_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ec2_vpc.id
}

resource "aws_subnet" "sub" {
  for_each = {
    "pub_a" : ["192.168.1.0/24", "${var.aws_region}a", "Public A"]
    "pub_b" : ["192.168.2.0/24", "${var.aws_region}b", "Public B"]
    "pvt_a" : ["192.168.3.0/24", "${var.aws_region}a", "Private A"]
    "pvt_b" : ["192.168.4.0/24", "${var.aws_region}b", "Private B"]
  }

  vpc_id            = aws_vpc.ec2_vpc.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]

  tags = merge(local.common_tags, { Name = each.value[2] })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ec2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ec2_vpc.id
}

resource "aws_route_table_association" "association" {
  for_each = local.subnet_ids

  subnet_id      = each.value
  route_table_id = substr(each.key, 0, 3) == "Pub" ? aws_route_table.public.id : aws_route_table.private.id
}
