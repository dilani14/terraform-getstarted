# terraform-getstarted with Azure

Sample terraform configuration files to provision resources in Azure required for an web api which connects with a sql database as its data source.
### Resources to provision
* resource group
* app service plan
* app service
* sql databse server
* sql databse

### Tools and software used
* Terraform v0.15.3
* Azure CLI
* VS Code
* HashiCrop Terraform Extension for VS Code

### Steps to get started
1. Install terraform locally - [Download Terraform](https://www.terraform.io/downloads.html)
2. Install Azure CLI
3. Clone the repo and open infrastructure folder in powershell
4. Login to azure using command **az login** and set the subscription to need to apply changes
5. Run command - **terraform init**
6. Run command - **terraform plan**
7. Run command - **terraform apply**
8. If you no longer required the resources use command **terraform destroy** to clean


