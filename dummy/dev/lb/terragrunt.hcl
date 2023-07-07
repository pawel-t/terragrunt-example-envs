include "module" {
    path = "${abspath(find_in_parent_folders("common_configs"))}/loadbalancer.hcl"
}

include "state" {
    path = find_in_parent_folders("state.hcl")
}

include "cli" {
    path = find_in_parent_folders("cli.hcl")
}