resource "aws_launch_template" "ec2_template" {
  name_prefix   = "example-"
  image_id      = "ami-0ad21ae1d0696ad58" # Ensure this AMI ID is correct for your region
  instance_type = "t2.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  user_data = base64encode(file("./user_data.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "example-instance"
    }
  }
}
