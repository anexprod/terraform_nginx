variable "vpc_id" {
  description = "ID VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "list_of_open_ports" {
  description = "Список открытых портов для группы безопасности"
  type        = list(number)
}

variable "ami_id" {
  description = "AMI ID для EC2"
  type        = string
}

variable "instance_type" {
  description = "Тип EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Имя ключа SSH для доступа к EC2"
  type        = string
}
