terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//vault/vault-auth?ref=${local.module_version}"
}

locals {
  environment              	 	  = yamldecode(file(find_in_parent_folders("environment.yaml")))
  default_module_version          = "stable"
  module_version  			      = try(local.environment.module_version, local.default_module_version)
}

inputs = {
  enable_github     = false
  enable_kubernetes = false
  enable_userpass   = false
}

