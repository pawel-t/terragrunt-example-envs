terraform {
  source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/s3-access-role/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

dependency "bucket" {
  config_path = "../bucket"
}

inputs = {
    bucket_name = dependency.bucket.outputs.id
}