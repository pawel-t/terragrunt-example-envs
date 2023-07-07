include "common" {
    path = "${abspath(find_in_parent_folders("common"))}/s3-bucket-access.hcl"
}

include "global" {
  path = find_in_parent_folders("global.hcl")
}
