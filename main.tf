provider "tfe" {
   hostname = var.hostname
   token    = var.token
}

resource "tfe_organization" "test" {
      name  = "tfe-created-org"
    email = "pleung@hashicorp.com"
}
