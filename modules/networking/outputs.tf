output "subnetwork" {
    value = "${google_compute_subnetwork.network-with-private-secondary-ip-ranges.name}"
}

# output "google_compute_address.internal_with_subnet_and_address.address" {
#     value = ["${google_compute_address.internal_with_subnet_and_address.*.address}"]
# }
#
# output "nat_ip" {
#     value = ["${google_compute_address.static.*.address}"]
# }
