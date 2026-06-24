terraform {
  cloud {
    organization = "HCLIT"
    workspaces {   
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}
