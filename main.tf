#Module      : CLOUDWATCH DASHBOARD MODULE
#Description : Terraform module creates Cloudwatch Dashboard on AWS for monitoriing AWS services.
locals {
  dashboard = {
    start          = var.start
    end            = var.end
    periodOverride = var.periodOverride
    widgets        = var.widgets
  }
  json_map = jsonencode(local.dashboard)
}

