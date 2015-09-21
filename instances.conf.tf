resource "aws_instance" "elastic" {
    ami                         = "${var.elastic.ami_image}"
    key_name                    = "${var.key.key_name}"
    availability_zone           = "${lookup(var.zones, count.index)}"
    instance_type               = "${var.elastic.instance_type}"
    associate_public_ip_address = "${var.elastic.associate_public_ip_address}"
    source_dest_check           = false
    security_groups             = ["${aws_security_group.nodes.id}"]
    subnet_id                   = "${element(aws_subnet.private-subnet.*.id, count.index)}"
    count                       = "${var.elastic.node-count}"

    tags {
        Name        = "${var.environment_name}-elastic-node-${count.index}"
        Environment = "${var.environment_name}"
    }
}
