output "label" {
  value       = local.label
  description = "The combined name of the resource in namespace-stage-name format."
}

output "tags" {
  value       = local.tags
  description = "AWS cost allocation tags merged with custom tags"
}
