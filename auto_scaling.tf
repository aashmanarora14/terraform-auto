resource "aws_autoscaling_group" "ec2_autoscaling_group" {
  launch_template {
    id      = aws_launch_template.ec2_template.id
    version = "$Latest"
  }
  min_size            = 1
  max_size            = 3
  desired_capacity    = 1
  vpc_zone_identifier = ["subnet-0df63b7343e29e7a3", "subnet-00083440e8dc7ea49", "subnet-055e57c34b74771c2"]

  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}
