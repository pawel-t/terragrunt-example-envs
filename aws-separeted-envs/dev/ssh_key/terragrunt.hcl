include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/ssh-key.hcl"
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}