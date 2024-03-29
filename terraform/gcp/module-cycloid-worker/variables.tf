# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}


#
# Instance
#
variable "vm_machine_type" {
  description = "Machine type for the Cycloid worker"
  default     = "n2-standard-2"
}

variable "vm_disk_size" {
  description = "Disk size for the Cycloid worker (Go)"
  default = "20"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  default     = "cycloid"
}

variable "keypair_public" {
  description = "The public SSH key, for SSH access to newly-created instances"
}


#
# Cycloid worker
#
variable "team_id" {
  description = "Cycloid team ID"
  default     = ""
}

variable "worker_key" {
  description = "Cycloid worker private key"
  default = ""
}


# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}