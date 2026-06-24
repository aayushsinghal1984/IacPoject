terraform {
  cloud {
    organization = var.organization
    workspaces {   
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}
