resource "aws_security_group" "nodes" {

    description = "Security groupe for ES nodes"

    name = "${var.environment_name}-nodes"
    
    vpc_id = "${aws_vpc.artirix.id}"
    tags {
        Name        = "${var.environment_name}-nodes-security-group"
        Environment = "${var.environment_name}"
    }
}

resource "aws_security_group" "lb" {

    description = "Security group for load Balancer"

    name = "${var.environment_name}-lb"

    vpc_id = "${aws_vpc.artirix.id}"
    tags {
        Name        = "${var.environment_name}-lb-security-group"
        Environment = "${var.environment_name}"
    }
}

resource "aws_security_group_rule" "ingress_nodes_rules" {
    type = "ingress"
    from_port = "${lookup(var.nodes_ingress_from,count.index)}"
    to_port = "${lookup(var.nodes_ingress_to,count.index)}"
    protocol = "${lookup(var.nodes_ingress_protocol,count.index)}"
    cidr_blocks = ["${split(",",lookup(var.nodes_ingress_cidr_block,count.index))}"]
    count = "${var.nodes_ingress_rule_count}"

    security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "egress_nodes_rules" {
    type = "egress"
    from_port = "${lookup(var.nodes_egress_from,count.index)}"
    to_port = "${lookup(var.nodes_egress_to,count.index)}"
    protocol = "${lookup(var.nodes_egress_protocol,count.index)}"
    cidr_blocks = ["${split(",",lookup(var.nodes_egress_cidr_block,count.index))}"]
    count = "${var.nodes_egress_rule_count}"

    security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "ingress_load_balancer_rules" {
    type = "ingress"
    from_port = "${lookup(var.lb_ingress_from,count.index)}"
    to_port = "${lookup(var.lb_ingress_to,count.index)}"
    protocol = "${lookup(var.lb_ingress_protocol,count.index)}"
    cidr_blocks = ["${split(",",lookup(var.lb_ingress_cidr_block,count.index))}"]
    count = "${var.lb_ingress_rule_count}"

    security_group_id = "${aws_security_group.lb.id}"
}

resource "aws_security_group_rule" "egress_load_balancer_rules" {
    type = "egress"
    from_port = "${lookup(var.lb_egress_from,count.index)}"
    to_port = "${lookup(var.lb_egress_to,count.index)}"
    protocol = "${lookup(var.lb_egress_protocol,count.index)}"
    cidr_blocks = ["${split(",",lookup(var.lb_egress_cidr_block,count.index))}"]
    count = "${var.lb_egress_rule_count}"

    security_group_id = "${aws_security_group.lb.id}"
}
