locals {
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  delimiter = var.delimiter

  label = lower(join(local.delimiter, [
    local.namespace, local.stage, local.name
  ]))

  tags = merge({
    "Name"      = local.label
    "Namespace" = local.namespace
    "Stage"     = local.stage
    "ManagedBy" = var.user
  }, var.additional_tag_map)
}
