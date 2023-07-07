terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/s3-bucket/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

inputs = {
    bucket_name = "my-application-bucket-for-${local.environment.env_name}-fun"
}