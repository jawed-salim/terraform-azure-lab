# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "virtual-machine" {
  source = "../../modules/azure-virtual-machine"

  # Resource Group, location, VNet and Subnet details
  resource_group_name  = "rg-dev-centralindia-01"
  location             = "centralindia"
  virtual_network_name = "vnet-centralindia-01"
  subnet_name          = "snet-management"
  virtual_machine_name = "vm-linux-web"

  # OS info
  os_flavor                = "linux"
  linux_distribution_name  = "ubuntu2204-gen2"
  virtual_machine_size     = "Standard_B1s"
  instances_count          = 1
  enable_public_ip_address = true

  # Attach a managed data disk 
  data_disks = [
    {
      name                 = "disk1"
      disk_size_gb         = 20
      storage_account_type = "Standard_LRS"
    }
  ]

  nsg_inbound_rules = [
    {
      name                   = "ssh"
      destination_port_range = "22"
      source_address_prefix  = "*"
    },
    {
      name                   = "http"
      destination_port_range = "80"
      source_address_prefix  = "*"
    },
  ]

  # Adding additional TAG's to your Azure resources
  tags = {
    ProjectName = "demo-project"
    Env         = "dev"
    Owner       = "user@example.com"
    ManagedBy   = "terraform"
  }
}
