variable key_file {
    description = "Path to key used for GCP "
}

variable region {
    description = "Set region."
    default     = "europe-west4"
}

variable project_name {
    description = "Set GC project name."
}

variable ip_cidr_range {
    description = "Set range ip addresses."
}

variable network_name {
    description = "Set name our network."
}

variable subnetwork_name {
    description = "Set name our subnetwork."
}

variable data-node-param {
    description = "Set data-node parameters for our instances."
    default     = {
      "name"          = "data-node"
      "count"         = "1"
      "machine_type"  = "n1-standard-1"
      "zone"          = "europe-west4-a"
      "tag"           = "es-cluster-member"
      "image"         = "debian-cloud/debian-9"
      "size"          = "30"
      "disk_type"     = "pd-ssd"
    }
}

variable master-eligible-node-param {
    description = "Set master-eligible-node parameters for our instances."
    default     = {
      "name"          = "master-eligible-node"
      "count"         = "1"
      "machine_type"  = "n1-standard-1"
      "zone"          = "europe-west4-a"
      "tag"           = "es-cluster-member"
      "image"         = "debian-cloud/debian-9"
      "size"          = "30"
      "disk_type"     = "pd-ssd"
    }
}

variable coordinating-only-node-param {
    description = "Set master-eligible-node parameters for our instances."
    default     = {
      "name"          = "coordinating-only-node"
      "count"         = "1"
      "machine_type"  = "n1-standard-1"
      "zone"          = "europe-west4-a"
      "tag"           = "es-cluster-member"
      "image"         = "debian-cloud/debian-9"
      "size"          = "30"
      "disk_type"     = "pd-ssd"
    }
}
