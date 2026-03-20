#Module      : CLOUDWATCH DASHBOARD MODULE
#Description : Terraform module creates Cloudwatch Dashboard on AWS for monitoriing AWS services.

output "dashboard_arn" {
  description = "The Amazon Resource Name (ARN) of the dashboard"
  value       = join("", aws_cloudwatch_dashboard.default[*].dashboard_arn)
}
