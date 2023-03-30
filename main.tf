terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = true #deletes the os disk along with the vm when terraform destroy is used
      skip_shutdown_and_force_delete = true
    }
  }
}

resource "azurerm_resource_group" "resourcegroup" {
    name     = "TFTestRG01"
  location = "CentralUS"
}

data "azurerm_subnet" "vmsubnet" {
  name = var.subname
  resource_group_name = var.vnetrg
  virtual_network_name = var.vnetname
}

module "WindowsServer" {
    source = "./modules/server"
    rgname = azurerm_resource_group.resourcegroup.name
    location = azurerm_resource_group.resourcegroup.location
    vmname = "module-vm"
    vmsize = "Standard D1"
    localadmin = "localadmin"
    adminpw = var.adminpw
    subnet_id = data.azurerm_subnet.vmsubnet.id
}



