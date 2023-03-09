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