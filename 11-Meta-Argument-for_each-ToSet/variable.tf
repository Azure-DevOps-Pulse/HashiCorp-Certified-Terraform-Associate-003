variable "RG_locations" {
  description = "Resource group location"
  type = map(toset)
  default = {
    toset(["westus", "eastus", "westus2"])
  }
}