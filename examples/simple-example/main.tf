provider "google" {
}

module "my-servie-account" {
  source = "app.terraform.io/simpleenergytech/service-account/gcp"

  project_id  = module.project.project_id
  name        = "my-servie-account"
  description = "a description of my service accout"
}
