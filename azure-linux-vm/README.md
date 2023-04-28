# azure-linux-vm

Create a complete Linux environment and supporting resources with Terraform. Such as virtual network, subnet, public IP address, etc.

## Create the Terraform resources

### Initialize Terraform

Run terraform init to initialize the Terraform deployment. This command downloads the Azure provider required to manage your Azure resources.

```sh
terraform init -upgrade
```

> The `-upgrade` parameter upgrades the necessary provider plugins to the newest version that complies with the configuration's version constraints.

### Create a Terraform execution plan

Run terraform plan to create an execution plan.

```sh
terraform plan -out main.tfplan
```

> The `terraform plan` command creates an execution plan, but doesn't execute it. Instead, it determines what actions are necessary to create the configuration specified in your configuration files. This pattern allows you to verify whether the execution plan matches your expectations before making any changes to actual resources.

> The optional `-out` parameter allows you to specify an output file for the plan. Using the `-out` parameter ensures that the plan you reviewed is exactly what is applied.

### Apply a Terraform execution plan from a file

```sh
terraform apply main.tfplan
```

### Connect to the virtual machine

To use SSH to connect to the virtual machine, do the following steps:

1. `terraform output -raw tls_private_key > id_rsa`
2. `chmod 600 id_rsa`
3. `terraform output public_ip_address`
4. `ssh -i id_rsa mainuser@<public_ip_address>`

## Destroy the Terraform resources

When you no longer need the resources created by this sample, you can destroy them by running the following command:

```sh
terraform destroy
```

Or you can create a destroy plan and apply it:

```sh
terraform plan -destroy -out main.destroy.tfplan
```

```sh
terraform apply main.destroy.tfplan
```
