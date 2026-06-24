resource "tfe_workspace" "workspace" {
  name         = var.workspace_name
  organization = "HCLIT"

  tag_names = ["statefile"]
}