terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-app?ref=${local.module_version}"
}

locals {
    global          = yamldecode(file(find_in_parent_folders("global.yaml")))
    environment     = yamldecode(file(find_in_parent_folders("environment.yaml")))
    module_version  = try(local.environment.module_version, local.global.global_module_version)
}

inputs = {
    name                 = "${local.environment.env_name}-application"
    app_version          = 3 
    db_connection_string = "${local.environment.env_name}-user:user_pass@localhost:1234"   
}

