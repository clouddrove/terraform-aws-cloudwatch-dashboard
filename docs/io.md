## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dashboard\_body | Json file with Environment(optional) variables. | `any` | `null` | no |
| enable | Conditionally create CloudWatch Dashboard. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-s3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| dashboard\_arn | The Amazon Resource Name (ARN) of the dashboard |
