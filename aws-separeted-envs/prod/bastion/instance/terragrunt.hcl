include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/bastion-ec2.hcl"
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}