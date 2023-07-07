include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/s3-bucket-access.hcl"
}

include "environment" {
  path = find_in_parent_folders("environment.hcl")
}