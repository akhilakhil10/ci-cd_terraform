provider "google" {
  credentials = jsondecode(base64decode(var.gcs_key_base64))
  project     = "dev-project-403711"
  region      = "us-central1"
}


variable "gcs_key_base64" {
  description = "Base64-encoded Google Cloud service account key"
  type        = string
}


resource "null_resource" "copy_files" {
  triggers = {
    files = "${path.module}/./dbt_project/*"
  }

  provisioner "local-exec" {
    command = "gsutil -m cp -r ${path.module}/./dbt_project/* gs://terraformbuckettest/dags/"
  }
}
