resource "aws_vpc" "artirix" {
    cidr_block = "${var.vpc.cidr_block}"

    tags {
        Name        = "${var.environment_name}-vpc"
        Environment = "${var.environment_name}"
    }
}

resource "aws_internet_gateway" "artirix" {
    vpc_id = "${aws_vpc.artirix.id}"

    tags {
        Name        = "${var.environment_name}-internet-gateway"
        Environment = "${var.environment_name}"
    }
}
