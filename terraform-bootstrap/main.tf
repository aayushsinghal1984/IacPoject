resource "tfe_workspace" "infra_workspaces" {
  for_each     = toset(var.env_list)
  name         = "infra-${each.value}"
  organization = var.org_name
}