terraform {

provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
  version  = "~> 0.15.0"
}

  resource "tfe_organization" "test" {
    name  = "tfe-created-org"
    email = "pleung@hashicorp.com"
  }

  resource "tfe_team" "test" {
    name         = "tfe-created-team"
    organization = tfe_organization.test.id
  }

  resource "tfe_organization_membership" "test" {
    organization = tfe_organization.test.id
    email        = "pleung@hashicorp.com"
  }

  resource "tfe_team_organization_member" "test" {
    team_id                    = tfe_team.test.id
    organization_membership_id = tfe_organization_membership.test.id
  }
}