resource "aws_key_pair" "circle_ci_public_key" {
  key_name   = "deploy_swarm_key"
  public_key =  var.circle_ci_public_key
}

resource "aws_instance" "deploy_swarm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = file(var.bootstrap_path)
  key_name               = aws_key_pair.circle_ci_public_key.id
  vpc_security_group_ids = [aws_security_group.deploy_swarm_sg.id]
  subnet_id              = aws_subnet.bemol_public_subnet.id

  tags = {
    Name  = "bemol-deploy-swarm"
  }
}