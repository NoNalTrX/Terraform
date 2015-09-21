variable "elastic" {

    description = "Instances to run an ElasticSearch"

    default = {
        ami_image = "to be defined"
        availability_zone = "NA"
        instance_type     = "t2.micro"
	associate_public_ip_address = false
    	count		  = 1
	
    }
}
