output "dashboard_arn" {
  description = "The Amazon Resource Name (ARN) of the dashboard"
  value       = module.cloudwatch_dashboard.dashboard_arn
}
