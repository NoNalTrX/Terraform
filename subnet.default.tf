variable "vpc" {
    default = {
        owner_id = "NA"
        cidr_block = "10.30.0.0/16"
    }
}

variable "cidr_blocks" {
    default = {
        "0" = "10.30.16.0/20"
        "1" = "10.30.32.0/20"
        "2" = "10.30.0.0/20"
    }
}

variable "vpc_private_subnet" {
    default = {
        cidr_block = "10.30.1.0/24"
    }
}
