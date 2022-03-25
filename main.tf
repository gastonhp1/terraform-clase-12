data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"

  tags = {
    "${var.name_tag}" = "${var.vpc_name_value}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.aws_subnet_cidr

  tags = {
    "${var.name_tag}" = "${var.subnet_name_value_tag}"
  }

}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id

  tags = {
    "${var.name_tag}" = "${var.app_name_value_tag}"
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id

  tags = {
    Name = "Backend"
  }
}

resource "aws_db_instance" "db" {
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0.19"
    instance_class       = "db.t2.micro"
    name                 = "db"
    username             = "foo"
    password             = "foobarbaz"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
}