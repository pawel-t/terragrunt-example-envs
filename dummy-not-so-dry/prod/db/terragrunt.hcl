terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-database?ref=main"
}

inputs = {
    db_name = "prod-db"
}

remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/prod/db/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}