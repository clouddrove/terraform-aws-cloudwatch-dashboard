provider "aws" {
  region = local.region
}

locals {
  name        = "dashboard"
  environment = "test"
  region      = "us-east-1"
}

##-----------------------------------------------------------------------------
## LAMBDA
##-----------------------------------------------------------------------------
module "lambda" {
  source  = "clouddrove/lambda/aws"
  version = "1.3.1"

  name        = "${local.name}-lambda-function"
  environment = local.environment

  enable                         = true
  timeout                        = 60
  runtime                        = "python3.8"
  handler                        = "index.lambda_handler"
  filename                       = "./test-dashboard-lambda-function.zip"
  layer_filenames                = ["./test-dashboard-lambda-function.zip"]
  names                          = ["python_layer"]
  compatible_runtimes            = [["python3.8"]]
  iam_actions                    = ["logs:CreateLogStream", "logs:CreateLogGroup", "logs:PutLogEvents"]
  statement_ids                  = ["AllowExecutionFromCloudWatch"]
  actions                        = ["lambda:InvokeFunction"]
  principals                     = ["apigateway.amazonaws.com"]
  reserved_concurrent_executions = null
}

##-----------------------------------------------------------------------------
## CLOUDWATCH DASHBOARD
##-----------------------------------------------------------------------------
module "cloudwatch_dashboard" {
  source = "../../"

  enable      = true
  name        = local.name
  environment = local.environment
  dashboard_body = templatefile("${path.module}/lambda_dashboard.json", {
    region               = local.region
    lambda_function_name = split(":", module.lambda.arn)[6]
  })
}
