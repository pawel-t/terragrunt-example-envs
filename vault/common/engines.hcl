terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//vault/vault-engines"
}

inputs = {
  enable_kv1  = true
  enable_kv2  = true
  enable_totp = true
}