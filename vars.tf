variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"

}

variable "profile" {

  type    = string
  default = "default"

}

variable "vpc_cidr_block" {
  type = string
}


variable "subnets" {
  type = list(object({
    name       = string
    cidr_block = string
    type       = string
  }))

}

variable "instances" {
  type = list(object({
    name   = string
    subnet = string
    type   = string
  }))

}