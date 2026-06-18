terraform {
    required_version = ">= 1.5.0"
  cloud {
    organization = "UL-ULSE"
    workspaces {
      
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.50"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}
