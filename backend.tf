terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-state-bucket-mina-123"
    region       = "us-east-1"
    key          = "terraform.tfstate"
    use_lockfile = true
  }

}
