output "public_ip" {
  value       = aws_instance.k3s_node.public_ip
  description = "Public IP of the k3s EC2 instance"
}

output "ssh_command" {
  value       = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.k3s_node.public_ip}"
  description = "SSH command (adjust key path if needed)"
}
