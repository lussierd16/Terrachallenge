# instantiate vars

variable "location" {
  default = "EastUS"
}

#variable "password" {}

variable "company" {}

variable "environment" {}

variable "tags" {
  default = { creator = "dluss", deployment = "terraform" }

}

variable "address_space" {}

variable "resource_group_name" {}

variable "subnets" {}