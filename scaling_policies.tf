resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "ScaleOutPolicy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ec2_autoscaling_group.name
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "ScaleInPolicy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ec2_autoscaling_group.name
}
