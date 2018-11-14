provider "google" {
   credentials = "${file("${var.key_file}")}"
   project     = "${var.project_name}"
   region      = "${var.region}"
}

module "networking" {
    source          = "./modules/networking"
    network_name    = "${var.network_name}"
    subnetwork_name = "${var.subnetwork_name}"
    ip_cidr_range   =  "${var.ip_cidr_range}"
    region          = "${var.region}"
}

module "data-node" {
    source       = "./modules/compute/data-node"
    name         = "${var.data-node-param["name"]}"
    count        = "${var.data-node-param["count"]}"
    machine_type = "${var.data-node-param["machine_type"]}"
    zone         = "${var.data-node-param["zone"]}"
    tag          = "${var.data-node-param["tag"]}"
    image        = "${var.data-node-param["image"]}"
    size         = "${var.data-node-param["size"]}"
    type         = "${var.data-node-param["disk_type"]}"
    subnetwork   = "${module.networking.subnetwork}"
}

module "master-eligible-node" {
    source       = "./modules/compute/master-eligible-node"
    name         = "${var.master-eligible-node-param["name"]}"
    count        = "${var.master-eligible-node-param["count"]}"
    machine_type = "${var.master-eligible-node-param["machine_type"]}"
    zone         = "${var.master-eligible-node-param["zone"]}"
    tag          = "${var.master-eligible-node-param["tag"]}"
    image        = "${var.master-eligible-node-param["image"]}"
    size         = "${var.master-eligible-node-param["size"]}"
    type         = "${var.master-eligible-node-param["disk_type"]}"
    subnetwork   = "${module.networking.subnetwork}"
}

module "coordinating-only-node" {
    source       = "./modules/compute/coordinating-only-node"
    name         = "${var.coordinating-only-node-param["name"]}"
    count        = "${var.coordinating-only-node-param["count"]}"
    machine_type = "${var.coordinating-only-node-param["machine_type"]}"
    zone         = "${var.coordinating-only-node-param["zone"]}"
    tag          = "${var.coordinating-only-node-param["tag"]}"
    image        = "${var.coordinating-only-node-param["image"]}"
    size         = "${var.coordinating-only-node-param["size"]}"
    type         = "${var.coordinating-only-node-param["disk_type"]}"
    subnetwork   = "${module.networking.subnetwork}"
}
