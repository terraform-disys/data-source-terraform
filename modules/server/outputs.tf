output "vm_id_out"{
    value = azurerm_windows_virtual_machine.rafi-vm.id
}

output "vm_ip_out"{
    value = azurerm_windows_virtual_machine.rafi-vm.private_ip_address
}