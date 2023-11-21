<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS Cloudwatch Dashboard
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module creates Cloudwatch Dashboard on AWS for monitoriing AWS services.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-aws-cloudwatch-alarms/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-aws-cloudwatch-alarms/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-aws-cloudwatch-alarms/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-aws-cloudwatch-alarms/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+Cloudwatch+Dashboard&url=https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+Cloudwatch+Dashboard&url=https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 






## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard/releases).


Here are  the example of how you can use this module in your inventory structure:
### Example
```hcl
  provider "aws" {
    region = "us-east-1"
  }

  module "dashboard" {
    source = "../../"
    start  = "-PT4H"
    widgets = [
      {
        height = 5
        width  = 14      
        y      = 19
        x      = 10

        type = "metric"
        properties = {
          metrics = [
                      [ "ContainerInsights", "pod_number_of_container_restarts", "PodName", "api", "ClusterName", "prod-xcheck-eks-cluster", "Namespace", "api-mbj" ],
                      [ "...", "testing", ".", ".", ".", "testing" ],
          ]
          view                  = "pie"
          stacked               = false
          region                = "us-east-1"
          liveData              = true        
          title                 = "Number of container restarts"
          period                = 300
          setPeriodToTimeRange  = false,        
          stat                  = "Average"
          legend = {
            "position": "bottom"
          }
          sparkline             = true
          trend                 = true
          labels = {
            "visible": "true"
          }        
        }
      },
      {
        height = 14
        width  = 10     
        y      = 5
        x      = 0

        type = "metric"
        properties = {
          metrics = [
                      [ "ContainerInsights", "pod_memory_utilization", "PodName", "api", "ClusterName", "test-xcheck-eks-cluster", "Namespace", "api-puj" ],
                      [ "...", "api-test" ],
          ]
          view    = "pie"
          region  = "us-east-1"
          title   = "Tet pod Memory Utilization"
          period  = 300
          trend    = true
          liveData = true
          sparkline = true        
          setPeriodToTimeRange = false,
          labels = {
            "visible": "true"
          }
        }
      }
    ]
  }

  resource "aws_cloudwatch_dashboard" "dashboard" {
    dashboard_body = module.dashboard.json_map_encoded
    dashboard_name = "test-dashboard"
  } 

```






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
| dashboard\_arn | n/a |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-cloudwatch-dashboard)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
