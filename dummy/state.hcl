remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/${path_relative_to_include()}/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}
