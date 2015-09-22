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

    provisioner "file" {
        connection {
            user = "ubuntu"
            key_file = "${var.key.provisioner_key_path}"
        }

        source = "install/install_ES.sh"
        destination = "/tmp/install_ES.sh"
    }

    provisioner "file" {
        connection {
            user = "ubuntu"
            key_file = "${var.key.provisioner_key_path}"
        }

        source = "elasticsearch/conf/elasticsearch.yml"
        destination = "/tmp/elasticsearch.yml"
    }

    provisioner "remote-exec" {
        connection {
            user = "ubuntu"
            key_file = "${var.key.provisioner_key_path}"
        }
        inline = [
            "chmod 744 /tmp/install_ES.sh",
            "/tmp/install_ES.sh"
        ]
    }

    provisioner "remote-exec" {
        connection {
            user = "ubuntu"
            key_file = "${var.key.provisioner_key_path}"
        }
        inline = ["sudo sed -i 's/\*\*cluster_name\*\*/${var.environment_name}/g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's/\*\*node_name\*\*/${var.environment_name}-elastic-node-${count.index}/g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's/\*\*es_port\*\*/${var.lb.instance_port}/g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's/\*\*access_key\*\*/${var.provider.access_key}/g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's|\*\*secret_key\*\*|${var.provider.secret_key}|g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's/\*\*security_group_id\*\*/${aws_security_group.nodes.id}/g' /tmp/elasticsearch.yml",
                  "sudo sed -i 's/\*\*cluster_region\*\*/${var.provider.region}/g' /tmp/elasticsearch.yml",
                  "sudo cp /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml",
                  "sudo service elasticsearch restart"
                ]
    }

    tags {
        Name        = "${var.environment_name}-elastic-node-${count.index}"
        Environment = "${var.environment_name}"
    }
}

resource "template_file" "elastic_conf" {
    filename = "elasticsearch/conf/elasticsearch.yml"
    vars {
        cluster_name = "${var.environment_name}-cluster"
        node_name = "${var.environment_name}-node-${count.index}"
    }
}
