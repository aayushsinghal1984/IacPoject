terraform {
  cloud {
    organization = var.org_name
    workspaces {   
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}
