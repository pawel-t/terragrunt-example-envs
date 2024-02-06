terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-app/?ref=main"
}

inputs = {
    name                 = "dev-application"
    db_connection_string = "db_user:user_pass@localhost:1234"
}

remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/dev/app/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}