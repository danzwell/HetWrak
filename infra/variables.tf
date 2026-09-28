variable "project" {
  description = "Korte naam van het project, gebruikt in resourcenamen."
  type        = string
  default     = "wrak"
}

variable "location" {
  description = "Azure-regio."
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "dev, acc of prod."
  type        = string
  default     = "prod"
}
