resource "aws_sns_topic" "webmailSMS" {
   name = "${var.asg_prefix}-SMS-SNStopic"
   }

resource "aws_sns_topic_subscription" "webmailPager" {
   topic_arn = "${aws_sns_topic.webmailSMS.arn}"
   protocol = "sms"
   endpoint = "${var.yourteamSMS}"
   }

#  Note - Email doesn't support here since terraform cannot validate email confirmation
#  Note - you can use the provisioner as follow instead
#  It means that you need to install AWS CLI command on your local machine here

resource "aws_sns_topic" "webmailEMAIL" {
   name = "${var.asg_prefix}-Email-SNStopic"
   provisioner "local-exec" {
     command = "aws sns subscribe --topic-arn ${aws_sns_topic.webmailEMAIL.arn} --protocol email --notification-endpoint ${var.yourteamEmail}"
     }
   }

#  Note - terraform support the SMS method as follows.  
#  Note - "sms should be lower case. upper case would also work.  However you run terraform again it
#  keeps thinking there is a change since AWS stored it as lower case
#  Note - phone number should be in +1aaabbbcccc format

output "sns_topic_webmail_output" {
  value = "${aws_sns_topic.webmailSMS.arn}"
}

output "sns_topic_webmailAlert_output" {
  value = "${aws_sns_topic.webmailEMAIL.arn}"
}
