# Introduction 
This project demonstrates how to create resources in an Azure subscription in an automated pipeline

There are two branches of interest. One for Azure Resource Manager (`arm`) deployments and the other for Terraform (`master`)

These deployments utilise the multi-stage YAML pipelines for both build and release processes, rather than the classic Build and Release pipelines.

## Permissions

A service principal with permission to create the requested resources should be created in the receiving subscription.

The service principal details are read as a string when using the ARM deployment:

### ARM
```
ConnectedServiceName: 'terraform-deployments-cross-subscription'
```

### Terraform
```
export ARM_SUBSCRIPTION_ID="$(customer1-subscriptionId)"
export ARM_CLIENT_ID="$(customer1-clientId)"
export ARM_CLIENT_SECRET="$(customer1-clientSecret)"
export ARM_TENANT_ID="$(customer1-tenantId)"
```

For the terraform deployment, these details are stored in Azure Key Vault and injected at build time using another service principal with permissions to Get and List secrets from Azure Key Vault.