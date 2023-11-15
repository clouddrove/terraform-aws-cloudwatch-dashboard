#Module      : CLOUDWATCH DASHBOARD MODULE
#Description : Terraform module creates Cloudwatch Dashboard on AWS for monitoriing AWS services.

output "dashboard_arn" {
  value = join("", aws_cloudwatch_dashboard.default[*].dashboard_arn)
}