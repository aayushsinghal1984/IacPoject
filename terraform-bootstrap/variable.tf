variable "org_name" {
  description = " Organization name in Terraform Cloud"
  type        = string
  default     = "HCLIT"
}

variable "env_list" {
  description = "List of environments to create"
  type        = list(string)
  default     = ["dev", "sit", "prod"]
}


variable "tfe_token" {
  description = "TFC API Token"
  type        = string
  sensitive   = true 
}
