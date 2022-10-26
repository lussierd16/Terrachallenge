# declaire vars

location = "eastus"
company = "dluss"
environment = "tftraining"
resource_group_name = "rg-tftraining-dlussier"


# vnet 1

address_space = ["10.333.0.0/22"]

subnets = [
  {
    name : "dluss_Subnet"
    address_prefixes : ["10.333.0.0/26"]
  }
]