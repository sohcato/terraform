# Where Terraform stores its state file (current infrastructure vs. configured config)
terraform {
  backend "pg" {}
}
