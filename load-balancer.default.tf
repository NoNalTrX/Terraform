variable "lb" {
    default = {
        instance_port		= "8080"
        instance_protocol	= "HTTP"
        lb_port			= "80"
	lb_protocol		= "HTTP"
	
    }
}
