resource "keycloak_custom_user_federation" "custom_user_federation" {
  depends_on = [ keycloak_user.user ]
  name = "test"
  realm_id = keycloak_realm.restusers.id
  provider_id = "rest-repo-provider"
  cache_policy = "NO_CACHE"
  priority = 0
  enabled = true
  config = {
    baseURL = "http://mmock:8083"
  }
}
