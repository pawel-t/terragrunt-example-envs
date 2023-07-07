terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-database?ref=${local.module_version}"
}

locals {
    global          = yamldecode(file(find_in_parent_folders("global.yaml")))
    environment     = yamldecode(file(find_in_parent_folders("environment.yaml")))
    module_version  = try(local.environment.module_version, local.global.global_module_version)
}

inputs = {
    db_name    = "${local.environment.env_name}-db"
    db_port    = 1234 
    endpoint   = "localhost"
    admin_user = "${local.environment.env_name}-admin"  
}

