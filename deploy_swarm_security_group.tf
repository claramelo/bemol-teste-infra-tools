resource "aws_security_group" "deploy_swarm_sg" {
  name        = "deploy_swarm_sg"
  description = "Config swarm security group"
  vpc_id      = aws_vpc.bemol_swarm_vpc.id
  
  ingress {
    description = "Allow ssh from my internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "deploy_swarm_sg"
  }
}