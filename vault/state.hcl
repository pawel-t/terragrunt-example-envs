remote_state {
  backend = "s3"
  generate = {
    path      = "state.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    disable_bucket_update = true
    bucket                = "some-terraform-state-for-vaults"
    key                   = "vault/${path_relative_to_include()}/terraform.tfstate"
    encrypt               = true
    region                = "eu-central-1"
    dynamodb_table        = "some-terraform-locks-for-vaults"
    profile               = "default"
  }
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

    before_hook "before" {
        commands = ["init", "apply", "plan"]
        execute  = ["echo", "Starting executing Terragrunt"]
    }

    after_hook "after" {
        commands = ["init", "apply", "plan"]
        execute  = ["echo",  "Completed executing Terragrunt"]
    }

    error_hook "init" {
        commands  = ["init", "apply", "plan"]
        execute   = ["echo", "Something went wrong with your Terraform"]
        on_errors = [
            ".*",
        ]
    }          

}

