product_family     = "dso"
product_service    = "aks"
environment        = "qa"
environment_number = "000"
region             = "eastus"

# az aks get-versions --location eastus
kubernetes_version = "1.28"
#agents_count              = 2
agents_size = "Standard_D2_v2"

enable_auto_scaling       = true
agents_max_count          = 5
agents_min_count          = 2
agents_availability_zones = [1, 2]

# Default is standard Load Balancer
# net_profile_outbound_type  = "userDefinedRouting"

vnet_subnet_id = "/subscriptions/4554e249-e00f-4668-9be3-da31ed200163/resourceGroups/dso-net-eus-qa-000-rg-000/providers/Microsoft.Network/virtualNetworks/dso-net-eus-qa-000-vnet-000/subnets/aks-mgmt-sbnt"

# default service cidr is 10.0.0.0/16
# Only supported when network_plugin is kubenet
net_profile_service_cidr   = "10.2.0.0/16"
net_profile_dns_service_ip = "10.2.0.10"
net_profile_pod_cidr       = "10.3.0.0/16"

# The MSI must have "Contributor" role on the resource group
# If not specified, the resource group will be created by this module
# resource_group_name = "govt-k8s-rg-000"

# kubenet or azure
network_plugin = "kubenet"

# private cluster
private_cluster_enabled = true

# Additional VNET links
additional_vnet_links = {
  bastion-vnet-line = "/subscriptions/4554e249-e00f-4668-9be3-da31ed200163/resourceGroups/dso-k8s-001/providers/Microsoft.Network/virtualNetworks/dso-k8s-ado-vnet-001"
}

# UserAssigned or SystemAssigned
# In either case, the MSI will be created by this module
identity_type = "UserAssigned"

# Node pools if required
# The key of the node-pool must be <= 5 characters
node_pools = {

  #   lin1 = {
  #     name       = "linpool1"
  #     node_count = 1
  #     tags = {
  #       application = "App1"
  #     }
  #     vm_size = "Standard_D2_v2"
  #     mode    = "User"
  #     node_labels = {
  #       application = "App1"
  #     }
  #     os_sku         = "Ubuntu"
  #     os_type        = "Linux"
  #     vnet_subnet_id = "/subscriptions/4554e249-e00f-4668-9be3-da31ed200163/resourceGroups/dso-net-eus-qa-000-rg-000/providers/Microsoft.Network/virtualNetworks/dso-net-eus-qa-000-vnet-000/subnets/aks-pool-sbnt"
  #   }
}

# Fill in the below details to enable AAD integration

# This must be set to true to enable AAD integration
rbac_aad = false
# this is recommended to be set to true
rbac_aad_managed = false
# this is true by default. no need to set explicitly
role_based_access_control_enabled = true

# Uncomment below for AAD integration
# rbac_aad_admin_group_object_ids = ["e61e36e5-7fdc-4d47-9e64-9ab3628140a7"]
# whether Azure RBAC or k8s RBAC will be enabled
rbac_aad_azure_rbac_enabled = false

# Enable/disable the admin user
local_account_disabled = false

key_vault_secrets_provider_enabled = true
secret_rotation_interval           = "2m"
secret_rotation_enabled            = true
additional_key_vault_ids           = []

# Workload identity related variables

# oidc_issuer_enabled       = true
# workload_identity_enabled = true
# enable_rbac_authorization = true

monitor_metrics = {}

cluster_identity_role_assignments   = {}
node_pool_identity_role_assignments = {}

dns_zone_suffix = "azmk8s.io"

tags = {
  owner       = "Launch DSO"
  purpose     = "Private cluster using Terragrunt"
  environment = "qa"
}
