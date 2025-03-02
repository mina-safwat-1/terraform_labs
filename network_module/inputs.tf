variable "vpc_cidr_block" {
  type = string
}


variable "subnets" {
  type = list(object({
    name       = string
    cidr_block = string
    type       = string
    az         = string
  }))
}

variable "region" {
  type = string
}