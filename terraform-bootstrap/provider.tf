terraform {
    required_version = ">= 1.5.0"
  cloud {
    organization = "UL-ULSE"
    workspaces {
      name = "bootstrap-workspace"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "4.14.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}