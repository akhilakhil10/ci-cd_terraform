provider "google" {
  credentials = file("./dev-project-403711-5c595bb51180.json")
  project     = "dev-project-403711"
}

resource "null_resource" "copy_files" {
  triggers = {
    files = "${path.module}/./dbt_project/*"
  }

  provisioner "local-exec" {
    command = "gsutil -m cp -r ${path.module}/./dbt_project/* gs://terraformbuckettest/dags/"
  }
}
