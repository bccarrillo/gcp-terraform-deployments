module "cloudrun" {
  source       = "../../modules/cloudrun"
  service_name = "demo-cloudrun-prod-v2"
  region       = "us-central1"
  image        = "gcr.io/cloudrun/hello"
}