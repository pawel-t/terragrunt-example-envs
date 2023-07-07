locals {
  token_file = "${jsondecode(file("/tmp/root_token_int.json"))}"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

provider "vault" {
  address = "http://localhost:8201"
  token   = "${local.token_file.token}"
}
EOF
}