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



module "name" {
  source =   "./Azure_VM"
  Ressource_Group_Name= var.Ressource_Group_Name
  Ressource_Group_Location= var.Ressource_Group_Location
  Virtual_Network_Name= var.Virtual_Network_Name
   username = var.username
}
