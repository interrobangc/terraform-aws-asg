module "asg" {
  source = "github.com/terraform-aws-modules/terraform-aws-autoscaling?ref=v2.6.0"

  name = "${var.name}"

  image_id             = "${var.ami}"
  instance_type        = "${var.instance_type}"
  key_name             = "${var.key_name}"
  security_groups      = ["${var.security_groups}"]
  iam_instance_profile = "${var.iam_instance_profile}"
  enable_monitoring    = "${var.enable_monitoring}"

  user_data                   = "${var.user_data}"
  asg_name                    = "${var.name}-asg"
  vpc_zone_identifier         = ["${var.subnets}"]
  health_check_type           = "EC2"
  min_size                    = "${var.min_size}"
  max_size                    = "${var.max_size}"
  desired_capacity            = "${var.desired_capacity ? var.desired_capacity : var.min_size}"
  wait_for_capacity_timeout   = "${var.wait_for_capacity_timeout}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  target_group_arns = ["${var.target_group_arns}"]

  tags = [
    {
      key                 = "Environment"
      value               = "${var.env}"
      propagate_at_launch = true
    },
    {
      key                 = "Terraform"
      value               = "true"
      propagate_at_launch = true
    },
  ]
}
