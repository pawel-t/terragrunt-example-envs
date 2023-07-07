terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/ec2-bastion/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

dependency "sg" {
  config_path = "../sg"
}

inputs = {
    subnet_id = "subnet-0885237ddf9e431f2"
    instance_name = "bastion-${local.environment.env_name}"
    ssh_key_id = "user-${local.environment.env_name}"
    security_groups = [dependency.sg.outputs.security_group_id]
}
