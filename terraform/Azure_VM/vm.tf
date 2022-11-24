locals {
  prefix="terraform"
  sufix="EmreCoskun"
}

variable "Ressource_Group_Name" {
  type = string
}
variable "Ressource_Group_Location" {
  type = string
}

variable "Virtual_Network_Name" {
  type = string

}
variable "username" {
    type = string
  
}
resource "azurerm_resource_group" "Terraform_Ressource_Groupe_Emre_Coskun" {
  name     = var.Ressource_Group_Name
  location = var.Ressource_Group_Location
}

resource "azurerm_virtual_network" "main" {
  name                = "${local.prefix}-${var.Virtual_Network_Name}-${local.sufix}"
  address_space       = ["10.0.0.0/16"]
  location            = var.Ressource_Group_Location
  resource_group_name = var.Ressource_Group_Name
  depends_on = [
    azurerm_resource_group.Terraform_Ressource_Groupe_Emre_Coskun
  ]
} 

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.Ressource_Group_Name
  virtual_network_name =  azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [
    azurerm_virtual_network.main
  ]
}

resource "azurerm_network_interface" "main" {
  name                = "${local.prefix}-nic-${local.sufix}"
  location            = var.Ressource_Group_Location
  resource_group_name = var.Ressource_Group_Name

  ip_configuration {
    name                          = "ip-dymaic"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [
    azurerm_subnet.internal
  ]
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${local.prefix}-vm-${local.sufix}"
  location              = var.Ressource_Group_Location
  resource_group_name   = var.Ressource_Group_Name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"

   delete_os_disk_on_termination = true


   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "terraformdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.username
    admin_username = var.username
    admin_password = "Emre123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

depends_on = [
  azurerm_network_interface.main
]
}