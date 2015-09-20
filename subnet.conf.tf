resource "aws_subnet" "private-subnet" {
    vpc_id            	= "${aws_vpc.artirix.id}"
    cidr_block        	= "${lookup(var.cidr_blocks, count.index)}"
    availability_zone   = "${element(split(",", var.zones), count.index)}"
    count               = 3

    tags {
        Name        = "${var.environment_name}-private-subnet-${count.index}"
        Environment = "${var.environment_name}"
    }
}

