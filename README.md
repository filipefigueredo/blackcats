<h1 align="center">Welcome to demo-tf-multirepo-bdd👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg" />
  <a href="LICENSE.md" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-blue.svg" />
  </a>
</p>

> Repository for demonstrate terraform 

## Workflows overview

![Worflows overview](https://user-images.githubusercontent.com/42495290/154413846-d62759ce-f2fe-44dc-bb82-5efde8d32723.jpg)


## Running / testing configuration files locally

```bash
# Authenticate with Terraform Cloud
# Note: It's necessary to create a personal API token to login in TF Cloud
$ terraform login

# Initialize and install plugins Terraform needs
$ terraform init

# Preview the changes Terraform will make to match your configuration.
$ terraform plan

# Apply / create resources based on planned changes
$ terraform apply

# Destroy resources
$ terraform apply -destroy
```

## Setting up Github workflows

1. Create a resource group and a [Key vault](https://docs.microsoft.com/en-us/azure/key-vault/general/quick-create-cli):

```bash
# Replace {resource-group-name}, {resource-group-location} with name and location your resource group
$ az group create --name "{resource-group-name}" --location "{resource-group-location}"

# Replace {your-unique-keyvault-name}, {resource-group-name}, {keyvault-location}
# with keyvault name,resource group name and keyvault location of your keyvault
$az keyvault create --name "{your-unique-keyvault-name}" \
  --resource-group "{resource-group-name}" \
  --location "{keyvault-location}"
```

2. At the GitHub repository, create a [secret](https://aka.ms/create-secrets-for-GitHub-workflows) and name it `AZURE_KEY_VAULT_NAME`.

3. Create a [Service Principal (SPN)](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli) in Azure with Contributor rights:

```bash
# Replace {myApp}, {subscription-id}, {resource-group} with the application name, subscription and
# resource group details of your keyvault
$ az ad sp create-for-rbac --name "{myApp}" --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
  --sdk-auth
```

The CLI should output a JSON object similar to this:
```JSON
{
"clientId": "<GUID>",
"clientSecret": "<GUID>",
"subscriptionId": "<GUID>",
"tenantId": "<GUID>",
(...)
}
```
Add the json output as a [secret](https://aka.ms/create-secrets-for-GitHub-workflows) and name it `AZURE_CREDENTIALS` at GitHub repository.

4. Assign key vault key permissions `get`, `list` to the Service Principal.

```bash
# Replace {your-unique-keyvault-name}, {SPN} with the keyvault name and the name of
# a service principal that will receive permission.
az keyvault set-policy -n "{your-unique-keyvault-name}" \
  --secret-permissions get list \
  --spn "{SPN}"

```

6. Create a [Team API Token](https://www.terraform.io/cloud-docs/users-teams-organizations/api-tokens#team-api-tokens) in Terraform Cloud (This is intended for performing plans and applies via a CI/CD pipeline)

7. Store the [Team API Token](https://www.terraform.io/cloud-docs/users-teams-organizations/api-tokens#team-api-tokens) in the key vault in a key with the name `terraformApiToken`

```bash
# Replace {your-unique-keyvault-name}, {team-api-token} with the keyvault name and the Team API Token.
az keyvault secret set --vault-name "{your-unique-keyvault-name}" \
  --name "terraformApiToken" \
  --value "{team-api-token}"
```

## Contributing

We've set up a separate document for our [contribution guidelines](CONTRIBUTING.md).

## Release History

Please see [CHANGELOG.md](CHANGELOG.md).

## Author(s)

👤 **Nmbrs - Infra Squad**

## 📝 License

This project is [MIT](LICENSE.md) licensed.
