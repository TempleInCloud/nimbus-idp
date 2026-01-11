variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "nimbus"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "Your public IP in CIDR format (e.g., 1.2.3.4/32). Used for SSH and Kubernetes API access."
  type        = string
}

variable "key_name" {
  description = "Existing AWS EC2 Key Pair name"
  type        = string
}
