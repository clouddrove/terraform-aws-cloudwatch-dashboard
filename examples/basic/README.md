# terraform-aws-cloudwatch-dashboard basic example

This is a basic example of the `terraform-aws-cloudwatch-dashboard` module.

## Usage

```hcl
module "cloudwatch_dashboard" {
  source      = "clouddrove/cloudwatch-dashboard/aws"
  name        = "cloudwatch-dashboard"
  environment = "test"
}
```
