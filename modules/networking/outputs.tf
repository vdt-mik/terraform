output "subnetwork" {
    value = "${google_compute_subnetwork.network-with-private-secondary-ip-ranges.name}"
}
