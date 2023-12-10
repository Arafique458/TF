terraform {
  backend "s3" {
    bucket = "terraform-a001"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}