terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-database?ref=main"
}

inputs = {
    db_name = "dev-db"
}

remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/dev/db/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}