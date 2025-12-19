resource "aws_instance" "nginx_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  key_name               = "terraformkey"

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-server"
  }

  lifecycle {
    prevent_destroy = true
  }
}
