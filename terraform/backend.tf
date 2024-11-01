terraform {
  backend "gcs" {
    bucket = "hijra-440311-tfstate"
    prefix = "main"
  }
}