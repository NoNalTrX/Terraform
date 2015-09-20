variable "ipList" {
    default = {
	    ssh	= "0.0.0.0/0"
    }
}

variable "zones" {
    default = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "environment_name" {
    default = "NA"
}
