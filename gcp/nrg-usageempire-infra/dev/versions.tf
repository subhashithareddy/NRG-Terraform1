terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~>6.49.1"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "~>6.49.1"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.7.2"
    }
  }
  required_version = "1.12.2"
}