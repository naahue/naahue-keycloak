resource "keycloak_openid_client" "myclient" {
  realm_id = keycloak_realm.restusers.id
  client_id = "myclient"
  name = "client"
  enabled = true
  access_type = "PUBLIC"
  standard_flow_enabled = true
  valid_redirect_uris  = ["http://localhost:3000/*"]
}