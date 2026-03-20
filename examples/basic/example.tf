provider "aws" {
  region = "us-east-1"
}

module "cloudwatch_dashboard" {
  source      = "../../"
  name        = "cloudwatch-dashboard"
  environment = "test"
}
