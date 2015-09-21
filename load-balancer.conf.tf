resource "aws_elb" "lb" {
    name                = "${var.environment_name}-lb"

    listener {
        instance_port       = "${var.lb.instance_port}"
        instance_protocol   = "${var.lb.instance_protocol}"
        lb_port             = "${var.lb.port}"
        lb_protocol         = "${var.lb.protocol}"
    }

    health_check {
        healthy_threshold   = "${var.lb.hc_healthy_threshold}"
        unhealthy_threshold = "${var.lb.hc_unhealthy_threshold}"
        timeout             = "${var.lb.hc_timeout}"
        target              = "${var.lb.hc_target}"
        interval            = "${var.lb.hc_interval}"
    }

    instances                   = ["${aws_instance.elastic.*.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 400
    connection_draining         = true
    connection_draining_timeout = 400
    security_groups             = ["${aws_security_group.lb.id}"]
    subnets                     = ["${aws_subnet.private-subnet.*.id}"]

    tags {
        Name = "${var.environment_name}-lb"
    }
}
