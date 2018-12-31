# Configure the Google Cloud tfstate file location
terraform {
  backend "gcs" {
    bucket = "deepu-playground" //TODO pass as variable
    prefix = "terraform"
    credentials = "account.json"
  }
}
