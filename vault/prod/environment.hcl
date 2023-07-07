locals {
  token_file = "${jsondecode(file("/tmp/root_token_prod.json"))}"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

provider "vault" {
  address = "http://localhost:8202"
  token   = "${local.token_file.token}"
}
EOF
}

terraform {
  extra_arguments "extend_lock" {
    commands = [
      "apply",
      "plan",
      "import"
    ]

    arguments = [
      "-lock-timeout=30m"
    ]
  }
}