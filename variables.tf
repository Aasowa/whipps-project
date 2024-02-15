variable "region" {
  description = "VPC Region"
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "VPC Region"
  default     = "10.0.0.0/16"
}

variable "public_sub_1_cidr" {
  description = "public sub 1 cidr block"
  default     = "10.0.1.0/24"
}

variable "public_sub_2_cidr" {
  description = "public sub 2 cidr block"
  default     = "10.0.2.0/24"
}

variable "private_sub_1_cidr" {
  description = "private sub 1 cidr block"
  default     = "10.0.3.0/24"
}

variable "private_sub_2_cidr" {
  description = "private sub 2 cidr block"
  default     = "10.0.4.0/24"
}



