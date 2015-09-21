variable "lb" {
    default = {
        instance_port           = "8080"
        instance_protocol       = "http"
        port                    = "80"
        protocol                = "http"
        hc_healthy_threshold    = "2"
        hc_unhealthy_threshold  = "2"
        hc_timeout              = "3"
        hc_target               = "http:8080/"
        hc_interval             = 30
    }
}
