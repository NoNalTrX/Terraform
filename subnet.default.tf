variable "vpc" {
    default = {
        owner_id = "NA"
        cidr_block = "10.30.0.0/16"
    }
}

variable "subnet" {
    default = {
	    count = 1
	}
}

variable "cidr_blocks" {
    default = {
        "0" = "10.30.16.0/20"
    }
}
