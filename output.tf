output "dev_ec2_public_ip_addr" {
  value       = aws_eip.dev_eip.public_ip
  description = "Public IP of the EC2 instance."
}