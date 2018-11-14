resource "google_compute_instance" "master-eligible-node" {
    name         = "${var.name}-0${count.index + 1}"
    count        = "${var.count}"
    machine_type = "${var.machine_type}"
    zone         = "${var.zone}"
    tags         = ["${var.tag}", "${var.name}-0${count.index + 1}"]
    boot_disk {
        initialize_params {
            image = "${var.image}"
            size  = "${var.size}"
            type  = "${var.type}"
        }
    }
    network_interface {
        subnetwork = "${var.subnetwork}"
        network_ip = "${element(google_compute_address.internal_with_subnet_and_address.*.address, count.index)}"
        access_config {
            nat_ip = "${element(google_compute_address.static.*.address, count.index)}"
        }
    }
}

resource "google_compute_address" "static" {
    name       = "es-${var.name}-0${count.index + 1}-${var.zone}-ext"
    count      = "${var.count}"
}

resource "google_compute_address" "internal_with_subnet_and_address" {
    name         = "es-${var.name}-0${count.index + 1}-${var.zone}-int"
    count        = "${var.count}"
    subnetwork   = "${var.subnetwork}"
    address_type = "INTERNAL"
}
