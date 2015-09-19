resource "aws_instance" "elastic" {
    ami                         = "${var.elastic.ami_image}"
    availability_zone           = "${lookup(var.zone, count.index)}"
    instance_type               = "${var.elastic.instance_type}"
    associate_public_ip_address = true
    source_dest_check           = false
    count			= "${var.elastic.node-count}"

    tags {
        Name        = "${var.environment_name}-elastic-node-${count.index}"
        Environment = "${var.environment_name}"
    }
}
