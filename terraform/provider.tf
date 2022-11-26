terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.25.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "ea9ff72c-0612-4ac9-855f-f7a7809e9354"
    client_id = "f9b5fdfa-40da-4b39-9b63-3643d8bdca3d"                  
    tenant_id = "0becb7aa-7321-4bfa-a650-0db08585d35e"
    client_secret =  "lWk8Q~fwMkdhq0f4FtkcaAO0iSWmG53k23z3Dbow"
  features {
    
  }
}

