#Module      : CLOUDWATCH DASHBOARD MODULE
#Description : Terraform module creates Cloudwatch Dashboard on AWS for monitoriing AWS services.

##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "clouddrove/labels/aws"
  version     = "1.3.0"
  name        = var.name
  repository  = var.repository
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}

resource "aws_cloudwatch_dashboard" "default" {
  count          = var.enable ? 1 : 0
  dashboard_name = module.labels.id
  dashboard_body = var.dashboard_body
}