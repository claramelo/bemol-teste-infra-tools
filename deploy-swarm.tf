resource "aws_key_pair" "deploy_swarm_key" {
  key_name   = "deploy_swarm_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDm+lUACTyj8KilevwenaM6k+lOLyyu5ZFkixUCn5FJukIkCkX7jVQBt+v30YgVB2XrzZyEV7ZC6qFbryqAdpoS0D1iDB2XacBb7wMqPHE4CjemXVXp35We0j4Lc4dRAJpdJfi2VZuMNzopytpSvPo2WF4K5+4nS1C6wR1MGnzJhUmWRldEJpzv+Tn5czpemxk25mXMFNhcOX1YO1Boq62pBYCRTjDoR8ZwCDOnnCIt9WRIZHZZWPTebT2Ahun70WKGWV5LQuZIfO/zLDUith6wYE3N4VpFvMXNvy5GdJT3tWlpqo/ltuFUBA4lWABb/pjimhf3vGZA71BI4E+V/nEJ"
}

resource "aws_instance" "deploy_swarm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = file(var.bootstrap_path)
  key_name               = aws_key_pair.deploy_swarm_key.id
  vpc_security_group_ids = [aws_security_group.deploy_swarm_sg.id]
  subnet_id              = aws_subnet.bemol_public_subnet.id

  tags = {
    Name  = "bemol-deploy-swarm"
  }
}