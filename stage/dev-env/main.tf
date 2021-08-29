resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "GithAction"
  }
}

resource "aws_kms_key" "abcdef" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}s

resource "aws_kms_alias" "a" {
  name          = "alias/myolukey-actions"
  target_key_id = aws_kms_key.abcdef.key_id
}

terraform {
  backend "s3" {}
}