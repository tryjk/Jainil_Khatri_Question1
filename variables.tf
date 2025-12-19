variable "aws_region" {
    type = string
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro" // t2.micro was not available in free plan
}

variable "ami_id" {
  description = "Ubuntu"
  default     = "ami-02b8269d5e85954ef"
}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 80, 443]
}
