resource "google_compute_network" "logging" {
    name                    = "${var.network_name}"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
    name            = "${var.subnetwork_name}"
    ip_cidr_range   = "${var.ip_cidr_range}"
    region          = "${var.region}"
    network         = "${google_compute_network.logging.name}"
}

resource "google_compute_firewall" "internal_allow" {
    name          = "${var.network_name}-allow-internal"
    network       = "${google_compute_network.logging.name}"
    source_ranges = ["${google_compute_subnetwork.network-with-private-secondary-ip-ranges.ip_cidr_range}"]
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["0-65535"]
    }

    allow {
      protocol = "udp"
      ports    = ["0-65535"]
    }
}

resource "google_compute_firewall" "external_ssh_port" {
    name          = "${var.network_name}-allow-ssh"
    network       = "${google_compute_network.logging.name}"
    source_ranges = ["5.45.85.206", "206.54.167.10", "88.85.84.209"]
    allow {
      protocol = "tcp"
      ports    = ["333", "22"]
    }
}
