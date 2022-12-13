# Account setup
variable "profile" {
  description           = "The profile from ~/.aws/credentials file used for authentication. By default it is the default profile."
  type                  = string
  default               = "default"
}

variable "accountID" {
  description           = "ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role."
  type                  = string

  validation {
    condition           = length(var.accountID) == 12
    error_message       = "Please, provide a valid account ID."
  }
}

variable "region" {
  description           = "The region for the resources. By default it is us-east-1."
  type                  = string
  default               = "us-east-1"
}

variable "assumeRole" {
  description           = "Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration."
  type                  = bool
  default               = false
}

variable "assumableRole" {
  description           = "The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole."
  type                  = string
  default               = "OrganizationAccountAccessRole"
}

variable "block_public_acls" {
  description = "PUT Bucket ACL, PUT Object ACL and PUT Object if request includes a public ACL calls will fail if the specified ACL allows public access. Defaults to true"
  type        = bool
  default     = true
}
variable "block_public_policy" {
  description = "Reject calls to PUT Bucket policy if the specified bucket policy allows public access. Defaults to true"
  type        = bool
  default     = true
}
variable "ignore_public_acls" {
  description = "Ignore all public ACLs on buckets in this account and any objects that they contain. Defaults to true"
  type        = bool
  default     = true
}
variable "restrict_public_buckets" {
  description = "Only the bucket owner and AWS Services can access buckets with public policies. Defaults to true"
  type        = bool
  default     = true
}