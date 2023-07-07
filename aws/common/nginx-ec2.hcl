terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/ec2-nginx/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

dependency "sg" {
  config_path = "../sg"
}

dependency "bucket-role" {
  config_path = "../../s3/access-role"
}

dependencies {
  paths = ["../sg", "../../s3/access-role"]
}

inputs = {
    subnet_id = "subnet-0885237ddf9e431f2"
    ssh_key_id = "user-${local.environment.env_name}"  
    instance_name = "nginx-${local.environment.env_name}"
    role_name = dependency.bucket-role.outputs.role_name
    security_groups = [dependency.sg.outputs.security_group_id]    
}
