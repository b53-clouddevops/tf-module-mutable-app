# Retrieves the information from the remote vpc state file
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "b53-tfstate-bucket"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
   }
}


# Retrieves the information from the remote vpc alb file
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "b53-tfstate-bucket"
    key    = "alb/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
   }
}