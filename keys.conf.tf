resource "aws_key_pair" "deployer" {
    key_name    = "${var.key.key_name}"
    public_key  = "${var.key.public_key}"
}
