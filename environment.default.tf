variable "ipList" {
    default = {
	    ssh	= "0.0.0.0/0"
    }
}

variable "zones" {
    default = {
	    "0" = "eu-west-1a"
    }
}

variable "environment_name" {
    default = "NA"
}
