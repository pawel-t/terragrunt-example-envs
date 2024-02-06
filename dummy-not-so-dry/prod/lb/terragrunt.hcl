terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//dummy/dummy-loadbalancer?ref=main"
}

inputs = {
    lb_name              = "prod-lb"
    hostname             = "prod.example.com"
    target               = "prod-application"
}

remote_state {
  backend = "local"

  config = {
    path = "/tmp/state/dummy/prod/lb/terraform.tfstate"
  }

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }
}