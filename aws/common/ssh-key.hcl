terraform {
    source = "git@github.com:pawel-t/terraform-modules-examples.git//aws/ec2-ssh-keypair/?ref=main"
}

locals {
    environment = yamldecode(file(find_in_parent_folders("environment.yaml")))
}

inputs = {
    key_pair_name = "user-${local.environment.env_name}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSr4MBA5sgGHuZajbbQT4ESttrbbyjyD2xxIzVQcBXxwzWGX05rjSK2ZzcqCp0ymOuZLQkIcADaM/ewouYMfRiXGOIchkCiHYHED7IY5SLiVBOKw4HcX7T2il63Dec8BBBEgrxwzPN8yb4n32g0Uu8lQT3Tv+CmT792va1cEba+FDJNdqW/ZXBpr4kyZUyz48hAZBXkgbORs6rBqmvxdsXXDtpiolA/xefwmTFYS22jaf+TDI9jikobloy63yNKhWLJkdUAyiyZ1a96chpmV8abz3YeQFaGl2MhG2kdezd/sIilwhCTqwmJR2qchuH9Q9FXOWQhQjmOY5t35MtnbtfgmlpoYto69PQpMmYE/pBHI9lcJTyI/qqP8ArU+rhcxs8CYXzPxTe9xvMOjhRHqDJTM8so3W/zc1/GSkYcXIy/msN2UCLaLhfyB2NoDIdfVPZlU4nvd7JzoikUFKwLZ5LFxxAQHvbtqkKPWMORGrET8UhSpiJsfat2T5NEUHteqU="
}

