resource "aws_cloudwatch_metric_alarm" "high_memory_utilization" {
  alarm_name          = "HighMemoryUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "CWAgent"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2_autoscaling_group.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_out_policy.arn]
}

resource "aws_cloudwatch_metric_alarm" "low_memory_utilization" {
  alarm_name          = "LowMemoryUtilization"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "CWAgent"
  period              = "60"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2_autoscaling_group.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_in_policy.arn]
}
