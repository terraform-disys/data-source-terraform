variable "rgname" {
    type = string
    description = "resource group name"
    # default = "rafi-rg"
}

variable "location" {
    type = string
    description = "region"
    # default = "South India"
}

variable "subnet_id" {
    type = string
    description = "subnet id the network card attaches to"
}

variable "vmname" {
    type = string
    description = "name of the windows virtual machine"
}

## varibles used for vm
variable "vmsize" {
    type = string
    description = "the size of the VM"
}

variable "localadmin" {
    type = string
    description = "the local admin account, cannot be admin"
}

variable "adminpw" {
    type = string
    description = "the local admin password"
}