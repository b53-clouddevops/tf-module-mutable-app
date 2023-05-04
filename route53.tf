# This created the CNAME Record for Components
resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "${var.COMPONENT}-${var.ENV}.${data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_NAME}"
  type    = "CNAME"
  ttl     = 10
  records = [data.terraform_remote_state.alb.outputs.PRIVATE_ALB_ADDRESS]
}

# A Record     : Creating Name to an IP Address
# CNAME Record : Creating Name to a Name