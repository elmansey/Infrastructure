terraform {
  backend "s3" {
    dynamodb_table = "cicd_remotebackendstate"
    bucket = "cicdremotebackendstate"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
  }
}