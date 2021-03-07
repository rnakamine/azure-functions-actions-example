# azure-functions-actions-example

![Build Status](https://github.com/rnakamine/azure-functions-actions-example/workflows/build/badge.svg) [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

[WIP] This is a repository for sample github actions for deploying azure functions.

## Usage

### Setting Credentials

Create an Azure service principal with the Azure CLI
```
az ad sp create-for-rbac \
  --name "<APP_NAME>" \
  --role contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP>/providers/Microsoft.Web/sites/<APP_NAME> \
  --sdk-auth
```
