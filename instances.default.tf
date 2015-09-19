variable "zone" { 

    default = {
	"0" = "NA"
    }
}

variable "elastic" {
    default = {
        ami_image = "ami-f2b2e185"
        availability_zone = "NA"
        instance_type     = "t2.micro"
	count		  = 2
	
    }
}
