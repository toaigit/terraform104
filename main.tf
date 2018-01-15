provider "aws" {
  region = "${var.region}"
}

resource "aws_autoscaling_group" "ServerGroup" {
  name_prefix               = "${var.asg_prefix}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.asg_desired}"
  health_check_grace_period = "${var.health_check_grace_period}"
  vpc_zone_identifier       = ["${var.subnet1}","${var.subnet2}","${var.subnet3}"]
  launch_configuration      = "${aws_launch_configuration.LaunchConfig.name}"
  load_balancers            = ["${aws_elb.webmailELB.name}"]
  tag {
    key = "ASGName"
    value = "${var.host_name}"
    propagate_at_launch = true    
  }
  lifecycle {
    create_before_destroy = true
    }
}

resource "aws_launch_configuration" "LaunchConfig" {
  name_prefix                 = "${var.lc_prefix}"
  image_id                    = "${var.stretch_image_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.webmailsg}"]
  iam_instance_profile        = "${var.iamrole}"
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "${var.volume_type}"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  lifecycle {
    create_before_destroy = true
  }
#  user_data="${file("userdata.sh")}"
user_data = <<EOF
#cloud-config
runcmd:
- apt-get update
- apt-get -y install curl unzip dnsutils locate
- curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
- unzip awscli-bundle.zip
- awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
- curl "${var.post_runcmd}" -o "/tmp/runcmd"
- chmod 700 /tmp/runcmd
- /tmp/runcmd | tee /var/log/cloud-init-postboot.log
EOF

}
