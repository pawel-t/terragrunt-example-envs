terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//vault/vault-engines"
}

include "state" {
  path = find_in_parent_folders("state.hcl")
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}

inputs = {
  enable_kv1  = true
  enable_kv2  = true
  enable_totp = true
}