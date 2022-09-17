data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tlskey.public_key_openssh
}

resource "aws_instance" "confluence" {
  ami                    = data.aws_ssm_parameter.ami_id.value
  instance_type          = "t3.medium"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name               = aws_key_pair.generated_key.key_name
  user_data              = fileexists("script.sh") ? file("script.sh") : null
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    tags = {
      Name = "root"
    }
  }
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 5
    tags = {
      Name = "confluence-install"
    }
  }
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 10
    tags = {
      Name = "confluence-logs"
    }
  }
  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = 50
    tags = {
      Name = "confluence-appdata"
    }
  }
  ebs_block_device {
    device_name = "/dev/sdi"
    volume_size = 5
    tags = {
      Name = "confluence-shared"
    }
  }

  tags = {
    Name = "Confluence"
  }
}

output "instances" {
  value       = aws_instance.confluence.*.public_ip
  description = "Public IP address"
}

output "key" {
  value       = tls_private_key.tlskey.private_key_pem
  description = "PEM key"
  sensitive   = true
}