resource "aws_elb" "lb" {
    name                = "${var.environment_name}-lb"

    listener {
        instance_port       = "${var.lb.instance_port}"
        instance_protocol   = "${var.lb.instance_protocol}"
        lb_port             = "${var.lb.lb_port}"
        lb_protocol         = "${var.lb.lb_protocol}"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "HTTP:9200/"
        interval            = 30
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
