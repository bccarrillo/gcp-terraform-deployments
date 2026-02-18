terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = "pruebas-gcp-487113"
  region  = "us-central1"
}

resource "google_cloud_run_v2_service" "demo" {
  name     = "demo-cloudrun-v2"
  location = "us-central1"

  deletion_protection = false

  template {
    containers {
      image = "gcr.io/cloudrun/hello"
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  name     = google_cloud_run_v2_service.demo.name
  location = google_cloud_run_v2_service.demo.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = google_cloud_run_v2_service.demo.uri
}
