include "module" {
    path = "${abspath(find_in_parent_folders("common_configs"))}/application.hcl"
}

include "state" {
    path = find_in_parent_folders("state.hcl")
}

inputs = {
    name = "XYZ"
}
