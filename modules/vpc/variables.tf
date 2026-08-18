variable "project_name" {
  type        = string
  description = "Project name tag prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR for public subnet 1"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR for public subnet 2"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR for private subnet 1"
}

# ADDED: Variable for Private Subnet 2 CIDR
variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR for private subnet 2"
}

variable "az_1" {
  type        = string
  description = "First availability zone"
}

variable "az_2" {
  type        = string
  description = "Second availability zone"
}
variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "igw_name" {
  type        = string
  description = "Name tag for the Internet Gateway"
}

variable "nat_name" {
  type        = string
  description = "Name tag for the NAT Gateway"
}

variable "public_subnet_1_name" {
  type        = string
  description = "Name tag for Public Subnet 1"
}

variable "public_subnet_2_name" {
  type        = string
  description = "Name tag for Public Subnet 2"
}

variable "private_subnet_1_name" {
  type        = string
  description = "Name tag for Private Subnet 1"
}

variable "private_subnet_2_name" {
  type        = string
  description = "Name tag for Private Subnet 2"
}

variable "public_route_table_name" {
  type        = string
  description = "Name tag for the Public Route Table"
}

variable "private_route_table_name" {
  type        = string
  description = "Name tag for the Private Route Table"
}
