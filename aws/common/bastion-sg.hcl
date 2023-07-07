terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/security-group-bastion/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

inputs = {
    vpc_id            = "vpc-0f468484e953365a2"
    sg_name           = "instance-sg-${local.environment.env_name}"
    sg_desc           = "ec2 sg"    
    ssh_cidr_blocks   = ["0.0.0.0/0"]
}

