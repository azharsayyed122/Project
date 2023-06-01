
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "Public subnet CIDR values"
}

variable "cidr_public_subnet" {
    type = list(string)
    description = "Public Subnet Cidr Values"
    default = [ "10.0.1.0/24" , "10.0.2.0/24" ]      
  
}

variable "cidr_private_subnet" {
    type = list(string)
    description = "Private Subnet"
    default = [ "10.0.3.0/24" , "10.0.4.0/24" ]
    
}

variable "vpc_az" {
    type = list(string)
    description = "Avaiblity Zones"
    default = [ "ap-south-1a", "ap-south-1b" ]
  
}