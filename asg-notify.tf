#  Note - if you already defined an SNS topic outside of terraform, you can
#  specify here too as follows
#    topic_arn = "arn:aws:sns:us-west-2:387946841317:EC2StatusNotification"

resource "aws_autoscaling_notification" "ASGNotify" {
   group_names = ["${aws_autoscaling_group.ServerGroup.name}"]
   notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
     ]
   topic_arn = "${aws_sns_topic.webmailEMAIL.arn}"
}
