# data source to read the instance ami 
data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name   = "name"
        values =  ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230325"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

data "aws_secretsmanager_secret" "user_credentials" {
  arn = var.terraform_user_secret_arn

}

data "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = data.aws_secretsmanager_secret.user_credentials.id
}
