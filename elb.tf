resource "aws_elb" "webmailELB" {
  name = "webmailELB"
  security_groups = ["${var.SG_elbhttp}"]
  subnets = ["${var.subnet1}","${var.subnet2}","${var.subnet3}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:${var.http_server_port}/check/index.html"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "${var.http_server_port}"
    instance_protocol = "http"
  }
 listener {
    instance_port = "${var.http_server_port}"
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl_cert_arn}"
  }
  tags {
     ELBName = "${var.ELBName}"
  }
}

resource "aws_lb_cookie_stickiness_policy" "SSLstickiness" {
  name                     = "SSLsticky"
  load_balancer            = "${aws_elb.webmailELB.id}"
  lb_port                  = 443
  cookie_expiration_period = 600
}

resource "aws_lb_cookie_stickiness_policy" "HTTPstickiness" {
  name                     = "HTTPsticky"
  load_balancer            = "${aws_elb.webmailELB.id}"
  lb_port                  = 80
  cookie_expiration_period = 600
}

output "elb-webmail-dnsname" {
  value = "${aws_elb.webmailELB.dns_name}"
}

output "elb-webmail-zoneid" {
  value = "${aws_elb.webmailELB.zone_id}"
}

output "elb-webmail-instances" {
  value = "${aws_elb.webmailELB.instances}"
}

