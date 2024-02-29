# Azure Grafana Dashboard Terraform module
A Terraform module which configures your Azure Grafana Dashboard.  
[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

## Example
```hcl
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | ~> 2.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | ~> 2.12 |

## Resources

| Name | Type |
|------|------|
| [azurerm_dashboard_grafana.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dashboard_grafana) | resource |
| [azurerm_resource_provider_registration.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_provider_registration) | resource |
| [azurerm_role_assignment.grafana](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.grafana_admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [grafana_data_source.prometheus](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_enabled"></a> [api\_key\_enabled](#input\_api\_key\_enabled) | Whether or not API key authentication is enabled for the Grafana instance. | `bool` | `false` | no |
| <a name="input_grafana_admin_object_id"></a> [grafana\_admin\_object\_id](#input\_grafana\_admin\_object\_id) | The object ID of the user to assign the Grafana Admin role to. | `string` | n/a | yes |
| <a name="input_grafana_auth_token"></a> [grafana\_auth\_token](#input\_grafana\_auth\_token) | The authentication token for the Grafana instance. | `string` | `""` | no |
| <a name="input_grafana_major_version"></a> [grafana\_major\_version](#input\_grafana\_major\_version) | The major version of Grafana to use. | `string` | `"9"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of this managed Grafana instance. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to create the resources in. | `string` | n/a | yes |
| <a name="input_monitor_workspace"></a> [monitor\_workspace](#input\_monitor\_workspace) | The Azure Monitor Workspace to integrate with Grafana. | <pre>object({<br>    name                                = string<br>    id                                  = string<br>    query_endpoint                      = string<br>    default_data_collection_endpoint_id = string<br>    default_data_collection_rule_id     = string<br>  })</pre> | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is enabled for the Grafana instance. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to create the resources in. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID of the subscription to create the resources in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint of this Managed Grafana instance. |
| <a name="output_grafana_version"></a> [grafana\_version](#output\_grafana\_version) | The version of Grafana running on this Managed Grafana instance. |
| <a name="output_identity_principal_id"></a> [identity\_principal\_id](#output\_identity\_principal\_id) | The principal ID of the system-assigned identity of this Managed Grafana instance. |
| <a name="output_identity_tenant_id"></a> [identity\_tenant\_id](#output\_identity\_tenant\_id) | The tenant ID of the system-assigned identity of this Managed Grafana instance. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of this Managed Grafana instance. |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | The name of this Managed Grafana instance. |

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2023 [Blackbird Cloud](https://www.blackbird.cloud)
