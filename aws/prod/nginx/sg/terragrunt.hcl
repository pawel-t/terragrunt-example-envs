include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/nginx-sg.hcl"
}

include "global" {
  path = find_in_parent_folders("global.hcl")
}

