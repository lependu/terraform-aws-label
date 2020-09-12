provider "aws" {
  version = "~> 3.0"
}

module "label" {
  source             = "../"
  namespace          = var.namespace
  stage              = var.stage
  name               = var.name
  user               = var.user
  delimiter          = var.delimiter
  additional_tag_map = var.additional_tag_map
}

output "label" {
  value = module.label.label
}

output "tags" {
  value = module.label.tags
}
