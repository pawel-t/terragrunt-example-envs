terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-app?ref=main"
}

inputs = {
    name                 = "prod-application"
    db_connection_string = "db_user:user_pass@localhost:4321"
}

remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/prod/app/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}