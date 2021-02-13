# Azure-Devops
This is intended as a resource for anyone interested in learning about Terraform, Azure Devops, Azure Portal, and Kubernetes. It creates Azure Devops projects, repositories, and pipelines. The generated azure devops pipelines will create resources like Kubernetes, resource groups, and container registries accessible in Azure Portal.

By going through these tutorials you'll learn about how Terraform works, what it can create within Azure, and how easy Terraform makes it to wipe away things when we're done using them.


## Setup
- [Sign up](https://signup.azure.com/) for an account in Azure.
- Confirm you can access the [azure portal](https://portal.azure.com) and [azure devops](https://dev.azure.com/)
- Run the initializeTerraformBackend.sh
  - This will create a terraform state file in Azure that's necessary for running Terraform against azure resources
- update backend.tf's "tstate<number>" with the storage_account_name outputted by the above script.



## Tutorials
Below are the projects that can be exercised as part of this set of tutorials.
Note: the initial project, azuredevops, creates Azure Devops Projects, repositories, and pipelines for other areas. It doesn't receive its own Azure Devops Project.

- AzureDevOps
  - location: this repository.
  - Purpose: To create Azure Devops Projects, Repositories, and Pipelines.
  - Terraform resources exercised
    - azure devops project
    - Resource Group used to store the tf state
    - service connections to allow pipelines to create azure resources
    - Git repositories imported from Github to various AzureDevops Projects
- AzureResourceGroup
  - location: [Github AzureResourceGroup](https://github.com/DanSibbernsen/azureResourceGroup.git)
  - Purpose: creates an azure resource group
- azureContainerRegistry
  - location: [Github AzureContainerRegistry](https://github.com/DanSibbernsen/azureContainerRegistry.git)
  - Purpose: creates an Azure Container Registry (acr)
- azureKubernetes
  - location: [Github azureKubernetes](https://github.com/DanSibbernsen/azureKubernetes.git)
  - Purpose: spins up kubernetes cluster. Also creates an acr for use with the kubernetes cluster

## Terraform basics
Steps
<details><summary> login to azure</summary>

```
# logs you in to azure. Behind the scenes this is used by terraform
az login
```
</details>

<details><summary> Use terraform </summary>

```
terraform init # initializes terraform looking at backend / provider materials within *.tf files
terraform plan # reconciles your terraform definitions with the resources in Azure using the tfstate file, and outputs the differences in your current plan
terraform apply # applies changes to azure. Will prompt after outputting plan
terraform destroy # destroys resources in Azure.
```
</details>

This should be enough to get around this space.

Hope you enjoy this, and please make requests in by creating issues for anything new you'd like to see.
