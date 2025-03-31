resource "keycloak_authentication_flow" "custom_auth_flow" {
  realm_id    = keycloak_realm.restusers.id
  alias       = "Flow"
  provider_id = "basic-flow"
  description = "Flujo de autenticación con código aleatorio"
}

resource "keycloak_authentication_execution" "custom_auth_exec" {
  realm_id          = keycloak_realm.restusers.id
  parent_flow_alias = keycloak_authentication_flow.custom_auth_flow.alias
  authenticator     = "custom-authenticator"
  requirement       = "REQUIRED"
}
