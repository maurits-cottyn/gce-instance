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
                network            = "default"
                subnetwork         = "default"
                subnetwork_project = "maurits-dev"
                
                public_ip = {
                    enabled = false
                }
            }
        ]
    }
}
