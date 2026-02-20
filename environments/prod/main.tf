module "cloudrun" {
  source       = "../../modules/cloudrun"
  service_name = "demo-cloudrun-prod"
  region       = "us-central1"
  image        = "gcr.io/cloudrun/hello"
}