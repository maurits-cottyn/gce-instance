project_id       = "maurits-dev"
region           = "europe-west1"
namespace        = "dgc"
environment      = "euw1"
stage            = "dev"
name             = "test"
label_value_case = "lower"
label_key_case   = "lower"
# set global label order for consistency, can be overwritten on module level
label_order  = ["namespace", "stage", "name", "environment"]

tags = {
    "team" = "internal-dev"
}

vpc = {
  "gce-nw-1" = {
    project      = "maurits-dev"
    description  = "Network for Belgian GCE development"
    routing_mode = "REGIONAL"

    subnets = {
      "europe-west1-development" = {
        name                  = "gce-instances"
        cidr_primary          = "10.20.0.0/16"
        region                = "europe-west1"
        private_google_access = true
        secondary_ranges = {
          "group-1" = {
            name       = "group-1"
            cidr_range = "100.64.0.0/16"
          }
          "group-2" = {
            name       = "group-2"
            cidr_range = "10.30.0.0/20"
          }
        }
      }
    }
  }
}

vms = {
    "gce-instance-1" = {
        project_id   = "maurits-dev"
        description  = "test compute instance"

        machine_type              = "e2-micro"
        zone                      = "europe-west1-b"
        deletion_protection       = "false"
        allow_stopping_for_update = "true"

        boot_disk = {
            name        = "dsk-std-boot-0"
            type        = "pd-standard"
            zone        = "europe-west1-b"
            auto_delete = true
            image       = "debian-cloud/debian-11"
            iterator    = "0"
            workload    = "boot"
        }

        service_account = {
            email  = "maurits-dev@maurits-dev.iam.gserviceaccount.com"
            scopes = ["cloud-platform"]
        }

        network_interfaces = [
            {
                network            = "nw-dev-test-euw1"
                subnetwork         = "nwr-dev-gce-instances-euw1"
                subnetwork_project = "maurits-dev"
                
                public_ip = {
                    enabled = false
                }
            }
        ]
    }
}

firewalls = {}