output "deploy_swarm_ip" {
  value =  aws_instance.deploy_swarm.public_ip
}

output "cluster_swarm_leader_ip" {
  value =  aws_instance.bemol_swarm_leader.private_ip
}

output "cluster_swarm_workers_ip" {
  value =  aws_instance.bemol_swarm_workers[*].private_ip
}