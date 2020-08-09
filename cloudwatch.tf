# Configure CloudWatch resources.

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "Monitoring2"

  # The detailed information about the dashboard
  # including what widgets are included and their
  # location on the dashboard.
  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CloudWatch-Dashboard-Body-Structure.html
  dashboard_body = <<EOF
{
    "widgets": [
        {
            "type": "metric",
            "x": 6,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "region": "${var.region}",
                "start": "-PT1H",
                "end": "P0D",
                "metrics": [
                    [ "AWS/Connect", "QueueSize", "InstanceId", "${var.instanceId}", "MetricGroup", "Queue", "QueueName", "${var.queueName}" ]
                ],
                "title": "QueueSize"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "region": "${var.region}",
                "start": "-PT1H",
                "end": "P0D",
                "metrics": [
                    [ "AWS/Connect", "LongestQueueWaitTime", "InstanceId", "${var.instanceId}", "MetricGroup", "Queue", "QueueName", "${var.queueName}" ]
                ],
                "title": "LongestQueueWaitTime"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "metrics": [
                    [ "AWS/Connect", "ConcurrentCallsPercentage", "InstanceId", "${var.instanceId}", "MetricGroup", "VoiceCalls" ]
                ],
                "view": "timeSeries",
                "stacked": false,
                "region": "${var.region}",
                "start": "-PT1H",
                "end": "P0D",
                "stat": "Average",
                "period": 300,
                "title": "ConcurrentCallsPercentage"
            }
        }
    ]
}
    EOF
}

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
# resource "aws_cloudwatch_metric_alarm" "main" {
#   alarm_name                = "connect-concurrency-quota-alarm"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "ConcurrentCallsPercentage"
#   namespace                 = "AWS/Connect"
#   period                    = "120"
#   statistic                 = "Average"
#   threshold                 = "90"
#   alarm_description         = "This metric monitors concurrent calls quota utilization."
#   insufficient_data_actions = []
# }
