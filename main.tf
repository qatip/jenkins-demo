provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket-michael"
  acl    = "private"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-west-2"
  }
}
