include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/ssh-key.hcl"
}

include "global" {
  path = find_in_parent_folders("global.hcl")
}

