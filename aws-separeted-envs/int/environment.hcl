remote_state {
  backend = "s3"
  generate = {
    path      = "state.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    disable_bucket_update = true
    bucket                = "some-bucket-for-int-state"
    key                   = "aws/${path_relative_to_include()}/terraform.tfstate"
    encrypt               = true
    region                = "eu-central-1"
    dynamodb_table        = "some-table-for-int-locks"
    profile               = "default"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region  = "eu-central-1"
  profile = "int"
}
EOF
}
