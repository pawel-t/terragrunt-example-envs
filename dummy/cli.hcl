terraform {
  extra_arguments "req_vars" {
    commands = [
      "apply",
      "plan",
      "import",
    ]

    env_vars = {
      TF_VAR_test_some_var = "some_value"
      TF_VAR_db_port2 = "6789"
    }

    arguments = [
    "-var", "some_other_var=some_other_value"
    ]

    required_var_files = [
      "${find_in_parent_folders("global.tfvars")}"
     "../../../global.tfvars"
    ]

    optional_var_files = [
     "../../sth.tfvars",
     "${dirname(find_in_parent_folders("environment.yaml"))}/environment.tfvars"  
    ]

  }
}

