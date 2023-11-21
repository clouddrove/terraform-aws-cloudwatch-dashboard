provider "aws" {
  region = local.region
}

locals {
  name        = "dashboard"
  environment = "test"
  region      = "us-east-1"
}

##-----------------------------------------------------------------------------
## Private ECR.
##-----------------------------------------------------------------------------
module "private_ecr" {
  source  = "clouddrove/ecr/aws"
  version = "1.3.2"

  enable_private_ecr = true
  name               = format("%s-private-ecr",local.name)
  environment        = local.environment
  scan_on_push       = true
  max_image_count    = 7
}

##-----------------------------------------------------------------------------
## CLOUDWATCH DASHBOARD
##-----------------------------------------------------------------------------
module "cloudwatch_dashboard" {
  source = "../../"

  enable      = true
  name        = local.name
  environment = local.environment
  dashboard_body = templatefile("${path.module}/ecr_dashboard.json", {
    region         = local.region
    log-group      = "cloudtrail-log-group"  # Log group of the cloudtrail or log group name where the ECR history/API Calls is stored
  })
}