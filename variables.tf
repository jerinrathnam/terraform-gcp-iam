# IAM Users
variable "read_only_users" {
  type        = list(string)
  description = "List of email address for Read Only Access to users"
  default     = []
}

variable "write_access_users" {
  type        = list(string)
  description = "List of email address for Write Access to users"
  default     = []
}