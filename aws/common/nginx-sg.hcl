terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/security-group-nginx/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

dependency "bastion" {
    config_path = "../../bastion/instance"
}

inputs = {
    vpc_id            = "vpc-0f468484e953365a2"
    sg_name           = "nginx-sg-${local.environment.env_name}"
    sg_desc           = "nginx-dev sg"          
    ssh_cidr_blocks   = ["${dependency.bastion.outputs.private_ip}/32"]
}