variable "nodes_ingress_rule_count" {
    default  = 1
}

variable "nodes_ingress_from" {
    default {
        "0" = "22"
    }
}

variable "nodes_ingress_to" {
    default {
        "0" = "22"
    }
}

variable "nodes_ingress_protocol" {
    default{
        "0" = "tcp"
    }
}

variable "nodes_ingress_cidr_block" {
    default {
        "0" = "0.0.0.0/0"
    }
}

variable "nodes_egress_rule_count" {
    default  = 1
}

variable "nodes_egress_from" {
    default {
        "0" = "22"
    }
}

variable "nodes_egress_to" {
    default {
        "0" = "22"
    }
}

variable "nodes_egress_protocol" {
    default{
        "0" = "tcp"
    }
}

variable "nodes_egress_cidr_block" {
    default {
        "0" = "0.0.0.0/0"
    }
}

variable "lb_ingress_rule_count" {
    default  = 1
}

variable "lb_ingress_from" {
    default {
        "0" = "22"
    }
}

variable "lb_ingress_to" {
    default {
        "0" = "22"
    }
}

variable "lb_ingress_protocol" {
    default{
        "0" = "tcp"
    }
}

variable "lb_ingress_cidr_block" {
    default {
        "0" = "0.0.0.0/0"
    }
}

variable "lb_egress_rule_count" {
    default  = 1
}

variable "lb_egress_from" {
    default {
        "0" = "22"
    }
}

variable "lb_egress_to" {
    default {
        "0" = "22"
    }
}

variable "lb_egress_protocol" {
    default{
        "0" = "tcp"
    }
}

variable "lb_egress_cidr_block" {
    default {
        "0" = "0.0.0.0/0"
    }
}
