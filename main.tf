provider "aws" {
  profile = var.profile
  region = var.region

  assume_role {
    role_arn = var.assumeRole ? "arn:aws:iam::${var.accountID}:role/${var.assumableRole}" : null
  }
}

resource "aws_s3_account_public_access_block" "vss" {
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}