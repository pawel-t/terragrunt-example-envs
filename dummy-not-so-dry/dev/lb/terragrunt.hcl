terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-loadbalancer?ref=main"
}

inputs = {
    lb_name              = "dev-lb"
    hostname             = "dev.example.com"
    target               = "dev-application"
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