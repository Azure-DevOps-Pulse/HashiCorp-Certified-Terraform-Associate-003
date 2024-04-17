resource "azurerm_resource_group" "myrg" {
  name     = "DevOpsPulserg"
  location = var.resource_group_location
}

resource "azurerm_resource_group" "myrg30" {
  name = "devrg"
  location = var.resource_group_location
  
}


resource "azurerm_storage_account" "storage01" {
  name                     = "azuredevopspulsestorage"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    "dept"  = "DevOps"
    "Owner" = "HR"
  }
}

resource "azurerm_virtual_network" "vnet01" {
  name                = "PulseVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "subnet01" {
  name                 = "pulsesubnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                    = "pip01"
  location                = azurerm_resource_group.myrg.location
  resource_group_name     = azurerm_resource_group.myrg.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  tags = {
    Deployment_method = "Terraform"
  }
}

resource "azurerm_network_interface" "nic01" {
  name                = "pulseNic01"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  
  ip_configuration {
    name                          = "ipconfig-01"
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


resource "azurerm_windows_virtual_machine" "windows01" {
  name                = "HRWINSERVER01"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  tags                = {
    "dept"  = "DevOps"
    "Owner" = "HR"
  }
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
