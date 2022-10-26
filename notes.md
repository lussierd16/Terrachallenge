# Initial setup

## install TF 

    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt-get install terraform

## install az cli

https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

## login to azure 
Az cli : 

    az login --tenant ##tenant-id
    az account set --subscription ##subscription-id
    az account show 


## Import
I changed computers with local state file so I had to import the one rg.
```
terraform import azurerm_resource_group.rg1 "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/rg-tftraining-dlussier"
    azurerm_resource_group.rg1: Importing from ID "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/rg-tftraining-dlussier"...
`   azurerm_resource_group.rg1: Import prepared!
    Prepared azurerm_resource_group for import
azurerm_resource_group.rg1: Refreshing state... [id=/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/rg-tftraining-dlussier]
```
