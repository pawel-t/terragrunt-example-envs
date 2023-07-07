locals {
  token_file = "${jsondecode(file("/tmp/root_token_dev.json"))}"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

provider "vault" {
  address = "http://localhost:8200"
  token   = "${local.token_file.token}"
}
EOF
}