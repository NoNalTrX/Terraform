variable "elastic" {
    default = {
        ami_image = "to be defined"
        availability_zone = "NA"
        instance_type     = "t2.micro"
	count		  = 1
	
    }
}
