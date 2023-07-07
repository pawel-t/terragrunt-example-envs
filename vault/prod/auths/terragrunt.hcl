include "state" {
  path = find_in_parent_folders("state.hcl")
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}

include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/auths.hcl"
}


