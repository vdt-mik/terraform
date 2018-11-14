variable name {
    description = "Set name our instance."
    default     = "data_node"
}

variable count {
    description = "Set number of instances to create."
    default     = "1"
}

variable machine_type {
    description = "Set machine type for instance."
    default     = "n1-standard-1"
}

variable zone {
    description = "Set zone where instance will be locate."
    default     = "europe-west4-a"
}

variable tag {
    description = "Set tag for our instance."
    default     = "es-cluster-member"
}

variable image {
    description = "Set disk image for our instance."
    default     = "debian-cloud/debian-9"
}

variable size {
    description = "Set drive size for our instance."
    default     = "30"
}

variable type {
    description = "Set disk type for our instance."
    default     = "pd-ssd"
}

variable subnetwork {
    description = "Set subnetwork for our instance."
    default     = "default"
}

# variable network_ip {
#     description = "Set internal network ip for our instance."
# }
#
# variable nat_ip {
#     description = "Set external network ip for our instance."
# }
