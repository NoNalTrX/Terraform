resource "aws_route_table" "private-subnet" {
    vpc_id = "${aws_vpc.artirix.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.artirix.id}"
    }

    tags {
        Name        = "${var.environment_name}-private-subnets-route-table"
        Environment = "${var.environment_name}"
    }
}

resource "aws_route_table_association" "private-subnet-association" {
    subnet_id      = "${element(aws_subnet.private-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.private-subnet.id}"
    count          = "${var.subnet.count}"
}

