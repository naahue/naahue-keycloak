terraform {
  required_providers {
    keycloak = {
      source  = "registry.terraform.io/keycloak/keycloak"
      version = "~> 5.0.0"
    }
  }
}

provider "keycloak" {
  client_id     = "admin-cli"
  username      = var.admin_username
  password      = var.admin_password
  url           = var.keycloak_url
  base_path     = "" 
}