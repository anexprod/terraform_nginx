terraform {
  backend "s3" {
    bucket = "terraform-state-danit-devops-4"
    key    = "users/users/terraform.tfstate"
    region = "eu-central-1"
  }
}
