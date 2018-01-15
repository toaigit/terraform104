variable "region" {
  default = "us-west-2"
  }

variable "asg_prefix" {
  default = "ASGwebmail"
}

variable "lc_prefix" {
  default = "LCwebmail"
}

variable "yourteamEmail" {
  default = "team@yahoo.com"
}

variable "yourteamSMS" {
  default = "+18001234567"
}

variable "ELBName" {
  default = "ELBwebmail"
}

variable "launch_config_name_2" {
  default = "LC_webmail_vpcUAT_2"
}

variable "iamrole" {
  default = "RoleWithS3Access"
}

variable "subnet1" {
  default = "subnet-caade283"
}

variable "subnet2" {
  default = "subnet-d47740b3"
}

variable "subnet3" {
  default = "subnet-a78150fc"
}

variable "min_size" {
  default = "2"
}

variable "max_size" {
  default = "2"
}

variable "asg_desired" {
  default = "2"
}

variable "health_check_grace_period" {
  default = "300"
}

variable "wheezy_image_id" {
  description = "Debian Wheezy Debian Community"
  default = "ami-431a4273"
}

variable "jessie_image_id" {
  description = "Debian Jessie Debian Community"
  default = "ami-221ea342"
}

variable "stretch_image_id" {
  description = "Debian Stretch Debian Community"
  default = "ami-cbad0eb3"
}

variable "centos6_image_id" {
  description = "Centos6 Community"
  default = "ami-112cbc71"
}

variable "centos7_image_id" {
  description = "Centos7 Community"
  default = "ami-0c2aba6c"
}

variable "instance_type" {
  default = "t2.small"
}

variable "key_name" {
  default = "yourkeypair"
}

variable "webmailsg" {
  default = "sg-d58db8ae"
}

variable "dbsg" {
  default = "sg-0b83b670"
}

variable "websg" {
  default = "sg-768cb90d"
}

variable "elbsg" {
  default = "sg-bf86b3c4"
}

variable "volume_type" {
  default = "gp2"
}

variable "volume_size" {
  default = "16"
}

variable "configURL" {
  default = "http://yourwebsiteURL/download"
  }

variable "post_runcmd" {
  default = "http://yourwebsiteURL/awsconfig/flatform/servername/runcmd"
  }

variable "host_name" {
  default = "webmail"
  }

variable "local_domain_name" {
  default = "aws.company.com"
  }

variable "external_domain_name" {
  default = "company.com"
  }

variable "delete_on_termination" {
  default = "true"
}

variable "SG_elbhttp" {
  default = "sg-73aaad08"
}

variable "http_server_port" {
  default = "80"
}

variable "ssl_cert_arn" {
  default = "arn:aws:acm:us-west-2:accountnumber:certificate/2e52e8e2-992c-47de-bc87-1eb6805013e5"
}

