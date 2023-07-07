terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-loadbalancer?ref=${local.module_version}"
}

locals {
    global          = yamldecode(file(find_in_parent_folders("global.yaml")))
    environment     = yamldecode(file(find_in_parent_folders("environment.yaml")))
    module_version  = try(local.environment.module_version, local.global.global_module_version)
}

inputs = {
    lb_name      = "${local.environment.env_name}-lb"
    hostname     = "${local.environment.env_name}.example.com"
    target       = "${local.environment.env_name}-application"    
    path         = "/someapp"
    health_check = false
}


