resource "aws_security_group" "bemol_swarm_sg" {
  name        = "bemol-swarm-sg"
  description = "Config swarm security group"
  vpc_id      = aws_vpc.bemol_swarm_vpc.id
  
  ingress {
    description = "Allow TCP from my Home"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow ssh from deploy-swarm instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.deploy_swarm.public_ip}/32", "${aws_instance.deploy_swarm.private_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bemol-swarm-sg"
  }
}

resource "aws_security_group" "swarm_node_sg" {
  name        = "swarm_node_sg"
  description = "Config swarm security group"
  vpc_id      = aws_vpc.bemol_swarm_vpc.id
  
  ingress {
    description = "Allow Tcp from my Node Manager"
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.bemol_swarm_vpc.cidr_block]
  }
  
  ingress {
    description = "Allow udp connections from nodes"
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = [aws_vpc.bemol_swarm_vpc.cidr_block]
  }

  ingress {
    description = "Allow tcp connections from nodes"
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.bemol_swarm_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bemol-swarm-sg"
  }
}

resource "aws_security_group_rule" "allow_tcp_from_sg" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.bemol_swarm_sg.id
  source_security_group_id = aws_security_group.bemol_swarm_sg.id
}