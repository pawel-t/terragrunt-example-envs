include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/bastion-sg.hcl"
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}