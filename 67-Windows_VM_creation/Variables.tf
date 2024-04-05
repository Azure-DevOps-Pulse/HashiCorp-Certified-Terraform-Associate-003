variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "eastus"
}

variable "storage_account_name" {
  type        = string
  default     = "Azuredevopspulsestorage01"
  description = "Storage account name for demo purpose"
}

variable "comman_tags" {
  type = map(string)
  default = {
    owner = "hriyen"
    dept  = "IT"
    Env   = "staging"
    Application = "web server"
  }
}