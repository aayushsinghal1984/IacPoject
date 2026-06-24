terraform {
  cloud {
    organization = "HCLIT"
    workspaces {
     tags = ["statefile"]
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
    token    = var.tfe_token
}
