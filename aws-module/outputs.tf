output "id" {
  value       = module.vpc.*.vpc_id
  description = "ID of the Virtual Private Cloud."
}
