provider "google" {

  credentials = file("sk.json")

  project = "abstract-bonbon-350713"
  region = "europe-north1"
  zone = "europe-north1-a"
}

//resource "google_compute_instance" "clickhouse" {
//  name = "clickhouse-application-server"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-10"
//    }
//  }
//  metadata_startup_script = file("startup_script_clickhouse.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}
//
//resource "google_compute_instance" "clickhouse2" {
//  name = "clickhouse-application-server2"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-10"
//    }
//  }
//  metadata_startup_script = file("startup_script_clickhouse.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}
//
//resource "google_compute_instance" "clickhouse3" {
//  name = "clickhouse-application-server3"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-10"
//    }
//  }
//  metadata_startup_script = file("startup_script_clickhouse.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}
#####################################################
resource "google_compute_instance" "appserver2" {
  name = "influx-application-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file("startup_script.sh")


  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_instance" "appserver3" {
  name = "influx-application-server2"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file("startup_script.sh")


  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_instance" "appserver4" {
  name = "influx-application-server3"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file("startup_script.sh")


  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
################################################

resource "google_compute_instance" "appserver5" {
  name = "worker-application-server1"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file("startup_script_worker.sh")


  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

//resource "google_compute_instance" "appserver6" {
//  name = "worker-application-server2"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-10"
//    }
//  }
//  metadata_startup_script = file("startup_script_worker.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}
//
//resource "google_compute_instance" "appserver7" {
//  name = "worker-application-server3"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-10"
//    }
//  }
//  metadata_startup_script = file("startup_script_worker.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}
###############################################################
resource "google_compute_instance" "appserver8" {
  name = "orchestrator-application-server1"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata_startup_script = file("startup_script_worker.sh")


  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}



//resource "google_compute_instance" "appserver1" {
//  name = "tsbs-application-server"
//  machine_type = "e2-medium"
//
//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-9"
//    }
//  }
//  metadata_startup_script = file("tsbs-script.sh")
//
//
//  network_interface {
//    network = "default"
//    access_config {
//      # Include this section to give the VM an external IP address
//    }
//  }
//}