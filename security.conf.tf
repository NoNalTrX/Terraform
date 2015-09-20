resource "aws_security_group" "nodes" {
    name = "${var.environment_name}-nodes"

    ingress {
        from_port   = 9300
        to_port     = 9300
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${split("," ,var.ipList.ssh)}"]
    }

    ingress {
        from_port   = 9200
        to_port     = 9200
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.artirix.id}"
    tags {
        Name        = "${var.environment_name}-nodes-security-group"
        Environment = "${var.environment_name}"
    }
}

resource "aws_security_group" "lb" {
    name = "${var.environment_name}-lb"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${split("," ,var.ipList.ssh)}"]
    }

    ingress {
        from_port   = 9200
        to_port     = 9200
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.artirix.id}"
    tags {
        Name        = "${var.environment_name}-lb-security-group"
        Environment = "${var.environment_name}"
    }
}
