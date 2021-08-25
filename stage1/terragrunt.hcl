remote_state {
  backend = "s3"
  config = {
    bucket         = "my-bucket-prod-env143"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    role_arn       = "arn:aws:iam::452012047556:role/admin_role"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws"{
  assume_role {
    role_arn = "arn:aws:iam::452012047556:role/admin_role"
  }
}
EOF
}