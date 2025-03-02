instance_type  = "t2.micro"
region         = "us-east-1"
profile        = "default"
vpc_cidr_block = "10.0.0.0/16"
subnets = [
  {
    name       = "pub_subnet_1"
    cidr_block = "10.0.0.0/24"
    type       = "public"
    az         = "1a"
  },
  {
    name       = "pub_subnet_2"
    cidr_block = "10.0.1.0/24"
    type       = "public"
    az         = "1b"

  },
  {

    name       = "priv_subnet_1"
    cidr_block = "10.0.2.0/24"
    type       = "private"
    az         = "1a"

  },
  {
    name       = "priv_subnet_2"
    cidr_block = "10.0.3.0/24"
    type       = "private"
    az         = "1b"

  }
]

instances = [
  {
    name   = "bastion"
    subnet = "pub_subnet_1",
    type   = "public"
  },
  {
    name   = "application",
    subnet = "priv_subnet_1"
    type   = "private"
  }

]