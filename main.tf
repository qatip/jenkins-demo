provider "aws" {
  region = "us-west-2"
}
terraform {
  backend "s3" {
    bucket         = "jenkins-state-michael"        # Replace with your bucket name
    key            = "terraform.tfstate"  # Path inside the bucket
    region         = "us-west-2"                  # Replace with your AWS region
    encrypt        = true                         # Enable server-side encryption
  }
}
resource "aws_s3_bucket" "example" {
bucket = "my-example-bucket-mcg-3"
acl    = "private"
}
