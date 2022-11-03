# declaire vars

location            = "eastus"
company             = "dluss"
environment         = "tftraining"
resource_group_name = "rg-tftraining-dlussier"


# vnet 1

address_space = ["10.25.0.0/20"]

subnets = [
  {
    name : "dluss_web_subnet"
    address_prefixes : ["10.25.0.0/24"]
  },
  { name : "dluss_app_subnet"
    address_prefixes : ["10.25.1.0/24"]
  },
  { name : "dluss_data_subnet"
    address_prefixes : ["10.25.2.0/24"]
  }
]