# mod-terraform-aws-s3-global

Terraform module to change s3 global configuration.

## Variables

- **profile** - The profile from ~/.aws/credentials file used for authentication. By default it is the default profile.
- **accountID** - ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role.
- **region** - The region for the resources. By default it is eu-west-1.
- **assumeRole** - Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration.
- **assumableRole** - The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole.
- **block_public_acls** - PUT Bucket ACL, PUT Object ACL and PUT Object if request includes a public ACL calls will fail if the specified ACL allows public access. Defaults to true
- **block_public_policy** - Reject calls to PUT Bucket policy if the specified bucket policy allows public access. Defaults to true
- **ignore_public_acls** - Ignore all public ACLs on buckets in this account and any objects that they contain. Defaults to true
- **restrict_public_buckets** - Only the bucket owner and AWS Services can access buckets with public policies. Defaults to true

## Example

``` terraform
variable accountID { default = "123456789012"}

module "s3_global" {
  source   = "git::https://github.com/virsas/mod-terraform-aws-s3-global.git?ref=v1.0.5"

  profile = "default"
  accountID = var.accountID
  region = "us-east-1"
}

output "s3_global_id" {
    value = module.s3_global.id
}
```

## Outputs

- id