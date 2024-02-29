locals {
  global = {
    location        = "westeurope"
    subscription_id = "00000000-0000-0000-0000-000000000000"
    admin_group_id  = "00000000-0000-0000-0000-000000000000"
  }
  secrets = {
    grafana_auth_token = "00000000-0000-0000-0000-000000000000"
  }
}

module "azurerm_dashboard_grafana" {
  source  = "blackbird-cloud/dashboard-grafana/azurerm"
  version = "~> 1"

  instance_name           = "grafana-dashboard"
  resource_group_name     = "shared-tools"
  location                = local.global.location
  grafana_admin_object_id = local.global.admin_group_id
  monitor_workspace = {
    name                                = "monitor-workspace"
    id                                  = "00000000-0000-0000-0000-000000000000"
    query_endpoint                      = "https://monitor-workspace-api.azuremonitor.com"
    default_data_collection_endpoint_id = "00000000-0000-0000-0000-000000000000"
    default_data_collection_rule_id     = "00000000-0000-0000-0000-000000000000"
  }
  subscription_id    = local.global.subscription_id
  api_key_enabled    = true
  grafana_auth_token = local.secrets.grafana_auth_token
}
