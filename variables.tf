variable "access_key" {
  type    = string
  default = "AKIAWB4P7DBDVDY2JMFC"
}
variable "secret_key" {
  type    = string
  default = "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"
}

variable "aws_region_id" {
  description = "la region"
  type        = string
  default     = "us-east-1"

}

variable "aws_vpc_cidr" {
  description = "VPC cidr"
  type        = string
  default     = "10.0.0.0/16"

}

variable "name_tag" {
  description = "VPC name tag"
  type        = string
  default     = "Name"

}

variable "vpc_name_value_tag" {
  description = "VPC name value tag"
  type        = string
  default     = "vpc"

}

variable "aws_subnet_cidr" {
  description = "Subnet cidr"
  type        = string
  default     = "10.0.1.0/24"

}

variable "subnet_name_value_tag" {
  description = "subnet name value tag"
  type        = string
  default     = "subnet"

}

variable "subnet_name_value_tag" {
  description = "subnet name value tag"
  type        = string
  default     = "subnet"

}