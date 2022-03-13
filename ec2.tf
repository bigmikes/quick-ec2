resource "aws_network_interface" "dev_ec2_intf" {
  subnet_id       = aws_subnet.dev_subnet.id
  security_groups = [aws_security_group.dev_sg.id]

  tags = {
    Name = "dev_ec2_intf"
  }
}

resource "aws_key_pair" "dev_ec2_ssh_key" {
  key_name   = "dev_ec2_ssh_key"
  public_key = file(var.public_ssh_key_path)
}

resource "aws_instance" "dev_ec2_inst" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "dev_ec2_ssh_key"

  network_interface {
    network_interface_id = aws_network_interface.dev_ec2_intf.id
    device_index         = 0
  }

  tags = {
    Name = "dev_ec2_inst"
  }
  depends_on = [aws_key_pair.dev_ec2_ssh_key]
}

resource "aws_eip" "dev_eip" {
  vpc               = true
  network_interface = aws_network_interface.dev_ec2_intf.id
  depends_on        = [aws_internet_gateway.dev_igw]
}